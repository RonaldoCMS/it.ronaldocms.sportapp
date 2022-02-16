import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:football/http/response_leagues.dart';
import 'package:football/repositories/response_leagues.dart';

import 'calendar/calendar_view.dart';
import 'player/player_view.dart';
import 'standing/standing_view.dart';


class Home_ViewModel extends ChangeNotifier {
  int idLeague;
  BuildContext context;
  Response_Leagues? leagues;
  Home_ViewModel(this.leagues, this.idLeague, this.context) {
    notifyListeners();
  }
  int indexPage = 0;
  List<Result_Leagues>? leagues_searched;

  Widget get page {
    if (indexPage == 0) return Standing_View(idLeague);
    if (indexPage == 1) return Player_View(idLeague);
    return Calendar_View(idLeague);
  }

  setIdLeague(int id) {
    idLeague = id;
    notifyListeners();
  }

  void changePage(int value) {
    indexPage = value;
    notifyListeners();
  }

  void searchLeague(String e) {
    log("E -> $e");
    if (e == "") {
      leagues_searched = null;
    } else {
      leagues_searched = [];
      leagues?.response!.forEach((element) {
        if (element.league!.name!.contains(e)) {
          leagues_searched?.add(element);
        }
      });
    }
    log("NEW ID -> $idLeague");
    notifyListeners();
  }

  void selectNewLeague(int id) {
    idLeague = id;
    log("NEW ID -> $id");
    Navigator.pop(context);
    notifyListeners();
  }
}
