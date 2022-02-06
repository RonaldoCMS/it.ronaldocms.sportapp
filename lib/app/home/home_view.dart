import 'package:flutter/material.dart';
import 'package:football/app/home/football/football_view.dart';
import 'package:ionicons/ionicons.dart';

class Home_View extends StatelessWidget {
  const Home_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Ionicons.football_outline), label: "Football"),
          BottomNavigationBarItem(
              icon: Icon(Ionicons.car_sport_outline), label: "Formula 1"),
          BottomNavigationBarItem(
              icon: Icon(Ionicons.reorder_four_outline), label: "Another"),
        ],
      ),
      body: Football_View(),
    );
  }
}
