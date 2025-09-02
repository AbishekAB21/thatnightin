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
  // Get stats + score line for a fixture
  Future<Map<String, dynamic>?> getMatchStats(int fixtureId) async {
    try {
      // 1. Fetch statistics
      final statsResponse = await _dio.get(
        '/fixtures/statistics',
        queryParameters: {'fixture': fixtureId},
      );

      if (statsResponse.statusCode != 200) return null;

      final statsData = statsResponse.data["response"] as List;
      if (statsData.length < 2) return null;

      // 2. Fetch score line
      final fixtureResponse = await _dio.get(
        '/fixtures',
        queryParameters: {'id': fixtureId},
      );

      if (fixtureResponse.statusCode != 200) return null;

      final fixtureData = fixtureResponse.data["response"][0];
      final homeGoals = fixtureData["goals"]["home"];
      final awayGoals = fixtureData["goals"]["away"];
      final status = fixtureData["fixture"]["status"]["short"];

      // 3. Build home & away objects like before
      final home = {
        "id": statsData[0]["team"]["id"],
        "name": statsData[0]["team"]["name"],
        "logo": statsData[0]["team"]["logo"],
        "goals": homeGoals,
        "stats": {
          for (var s in statsData[0]["statistics"]) s["type"]: s["value"],
        },
      };

      final away = {
        "id": statsData[1]["team"]["id"],
        "name": statsData[1]["team"]["name"],
        "logo": statsData[1]["team"]["logo"],
        "goals": awayGoals,
        "stats": {
          for (var s in statsData[1]["statistics"]) s["type"]: s["value"],
        },
      };

      return {"status": status, "home": home, "away": away};
    } catch (e) {
      throw Exception('Error fetching match details : $e');
    }
  }
}
