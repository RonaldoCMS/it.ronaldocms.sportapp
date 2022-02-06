import 'package:flutter/material.dart';
import 'package:football/app/home/home_view.dart';
import 'package:football/theme/theme_dark.dart';
import 'package:football/theme/theme_light.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home_View(),
      theme: themeLight,
    );
  }
}
