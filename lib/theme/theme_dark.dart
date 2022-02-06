import 'package:flutter/material.dart';

ThemeData get themeDark => ThemeData(
      scaffoldBackgroundColor: Color(0xFF272e23),
      appBarTheme: _appBarTheme,
      bottomNavigationBarTheme: _bottomNavigationBarTheme,
    );

AppBarTheme get _appBarTheme => AppBarTheme(backgroundColor: Color(0xFF272e23));

BottomNavigationBarThemeData get _bottomNavigationBarTheme =>
    BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF272e23),
      unselectedItemColor: Color(0xFF272e23),
      selectedItemColor: Color(0xFF272e23),
    );
