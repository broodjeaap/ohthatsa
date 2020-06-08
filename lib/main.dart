import 'package:flutter/material.dart';

void main() {
  runApp(OhThatsA());
}

class OhThatsA extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MonthValuesPage();
  }
}

class MonthValuesPage extends StatelessWidget {
  final Map<String, int> monthValues = {
    "January": 0,
    "February": 3,
    "March": 3,
    "April": 6,
    "May": 1,
    "June": 4,
    "July": 6,
    "August": 2,
    "September": 5,
    "October": 0,
    "November": 3,
    "December": 5,
  };

  List<Widget> getMonthValueWidget(){
    var monthWidgets = List<Widget>();
    monthValues.forEach((key, value) {
      monthWidgets.add(
        Row(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                child: Text(
                    key,
                    style: TextStyle(
                        fontSize: 35
                    )
                )
            ),
            Container(
                alignment: Alignment.centerRight,
                child: Text(
                    value.toString(),
                    style: TextStyle(
                        fontSize: 35
                    )
                )
            )
          ],
        )
      );
    });
    return monthWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "OhThatsA",
      home: Scaffold(
          appBar: AppBar(
              title: Text("Month Values")
          ),
          body: Column(
            children: this.getMonthValueWidget()
          )
      ),
    );
  }
}
