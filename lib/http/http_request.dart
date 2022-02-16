import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:football/http/response_player.dart';
import 'package:football/http/response_standing.dart';
import 'package:football/http/response_leagues.dart';
import 'package:football/http/response_fixture.dart';
import 'package:football/repositories/player_player.dart';
import 'package:football/util/http_costants.dart';
import 'package:http/http.dart' as http;

class HttpRequest {
  static bool _noFetchDataFromServer = true;

  static Future<Response_Standing?> getStading(int idLeague, int season) async {
    if (_noFetchDataFromServer) {
      var response = await rootBundle.loadString('json-api/standing.json');
      return Response_Standing.fromJson(jsonDecode(response));
    } else {
      String url =
          "${HttpCostants.URL_STADING}?league=${idLeague}&season=$season";
      var response = await _requestAPI(url);
      try {
        return Response_Standing.fromJson(jsonDecode(response.body));
      } catch (error) {
        rethrow;
      }
    }
  }

  static Future<List<Result_Player>?>? getTopScorers(
      int idLeague, int season) async {
    String url =
        "${HttpCostants.URL_TOP_SCORERS}?league=${idLeague}&season=$season";
    if (_noFetchDataFromServer) {
      var response = await rootBundle.loadString('json-api/top_scorers.json');
      var test = Response_Player.fromJson(response).response;
      log("${test.toString()}");
      return test;
    } else {
      try {
        var response = await _requestAPI(url);
        return Response_Player.fromJson((response.body)).response;
      } catch (error) {
        rethrow;
      }
    }
  }

  static Future<List<Result_Player>?>? getTopAssists(
      int idLeague, int season) async {
    String url =
        "${HttpCostants.URL_TOP_ASSISTS}?league=${idLeague}&season=$season";

    if (_noFetchDataFromServer) {
      var response = await rootBundle.loadString('json-api/top_assists.json');
      return Response_Player.fromJson(response).response;
    } else {
      try {
        var response = await _requestAPI(url);
        return Response_Player.fromJson((response.body)).response;
      } catch (error) {
        rethrow;
      }
    }
  }

  static Future<List<Result_Player>?>? getTopYellows(
      int idLeague, int season) async {
    String url =
        "${HttpCostants.URL_TOP_YELLOW_CARDS}?league=${idLeague}&season=$season";
    if (_noFetchDataFromServer) {
      var response = await rootBundle.loadString('json-api/top_yellow.json');
      return Response_Player.fromJson(response).response;
    } else {
      try {
        var response = await _requestAPI(url);
        return Response_Player.fromJson((response.body)).response;
      } catch (error) {
        return null;
      }
    }
  }

  static Future<List<Result_Player>?>? getTopReds(
      int idLeague, int season) async {
    String url =
        "${HttpCostants.URL_TOP_RED_CARDS}?league=${idLeague}&season=$season";
    if (_noFetchDataFromServer) {
      var response = await rootBundle.loadString('json-api/top_red.json');
      return Response_Player.fromJson(response).response;
    } else {
      try {
        var response = await _requestAPI(url);
        return Response_Player.fromJson((response.body)).response;
      } catch (error) {
        rethrow;
      }
    }
  }

  static Future<Response_Fixture?> getFixture(int idLeague, int season) async {
    String url =
        "${HttpCostants.URL_FIXTURE}?league=${idLeague}&season=$season";
    if (_noFetchDataFromServer) {
      var response = await rootBundle.loadString('json-api/fixture.json');
      var body = Response_Fixture.fromJson(jsonDecode(response));

      log(body.toString());

      return body;
    } else {
      try {
        var response = await _requestAPI(url);

        return Response_Fixture.fromJson(jsonDecode(response.body));
      } catch (error) {
        rethrow;
      }
    }
  }

  static Future<Response_Leagues?> getLeagues() async {
    /* String url =
        "${HttpCostants.URL_FIXTURE}?league=${idLeague}&season=$season"; */
    if (true) {
      var response = await rootBundle.loadString('json-api/league.json');

      return Response_Leagues.fromJson(response);
    } else {
      try {
        var response = await _requestAPI("url");
        // return Response_Fixture.fromJson(jsonDecode(response.body));
      } catch (error) {
        rethrow;
      }
    }
  }

  static Future<http.Response> _requestAPI(String url) async {
    var response = await http.get(Uri.parse(url), headers: HttpCostants.HEADER);
    if (response.statusCode != 200) Future.error("noOK");
    return response;
  }
}
