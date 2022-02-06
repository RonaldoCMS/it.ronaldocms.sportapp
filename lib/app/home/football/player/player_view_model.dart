import 'package:flutter/cupertino.dart';
import 'package:football/http/http_request.dart'; 
import 'package:football/models/player/player_statistics.dart'; 

class Player_ViewModel extends ChangeNotifier {

  Future<List<Player_Statistics>?> getScorrers() async {
    try {
      var response = await HttpRequest.getTopScorers(135, 2021);
      return response;
    } catch (error) {
      return null;
    }
  }

  Future<List<Player_Statistics>?> getAssists() async {
    try {
      var response = await HttpRequest.getTopAssists(135, 2021);
      return response;
    } catch (error) {
      return null;
    }
  }

  Future<List<Player_Statistics>?> getYellows() async {
    try {
      var response = await HttpRequest.getTopYellows(135, 2021);
      return response;
    } catch (error) {
      return null;
    }
  }

  Future<List<Player_Statistics>?> getReds() async {
    try {
      var response = await HttpRequest.getTopReds(135, 2021);
      return response;
    } catch (error) {
      return null;
    }
  } 
}
