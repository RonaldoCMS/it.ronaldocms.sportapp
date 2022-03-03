// ignore_for_file: non_constant_identifier_names
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpCostants {
  static String get HOST => dotenv.env['HOST']!;
  static String get _X_RAPIDAPI_KEY => dotenv.env['X_RAPIDAPI_KEY']!;
  static String get _X_RAPIDAPI_VALUE => dotenv.env['X_RAPIDAPI_VALUE']!;
  static Map<String, String> get HEADER => {_X_RAPIDAPI_KEY: _X_RAPIDAPI_VALUE};

  static String get _PLAYER => "players";

  static String get _ENDPOINT_STADING => "standings";
  static String get _ENDPOINT_TOP_SCORERS => "$_PLAYER/topscorers";
  static String get _ENDPOINT_TOP_ASSISTS => "$_PLAYER/topassists";
  static String get _ENDPOINT_TOP_YELLOW_CARDS => "$_PLAYER/topyellowcards";
  static String get _ENDPOINT_TOP_RED_CARDS => "$_PLAYER/topredcards";
  static String get _ENDPOINT_FIXTURE => "fixtures";

  static String get URL_STADING => "$HOST/$_ENDPOINT_STADING";
  static String get URL_FIXTURE => "$HOST/$_ENDPOINT_FIXTURE";
  static String get URL_TOP_SCORERS => "$HOST/$_ENDPOINT_TOP_SCORERS";
  static String get URL_TOP_ASSISTS => "$HOST/$_ENDPOINT_TOP_ASSISTS";
  static String get URL_TOP_YELLOW_CARDS => "$HOST/$_ENDPOINT_TOP_YELLOW_CARDS";
  static String get URL_TOP_RED_CARDS => "$HOST/$_ENDPOINT_TOP_RED_CARDS";
}
