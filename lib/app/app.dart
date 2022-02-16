import 'package:flutter/material.dart';
import 'package:football/app/home/home_view.dart';
import 'package:football/http/http_request.dart';
import 'package:football/http/response_leagues.dart';
import 'package:football/theme/theme_dark.dart';
import 'package:football/theme/theme_light.dart';
import 'package:splashscreen/splashscreen.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  Response_Leagues? leagues;

  Future<Widget> loadFromFuture() async {
    leagues = await HttpRequest.getLeagues();
    return Future.value(new Home_View(league: leagues));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(
        loadingText: Text(
          "Stiamo caricando tutti i dati!",
          style: new TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
        ),
        navigateAfterFuture: loadFromFuture(),
        photoSize: 200,
        title: new Text(
          'Benvenuto in Soccer API',
          style: new TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
        ),
        image: Image.network(
          'https://www.api-football.com/public/img/home1/hero-banner.png',
          width: 500,
          height: 500,
        ),
        styleTextUnderTheLoader: TextStyle(color: Colors.white),
        backgroundColor: Color(0xFF042a49),
        loaderColor: Colors.white,
      ),
      theme: themeLight,
    );
  }
}
