import 'dart:convert';

import 'package:football/http/response_player_scorrers.dart';
import 'package:football/http/response_standing.dart';
import 'package:football/models/player/player_statistics.dart';
import 'package:football/test/test/test.dart';
import 'package:football/util/http_costants.dart';
import 'package:http/http.dart' as http;

class HttpRequest {
  static Future<Response_Standing?> getStading(int idLeague, int season) async {
    String url = "${HttpCostants.URL_STADING}?league=${idLeague}&season=$season";

    var response = await requestAPI(url);
    try {
      return Response_Standing.fromJson(jsonDecode(response.body));
    } catch (error) {
      rethrow;
    }
  }

  static Future<List<Player_Statistics>?>? getTopScorers(
      int idLeague, int season) async {
    String url =
        "${HttpCostants.URL_TOP_SCORERS}?league=${idLeague}&season=$season";
    var response = await requestAPI(url);

    try {
      return Response_Player_TopScorers.fromJson((response.body)).response;
    } catch (error) {
      rethrow;
    }
  }

  static Future<List<Player_Statistics>?>? getTopAssists(
      int idLeague, int season) async {
    String url =
        "${HttpCostants.URL_TOP_ASSISTS}?league=${idLeague}&season=$season";
    var response = await requestAPI(url);

    try {
      return Response_Player_TopScorers.fromJson((response.body)).response;
    } catch (error) {
      rethrow;
    }
  }

  static Future<List<Player_Statistics>?>? getTopYellows(
      int idLeague, int season) async {
    String url =
        "${HttpCostants.URL_TOP_YELLOW_CARDS}?league=${idLeague}&season=$season";
    var response = await requestAPI(url);
    try {
      return Response_Player_TopScorers.fromJson((response.body)).response;
    } catch (error) {
      return null;
    }
  }

  static Future<List<Player_Statistics>?>? getTopReds(
      int idLeague, int season) async {
    String url =
        "${HttpCostants.URL_TOP_RED_CARDS}?league=${idLeague}&season=$season";
    var response = await requestAPI(url);
    try {
      return Response_Player_TopScorers.fromJson((response.body)).response;
    } catch (error) {
      rethrow;
    }
  }

  static Future<Response_Fixture?> getFixture(int idLeague, int season) async {
    String url =
        "${HttpCostants.URL_FIXTURE}?league=${idLeague}&season=$season";
    var response = await requestAPI(url);
    try {
      return Response_Fixture.fromJson(jsonDecode(response.body));
    } catch (error) {
      rethrow;
    }
  }

  static Future<http.Response> requestAPI(String url) async {
    var response = await http.get(Uri.parse(url), headers: HttpCostants.HEADER);
    if (response.statusCode != 200) Future.error("noOK");
    return response;
  }
}
