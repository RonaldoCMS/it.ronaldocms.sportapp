import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:football/app/home/home_view_model.dart';
import 'package:football/http/response_leagues.dart';
import 'package:ionicons/ionicons.dart';
import 'package:stacked/stacked.dart';

class Home_View extends StatelessWidget {
  Response_Leagues? league;
  Home_View({this.league, Key? key}) : super(key: key) {
    log("${league?.response!.toList().toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Home_ViewModel>.reactive(
      viewModelBuilder: () => Home_ViewModel(league, 135, context),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: _appBar(),
          drawer: drawer(context, viewModel),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) => viewModel.changePage(value),
            currentIndex: viewModel.indexPage,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Ionicons.football_outline), label: "Stading"),
              BottomNavigationBarItem(
                  icon: Icon(Ionicons.footsteps_outline), label: "Player"),
              BottomNavigationBarItem(
                  icon: Icon(Ionicons.calendar), label: "Calendar"),
            ],
          ),
          body: Center(child: viewModel.page),
        );
      },
    );
  }

  AppBar _appBar() => AppBar(
        leading: _leadingAppBar(),
        title: _titleAppBar(),
        automaticallyImplyLeading: false,
      );

  Container _titleAppBar() => Container(
        child: Text('Sport API'),
      );

  Builder _leadingAppBar() => Builder(
        builder: (context) => IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: Icon(Ionicons.menu),
        ),
      );

  Widget drawer(BuildContext context, Home_ViewModel viewModel) {
    log("FATTO");
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.network(
                  "https://www.api-football.com/public/img/home1/hero-banner.png"),
            ),
            FractionallySizedBox(
              widthFactor: 0.8,
              child: TextField(
                onSubmitted: (e) => log("CLICK"),
                onEditingComplete: () => log("Ciao"),
                onChanged: viewModel.searchLeague,
                decoration: InputDecoration(
                  hintText: "Search",
                  alignLabelWithHint: false,
                  isCollapsed: false,
                  border: OutlineInputBorder(
                    gapPadding: 0,
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            (viewModel.leagues == null)
                ? Container()
                : Expanded(
                    child: ListView(
                      children: (viewModel.leagues_searched == null)
                          ? viewModel.leagues!.response!
                              .map(
                                (e) => ListTile(
                                    onTap: () => viewModel
                                        .selectNewLeague(e.league!.id!),
                                    trailing: Icon(Icons.check),
                                    subtitle: Text(e.country!.name!),
                                    leading: CircleAvatar(
                                        child: Image.network(e.league!.logo!)),
                                    title: Text(e.league!.name!)),
                              )
                              .toList()
                          : viewModel.leagues_searched!
                              .map(
                                (e) => ListTile(
                                    onTap: () => viewModel
                                        .selectNewLeague(e.league!.id!),
                                    trailing: Icon(Icons.check),
                                    subtitle: Text(e.country!.name!),
                                    leading: CircleAvatar(
                                        child: Image.network(e.league!.logo!)),
                                    title: Text(e.league!.name!)),
                              )
                              .toList(),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
