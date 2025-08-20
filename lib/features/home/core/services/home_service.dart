import 'package:dio/dio.dart';
import 'package:thatnightin/common/keys/api_key.dart';

class HomeService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://v3.football.api-sports.io",
      headers: {"x-apisports-key": apiKey},
    ),
  );

  final Map<String, List<dynamic>> _cache = {};

  // Searches API-Football for teams
  Future<List<dynamic>> searchTeams(String query) async {
    if (query.isEmpty) return [];

    if (_cache.containsKey(query)) {
      return _cache[query]!;
    }

    try {
      final response = await _dio.get(
        '/teams',
        queryParameters: {"search": query},
      );

      print("searchTeams response: ${response.data}");

      final data = response.data["response"];

      // Cache
      _cache[query] = data;
      return data;
    } catch (e) {

      print('Something went wrong');
      return [];
    }
  }

  // Get fixtures for a team by ID and season
  Future<List<dynamic>> getFixtures(int teamId, {int season = 2024}) async {
    try {
      final response = await _dio.get(
        '/fixtures',
        queryParameters: {"team": teamId, "season": season},
      );
      print("getFixtures response: ${response.data}");
      return response.data["response"];
    } catch (e) {
      print("Error getting fixtures : $e");
      return [];
    }
  }

  // Get fixtures head-head between two teams
  Future<List<dynamic>> getHeadtoHead(
    int team1,
    int team2, {
    int season = 2023,
  }) async {
    try {
      final response = await _dio.get(
        '/fixtures/headtohead',
        queryParameters: {"h2h": "$team1-$team2", "season": season},
      );
      print("getHeadtoHead response: ${response.data}");
      return response.data['response'];
    } catch (e) {
      print("Something went wrong : $e");
      return [];
    }
  }
}
