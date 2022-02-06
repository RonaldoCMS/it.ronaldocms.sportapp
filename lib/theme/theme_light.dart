import 'package:flutter/material.dart';
import 'package:football/util/color.dart';

ThemeData get themeLight => ThemeData(
    scaffoldBackgroundColor: MyColor.SCAFFOLD_BACKGROUND_LIGHT,
    bottomNavigationBarTheme: _bottomNavigationBar(),
    appBarTheme: AppBarTheme(
      backgroundColor: MyColor.APPBAR_PRIMARY_LIGHT,
    ),
    tabBarTheme: _tabBar());

TabBarTheme _tabBar() => TabBarTheme(
      labelColor: MyColor.SELECTED_ITEM_COLOR_LIGHT,
      unselectedLabelColor: MyColor.UNSELECTED_ITEM_COLOR_LIGHT,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: MyColor.SELECTED_ITEM_COLOR_LIGHT,
            style: BorderStyle.solid,
          ),
        ),
      ),
      indicatorSize: TabBarIndicatorSize.label,
    );

BottomNavigationBarThemeData _bottomNavigationBar() {
  return BottomNavigationBarThemeData(
    backgroundColor: MyColor.BOTTOMNAVIGATIONBAR_BACKGROUND_LIGHT,
    selectedItemColor: MyColor.SELECTED_ITEM_COLOR_LIGHT,
    unselectedItemColor: MyColor.UNSELECTED_ITEM_COLOR_LIGHT,
  );
}
