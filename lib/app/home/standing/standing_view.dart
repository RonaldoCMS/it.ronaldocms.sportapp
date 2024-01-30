
import 'package:flutter/material.dart';
import 'package:football/models/general/league.dart';
import 'package:football/models/standing/standing.dart';
import 'package:football/util/http_error_widget.dart';
import 'package:stacked/stacked.dart';

import 'standing_view_model.dart';

class Standing_View extends StatelessWidget {
  List<List<DataRow>> data = [];
  int idLeague;

  Standing_View(this.idLeague);

  Widget get loading => Center(child: CircularProgressIndicator.adaptive());

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Standing_ViewModel>.reactive(
      viewModelBuilder: () => Standing_ViewModel(),
      builder: (context, model, child) => FutureBuilder(
        future: model.getStading(idLeague),
        builder: (context, AsyncSnapshot<League?> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return loading;
            default:
              if (!snapshot.hasData)
                return Center(child: HttpErrorWidget.HTTP_NOT_HAS_DATA);
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  Expanded(
                    child: dataBody(snapshot.data!.standings!.first),
                  )
                ],
              );
          }
        },
      ),
    );
  }

  dataBody(List<Standing>? data) {
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
          rows: data!
              .map(
                (standing) => DataRow(
                  onSelectChanged: (b) {
                    print(standing.team!.name);
                  },
                  cells: [
                    DataCell(Text("${standing.rank}")),
                    DataCell(
                      Image.network(
                        "${standing.team!.logo}",
                        height: 48,
                        width: 48,
                      ),
                    ),
                    DataCell(Text("${standing.all!.played}")),
                    DataCell(Text(
                        "${standing.all!.goals!.goalsFor}:${standing.all!.goals!.against}")),
                    DataCell(Text("${standing.goalsDiff}")),
                    DataCell(
                      Text("${standing.points}"),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
