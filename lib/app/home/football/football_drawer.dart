import 'dart:developer';

import 'package:flutter/material.dart';

class TestText {
  String test1;
  String test2;
  String test3;

  TestText(this.test1, this.test2, this.test3);
}

class Football_Drawer extends StatefulWidget {
  Football_Drawer({Key? key}) : super(key: key);

  @override
  State<Football_Drawer> createState() => _Football_DrawerState();
}

class _Football_DrawerState extends State<Football_Drawer> {
  List<TestText> test = [
    TestText("11dsseCc", "1", "1"),
    TestText("12", "2", "2"),
    TestText("3", "3", "3"),
    TestText("4", "4", "4"),
    TestText("5", "5", "5"),
    TestText("6", "6", "6"),
    TestText("7", "7", "7"),
  ];

  List<TestText>? fina;

  @override
  Widget build(BuildContext context) {
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
                onChanged: (e) {
                  log("E -> $e");
                  setState(() {
                    if (e == "") {
                      fina = null;
                    } else {
                      fina = [];
                      test.forEach((element) {
                        if (element.test1.contains(e)) {
                          fina!.add(element);
                        }
                      });
                    }
                  });
                },
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
            Expanded(
              child: ListView(
                  children: (fina == null)
                      ? test
                          .map(
                            (e) => ListTile(
                              onTap: () => Navigator.pop(context),
                              trailing: Text(e.test1),
                              subtitle: Text(e.test2),
                              leading: Text(e.test3),
                              title: Text(
                                "NOME",
                              ),
                            ),
                          )
                          .toList()
                      :  fina!
                          .map(
                            (e) => ListTile(
                              onTap: () => Navigator.pop(context),
                              trailing: Text(e.test1),
                              subtitle: Text(e.test2),
                              leading: Text(e.test3),
                              title: Text(
                                "COGNOME",
                              ),
                            ),
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
