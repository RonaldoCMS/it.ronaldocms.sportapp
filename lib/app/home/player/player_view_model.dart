import 'package:flutter/cupertino.dart';
import 'package:football/http/http_request.dart';
import 'package:football/repositories/player_player.dart';

class Player_ViewModel extends ChangeNotifier {
  Future<List<Result_Player>?> getScorrers(int idLeague) async {
    try {
      var response = await HttpRequest.getTopScorers(idLeague, 2021);
      return response;
    } catch (error) {
      return null;
    }
  }

  Future<List<Result_Player>?> getAssists(int idLeague) async {
    try {
      var response = await HttpRequest.getTopAssists(idLeague, 2021);
      return response;
    } catch (error) {
      return null;
    }
  }

  Future<List<Result_Player>?> getYellows(int idLeague) async {
    try {
      var response = await HttpRequest.getTopYellows(idLeague, 2021);
      return response;
    } catch (error) {
      return null;
    }
  }

  Future<List<Result_Player>?> getReds(int idLeague) async {
    try {
      var response = await HttpRequest.getTopReds(idLeague, 2021);
      return response;
    } catch (error) {
      return null;
    }
  }
}
