import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football/app/home/football/football_drawer.dart';
import 'package:football/app/home/football/player/player_view.dart';
import 'package:football/app/home/football/standing/standing_view.dart';
import 'package:ionicons/ionicons.dart';
import 'package:stacked/stacked.dart';

import 'football_view_model.dart';

class Football_View extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<Football_ViewModel>.reactive(
        viewModelBuilder: () => Football_ViewModel(context),
        builder: (context, viewModel, child) => DefaultTabController(
          length: 3,
          child: _scaffold(),
        ),
      );

  Scaffold _scaffold() => Scaffold(
        drawer: Football_Drawer(),
        body: _tabBarView(),
        appBar: _appBar(),
      );

  TabBarView _tabBarView() => TabBarView(
        children: [
          Standing_View(),
          Player_View(),
          Center(child: Text('BIRDS')),
        ],
      );

  AppBar _appBar() => AppBar(
        leading: _leadingAppBar(),
        title: _titleAppBar(),
        automaticallyImplyLeading: false,
        bottomOpacity: 0.5,
        bottom: _tapBarAppBar(),
      );

  TabBar _tapBarAppBar() => TabBar(
        tabs: [
          Tab(text: 'Stading', icon: Icon(Ionicons.trophy_outline)),
          Tab(text: 'Player', icon: Icon(Ionicons.footsteps_outline)),
          Tab(text: 'Calendar', icon: Icon(Ionicons.calendar_number_outline)),
        ],
      );

  Container _titleAppBar() => Container(
        child: Text('Sport API'),
      );

  Builder _leadingAppBar() => Builder(
        builder: (context) => IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: Icon(Ionicons.arrow_back_outline),
        ),
      );
}
