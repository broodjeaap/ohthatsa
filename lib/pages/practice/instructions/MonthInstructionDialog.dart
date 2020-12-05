import 'package:flutter/material.dart';
import 'package:ohthatsa/util/Months.dart';

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

SimpleDialog getMonthInstructionDialog(){
  return SimpleDialog(
    title: Text(
      "Month Instructions",
      style: TextStyle(fontSize: 25, color: Colors.blue),
    ),
    children: <Widget>[
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Memorize these values for every month"),
          Table(
            children: Months.stringMap.entries.map(getMonthTableRow).toList()
          )
        ]
      )
    ],
  );
}