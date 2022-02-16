import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:football/app/home/calendar/calendar_view_model.dart';
import 'package:football/repositories/result_fixture.dart';
import 'package:football/http/response_fixture.dart';
import 'package:football/util/http_error_widget.dart';
import 'package:stacked/stacked.dart';

class Calendar_View extends StatelessWidget {
  int idLeague;
  Calendar_View(this.idLeague);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<Calendar_ViewModel>.reactive(
      viewModelBuilder: () => Calendar_ViewModel(),
      builder: (context, model, child) => Padding(
        padding: EdgeInsets.all(8),
        child: FutureBuilder(
          future: model.getFixture(idLeague),
          builder: (context, AsyncSnapshot<Response_Fixture?> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CircularProgressIndicator.adaptive();
              default:
                if (!snapshot.hasData)
                  return Center(child: HttpErrorWidget.HTTP_NOT_HAS_DATA);
                return ListView(children: dataTable(snapshot.data!.response));
            }
          },
        ),
      ),
    );
  }

  List<Widget> dataTable(List<Result_Fixture>? data) {
    if (data == null || data.isEmpty) return [];
    List<Result_Fixture> toView = [];
    List<Widget> toViewWidget = [];
    log("LAST ROUND -> ${data.last.league!.round!}");
    String? lastRound =
        RegExp(r'([0-9])\w+').stringMatch(data.last.league!.round!);

    for (int i = 1; i <= int.parse(lastRound!); i++) {
      toView.clear();
      for (Result_Fixture response in data) {
        if (response.league?.round == "Regular Season - $i") {
          log("Catturato $i");
          toView.add(response);
        }
      }
      toViewWidget.addAll([
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: FittedBox(
            alignment: Alignment.center,
            fit: BoxFit.fitHeight,
            child: DataTable(
              sortColumnIndex: 0,
              showCheckboxColumn: false,
              columns: [
                DataColumn(label: Text(""), numeric: false, tooltip: "Next"),
                DataColumn(
                    label: FittedBox(child: Text("Giornata $i")),
                    numeric: false,
                    tooltip: "Next"),
                DataColumn(label: Text(""), numeric: false, tooltip: "Next"),
              ],
              rows: toView
                  .map(
                    (standing) => DataRow(
                      cells: [
                        DataCell(FractionallySizedBox(
                          widthFactor: 1,
                          child: FittedBox(
                            alignment: Alignment.center,
                            child: Image.network(
                              "${standing.teams!.home!.logo}",
                              alignment: Alignment.center,
                            ),
                          ),
                        )),
                        DataCell(Center(
                          child: Text(
                              "${standing.goals?.home ?? " - "} : ${standing.goals?.away ?? "-"}"),
                        )),
                        DataCell(FractionallySizedBox(
                          widthFactor: 1,
                          child: FittedBox(
                              alignment: Alignment.center,
                              child: Image.network(
                                  "${standing.teams!.away!.logo}")),
                        )),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        )
      ]);
    }

    return toViewWidget;
  }
}
