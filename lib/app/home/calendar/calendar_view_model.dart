import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:football/http/http_request.dart';
import 'package:football/http/response_fixture.dart';

class Calendar_ViewModel extends ChangeNotifier {
  Future<Response_Fixture?> getFixture(int idLeague) async {
    var response = await HttpRequest.getFixture(idLeague, 2021);
    log(response!.response.toString());
    return response;
  }
}
