import 'package:flutter/cupertino.dart';
import 'package:football/http/http_request.dart';
import 'package:football/http/response_player_scorrers.dart';
import 'package:football/models/player/player_statistics.dart';
import 'package:football/models/standing/league.dart';
import 'package:football/models/standing/standing.dart';

class Player_ViewModel extends ChangeNotifier {
  /* List<Standing> get standing {
    List<Standing> toReturn = [];
    toReturn.sort((normal, order) => normal.rank!.compareTo(order.rank!));
    return toReturn;
  } */

  /*  Future<League?> getStading() async {
    var response = await HttpRequest.getStading(135, 2021);
    return response!.response!.first.league;
  } */

  Future<List<Player_Statistics>?> getScorrers() async {
    var response = await HttpRequest.getTopScorers(135, 2021);
    return response;
  }

  
  Future<List<Player_Statistics>?> getAssists() async {
    var response = await HttpRequest.getTopAssists(135, 2021);
    return response;
  }

  
  Future<List<Player_Statistics>?> getYellows() async {
    var response = await HttpRequest.getTopYellows(135, 2021);
    return response;
  }

  
  Future<List<Player_Statistics>?> getReds() async {
    var response = await HttpRequest.getTopReds(135, 2021);
    return response;
  }

  Future<bool> getBool() async => true;
  Future<String> getString() async => "Ciao";
  Future<int> getInt() async => 1;
  Future<double> getDouble() async => 2.0;
}
