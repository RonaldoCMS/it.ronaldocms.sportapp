import 'dart:convert';
import 'dart:developer';

import 'package:football/http/response_player_scorrers.dart';
import 'package:football/http/response_standing.dart';
import 'package:football/models/player/player_statistics.dart';
import 'package:football/models/standing/response.dart';
import 'package:football/test/test/test.dart';
import 'package:football/util/util.dart';
import 'package:http/http.dart' as http;

class HttpRequest {
  static Future<Response_Standing?> getStading(int idLeague, int season) async {
    var response = await http.get(
        Uri.parse(
            "https://v3.football.api-sports.io/standings?league=${idLeague}&season=$season"),
        headers: {"x-rapidapi-key": "28ecaa97ef6517319b74d8c6d236a7cc"});

    if (response.statusCode != 200)
      return Future.error(Exception("HashCodeError"));
    Response_Standing? standing;
    try {
      standing = Response_Standing.fromJson(jsonDecode(response.body));
      return standing;
    } catch (error) {
      return null;
    }
  }

  static Future<List<Player_Statistics>?>? getTopScorers(
      int idLeague, int season) async {
    var response = await http.get(
        Uri.parse(
            "https://v3.football.api-sports.io/players/topscorers?league=${idLeague}&season=$season"),
        headers: {"x-rapidapi-key": "28ecaa97ef6517319b74d8c6d236a7cc"});

    if (response.statusCode != 200)
      return Future.error(Exception("HashCodeError"));
    Response_Player_TopScorers? scorers;
    try {
      scorers = Response_Player_TopScorers.fromJson((response.body));
      log("Scorers -> ${scorers.response!.first.player!.firstname}");
      return scorers.response;
    } catch (error) {
      return null;
    }
  }

    static Future<List<Player_Statistics>?>? getTopAssists(
      int idLeague, int season) async {
    var response = await http.get(
        Uri.parse(
            "https://v3.football.api-sports.io/players/topassists?league=${idLeague}&season=$season"),
        headers: {"x-rapidapi-key": "28ecaa97ef6517319b74d8c6d236a7cc"});

    if (response.statusCode != 200)
      return Future.error(Exception("HashCodeError"));
    Response_Player_TopScorers? scorers;
    try {
      scorers = Response_Player_TopScorers.fromJson((response.body));
      log("Scorers -> ${scorers.response!.first.player!.firstname}");
      return scorers.response;
    } catch (error) {
      return null;
    }
  }
    static Future<List<Player_Statistics>?>? getTopYellows(
      int idLeague, int season) async {
    var response = await http.get(
        Uri.parse(
            "https://v3.football.api-sports.io/players/topyellowcards?league=${idLeague}&season=$season"),
        headers: {"x-rapidapi-key": "28ecaa97ef6517319b74d8c6d236a7cc"});

    if (response.statusCode != 200)
      return Future.error(Exception("HashCodeError"));
    Response_Player_TopScorers? scorers;
    try {
      scorers = Response_Player_TopScorers.fromJson((response.body));
      log("Scorers -> ${scorers.response!.first.player!.firstname}");
      return scorers.response;
    } catch (error) {
      return null;
    }
  }

    static Future<List<Player_Statistics>?>? getTopReds(
      int idLeague, int season) async {
    var response = await http.get(
        Uri.parse(
            "https://v3.football.api-sports.io/players/topredcards?league=${idLeague}&season=$season"),
        headers: {"x-rapidapi-key": "28ecaa97ef6517319b74d8c6d236a7cc"});

    if (response.statusCode != 200)
      return Future.error(Exception("HashCodeError"));
    Response_Player_TopScorers? scorers;
    try {
      scorers = Response_Player_TopScorers.fromJson((response.body));
      log("Scorers -> ${scorers.response!.first.player!.firstname}");
      return scorers.response;
    } catch (error) {
      return null;
    }
  }

  static Future<Response_Fixture?> getFixture(int idLeague, int season) async {
    var response = await http.get(
        Uri.parse(
            "https://v3.football.api-sports.io/fixtures?league=${idLeague}&season=$season"),
        headers: {"x-rapidapi-key": "28ecaa97ef6517319b74d8c6d236a7cc"});

    if (response.statusCode != 200)
      return Future.error(Exception("HashCodeError"));
    Response_Fixture? standing;
    try {
      standing = Response_Fixture.fromJson(jsonDecode(response.body));
      return standing;
    } catch (error) {
      return null;
    }
  }
}
