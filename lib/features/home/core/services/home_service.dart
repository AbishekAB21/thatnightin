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

  // Get stats from fixtures
  Future<Map<String, dynamic>?> getMatchStats(int fixtureId) async {
    try {
      final response = await _dio.get(
        '/fixtures/statistics',
        queryParameters: {'fixture': fixtureId},
      );

      if (response.statusCode == 200) {
        final data = response.data["response"] as List;

        if (data.length < 2) return null;

        final home = {
          "id": data[0]["team"]["id"],
          "name": data[0]["team"]["name"],
          "logo": data[0]["team"]["logo"],
          "stats": {for (var s in data[0]["statistics"]) s["type"]: s["value"]},
        };

        final away = {
          "id": data[1]["team"]["id"],
          "name": data[1]["team"]["name"],
          "logo": data[1]["team"]["logo"],
          "stats": {for (var s in data[1]["statistics"]) s["type"]: s["value"]},
        };

        return {"home": home, "away": away};
      }
    } catch (e) {
      throw Exception('Error fetching stats : $e');
    }

    return null;
  }
}
