import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:football/http/http_request.dart';
import 'package:football/models/general/league.dart';
import 'package:football/models/standing/standing.dart';

class Standing_ViewModel extends ChangeNotifier {
  List<Standing> get standing {
    List<Standing> toReturn = [];
    toReturn.sort((normal, order) => normal.rank!.compareTo(order.rank!));
    return toReturn;
  }

  Future<League?> getStading(int idLeague) async {
    log("My new ID -> $idLeague");
    try {
      var response = await HttpRequest.getStading(idLeague, 2021);
      return response?.response?.first.league;
    } catch (error) {
      log("Type Error $error");
      return null;
    }
  }
}
