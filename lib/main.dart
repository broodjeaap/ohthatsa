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

  final monthTableRowTextStyle = TextStyle(fontSize: 35);

  TableRow getMonthTableRow(MapEntry<String, int> month) {
    return TableRow(
        children: [
          TableCell(
              child: Text(
                  month.key,
                  style: monthTableRowTextStyle,
                  textAlign: TextAlign.right
              )
          ),
          TableCell(
              child: Text(
                  month.value.toString(),
                  style: monthTableRowTextStyle,
                  textAlign: TextAlign.center
              )
          )
        ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "OhThatsA",
      home: Scaffold(
          appBar: AppBar(
              title: Text("Month Values")
          ),
          body: Center(
            child: Table(
              children: monthValues.entries.map(getMonthTableRow).toList()
            )
          )
      ),
    );
  }
}
