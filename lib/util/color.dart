// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyColor {
  static Color get SCAFFOLD_BACKGROUND_LIGHT => Color(0xFFF8F9FA);

  static Color SCAFFOLD(BuildContext context) =>
      Theme.of(context).backgroundColor;

  static Color get SCAFFOLD_PRIMARY_DARK => Colors.red;
  static Color get SCAFFOLD_PRIMARY_LIGHT => Colors.red;

  static Color get APPBAR_PRIMARY_DARK => Colors.red;
  static Color get APPBAR_PRIMARY_LIGHT => Color(0xFF212529);

  static Color get BOTTOMNAVIGATIONBAR_BACKGROUND_DARK => Colors.red;
  static Color get BOTTOMNAVIGATIONBAR_BACKGROUND_LIGHT => Color(0xFF212529);

  static Color get SELECTED_ITEM_COLOR_LIGHT => Color(0xFFADB5BD);
  static Color get SELECTED_ITEM_COLOR_DARK => Color(0xFF);

  static Color get UNSELECTED_ITEM_COLOR_LIGHT => Color(0xFFE9ECEF);
  static Color get UNSELECTED_ITEM_COLOR_DARK => Color(0xFF);

  /*
    PALETTE LIGHT

    RED -> D64045

  */
}
