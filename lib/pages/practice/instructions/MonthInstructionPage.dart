import 'package:flutter/material.dart';
import 'package:ohthatsa/other/AppDrawer.dart';
import 'package:ohthatsa/util/Months.dart';

class MonthInstructionPage extends StatelessWidget{
  TableRow getMonthTableRow(MapEntry<String, Month> month) {
    return TableRow(
        children: [
          TableCell(
              child: Text(
                  month.key,
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.right
              )
          ),
          TableCell(
              child: Text(
                  month.value.value.toString(),
                  style: TextStyle(fontSize: 25),
                  textAlign: TextAlign.center
              )
          )
        ]
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
            title: Text("Year Instructions")
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Memorize these values:", style: TextStyle(fontSize: 25, color: Colors.blue)),
            Table(
              children: Months.stringMap.entries.map(getMonthTableRow).toList()
            )
          ]
        )
    );
  }
}