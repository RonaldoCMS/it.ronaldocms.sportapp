import 'package:flutter/material.dart';

class Calendar_View extends StatelessWidget {
  const Calendar_View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
              color: Color.fromRGBO(244, 67, 54, 1),
              child: Container(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: "A",
                  items: <String>['A', 'B', 'C', 'D'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                      alignment: Alignment.center,
                    );
                  }).toList(),
                  onChanged: (_) {},
                ),
              ),
            ),
          Text("Ciao"),
        ],
      ),
    );
  }
}
