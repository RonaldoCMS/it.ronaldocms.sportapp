
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:football/app/app.dart';
import 'package:football/http/http_request.dart';

void main() async {
  await dotenv.load(fileName: "config.env");
  runApp(App());
}
