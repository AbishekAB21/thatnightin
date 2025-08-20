import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thatnightin/features/home/core/providers/home_provider.dart';
import 'package:thatnightin/features/home/core/services/home_service.dart';

class HomeSearchNotifier extends StateNotifier<List<dynamic>> {
  final HomeService _service;
  Timer? _debounce;

  HomeSearchNotifier(this._service) : super([]);

  final Map<String, List<dynamic>> _cache = {};

  void searchMatches(String query) {
    _debounce?.cancel();
    
    _debounce = Timer(Duration(milliseconds: 800), () async {
      if (query.isEmpty) {
        state = [];
        return;
      }

      // Parse query (simple: split by "vs" or detect season year)
      final parts = query.toLowerCase().split("vs");
      int? season;

      // Try to extract season year from query
      final regex = RegExp(r"\b(20\d{2})\b");
      final match = regex.firstMatch(query);
      if (match != null) {
        season = int.parse(match.group(0)!);
      }

      if (parts.length == 1) {
        // Case: Single team
        final teams = await _service.searchTeams(parts[0].trim());
        if (teams.isNotEmpty) {
          final teamId = teams[0]["team"]["id"];
          final fixtures = await _service.getFixtures(
            teamId,
            season: season ?? 2023,
          );
          state = fixtures;
        } else {
          state = [];
        }
      } else if (parts.length == 2) {
        // Case: head-to-head
        final team1 = await _service.searchTeams(parts[0].trim());
        final team2 = await _service.searchTeams(parts[1].trim());

        if (team1.isNotEmpty && team2.isNotEmpty) {
          final id1 = team1[0]["team"]["id"];
          final id2 = team2[0]["team"]["id"];

          final fixtures = await _service.getHeadtoHead(
            id1,
            id2,
            season: season ?? 2023,
          );

          state = fixtures;
        } else {
          state = [];
        }
      }
    });
  }
}

final homeSearchResultsProvider =
    StateNotifierProvider<HomeSearchNotifier, List<dynamic>>((ref) {
      final service = ref.read(homeServiceProvider);
      return HomeSearchNotifier(service);
    });
