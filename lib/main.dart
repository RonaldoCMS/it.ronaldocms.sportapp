import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:football/app/app.dart';
import 'package:football/http/http_request.dart';

void main() {
 /* HttpRequest.getFixture(135, 2021).then((value) {
   value!.response!.forEach((element) { 
     log("${element.toJson()}");
    });
  }); */
  runApp(App());
}
