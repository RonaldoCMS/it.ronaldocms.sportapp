import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:football/app/home/football/player/player_view_model.dart';
import 'package:football/models/player/player.dart';
import 'package:football/models/player/player_statistics.dart';
import 'package:football/models/statistic/statistic.dart';
import 'package:football/util/http_error_widget.dart';
import 'package:stacked/stacked.dart';

enum TypePlayer {
  SCORER,
  ASSIST,
  YELLOW,
  RED,
}

class Player_View extends StatelessWidget {
  List<List<DataRow>> data = [];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Player_ViewModel>.reactive(
      viewModelBuilder: () => Player_ViewModel(),
      builder: (context, viewModel, child) => DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: TabBar(
              tabs: [
                Tab(
                  text: 'Scorers',
                ),
                Tab(
                  text: 'Assists',
                ),
                Tab(
                  text: 'Yellows',
                ),
                Tab(
                  text: 'Reds',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              dataScorrers(viewModel),
              dataAssists(viewModel),
              dataYellows(viewModel),
              dataReds(viewModel),
            ],
          ),
        ),
      ),
    );
  }

  Widget get loading => Center(child: CircularProgressIndicator.adaptive());

  Widget buildTable(
      {required type, required viewModel, required Future future}) {
    return FutureBuilder(
      future: future,
      builder: (context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return loading;
          case ConnectionState.none:
            return loading;
          case ConnectionState.active:
            return loading;
          default:
            if (!snapshot.hasData) return Center(child: HttpErrorWidget.HTTP_NOT_HAS_DATA);
            return futureList(viewModel, snapshot, type);
        }
      },
    );
  } 

  String _namePlayer(Player player) => "${player.name}";
  Widget _photoPlayer(Player player) => CircleAvatar(
        backgroundImage: NetworkImage("${player.photo}"),
      );
  String _timePlayer(Statistics statistics) => "${statistics.team!.name}";
  String _playerScorer(Statistics statistics) => "${statistics.goals!.total}";
  String _playerAssist(Statistics statistics) => "${statistics.goals!.assists}";
  String _playerYellow(Statistics statistics) => "${statistics.cards!.yellow}";
  String _playerRed(Statistics statistics) => "${statistics.cards!.red}";

//Text("${data[index].statistics!.goals!.total}

  Widget _buildTrailing(Statistics statistic, type) {
    switch (type) {
      case TypePlayer.SCORER:
        return Text("${_playerScorer(statistic)}");

      case TypePlayer.ASSIST:
        return Text("${_playerAssist(statistic)}");

      case TypePlayer.YELLOW:
        return Text("${_playerYellow(statistic)}");

      case TypePlayer.RED:
        return Text("${_playerRed(statistic)}");

      default:
        return Text("404");
    }
  }

  Widget futureList(
      Player_ViewModel viewModel, AsyncSnapshot snapshot, TypePlayer type) {
    List<Player_Statistics> data = snapshot.data;
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ListTile(
            trailing: _buildTrailing(data[index].statistics!, type),
            subtitle: Text("${_timePlayer(data[index].statistics!)}"),
            leading: _photoPlayer(data[index].player!),
            title: Text(
              "${_namePlayer(data[index].player!)}",
            ));
      },
    );
  }

  Widget table(List<Player_Statistics> data) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: DataTable(
          sortColumnIndex: 0,
          showCheckboxColumn: false,
          columns: [
            DataColumn(
                label: Container(child: Text("Pos")),
                numeric: true,
                tooltip: "rank"),
            DataColumn(label: Text(""), numeric: false, tooltip: "Next"),
            DataColumn(label: Text("G"), numeric: false, tooltip: "Next"),
            DataColumn(label: Text("Gol"), numeric: false, tooltip: "Next"),
            DataColumn(label: Text("DR"), numeric: false, tooltip: "Next"),
            DataColumn(label: Text("Pt."), numeric: false, tooltip: "Next"),
          ],
          rows: data
              .map(
                (statistic) => DataRow(
                    onSelectChanged: (b) {
                      print(statistic.player!.name);
                    },
                    cells: [
                      DataCell(Text("${statistic.player!.name}")),
                      DataCell(
                        FractionallySizedBox(
                          heightFactor: 0.8,
                          widthFactor: 1,
                          child: Image.network(
                            "${statistic.player!.name}",
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      DataCell(Text("${statistic.player!.name}")),
                      DataCell(Text(
                          "${statistic.player!.name}:${statistic.player!.name}")),
                      DataCell(Text("${statistic.player!.name}")),
                      DataCell(
                        Text("${statistic.player!.name}"),
                      ),
                    ]),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget dataScorrers(Player_ViewModel viewModel) => buildTable(
      type: TypePlayer.SCORER,
      viewModel: viewModel,
      future: viewModel.getScorrers());

  Widget dataAssists(Player_ViewModel viewModel) => buildTable(
      type: TypePlayer.ASSIST,
      viewModel: viewModel,
      future: viewModel.getAssists());

  Widget dataYellows(Player_ViewModel viewModel) => buildTable(
      type: TypePlayer.YELLOW,
      viewModel: viewModel,
      future: viewModel.getYellows());

  Widget dataReds(Player_ViewModel viewModel) => buildTable(
        type: TypePlayer.RED,
        viewModel: viewModel,
        future: viewModel.getReds(),
      );
}
