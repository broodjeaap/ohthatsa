import 'package:flutter/material.dart';

import 'package:ohthatsa/AppDrawer.dart';
import 'package:ohthatsa/util/Months.dart';

class MonthValuesPage extends StatelessWidget {
  final monthTableRowTextStyle = TextStyle(fontSize: 35);

  TableRow getMonthTableRow(MapEntry<String, Month> month) {
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
                  month.value.value.toString(),
                  style: monthTableRowTextStyle,
                  textAlign: TextAlign.center
              )
          )
        ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
            title: Text("Month Values")
        ),
        body: Center(
            child: Table(
                children: Months.stringMap.entries.map(getMonthTableRow).toList()
            )
        )
    );
  }
}