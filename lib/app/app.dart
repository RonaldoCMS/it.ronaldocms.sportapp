import 'package:flutter/material.dart';
import 'package:football/app/home/home_view.dart';
import 'package:football/http/http_request.dart';
import 'package:football/http/response_leagues.dart';
import 'package:football/theme/theme_light.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  Response_Leagues? leagues;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home_View(),
      theme: themeLight,
    );
  }
}
