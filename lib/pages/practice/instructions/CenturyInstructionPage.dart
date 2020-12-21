import 'package:flutter/material.dart';
import 'package:ohthatsa/other/AppDrawer.dart';
import 'package:ohthatsa/util/Months.dart';

class CenturyInstructionPage extends StatelessWidget{

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
                children: <TableRow>[
                  TableRow(
                      children: <Widget>[
                        TableCell(
                            child: Text(
                                "1700-1799",
                                style: TextStyle(fontSize: 25),
                                textAlign: TextAlign.right
                            )
                        ),
                        TableCell(
                            child: Text(
                                "4",
                                style: TextStyle(fontSize: 25),
                                textAlign: TextAlign.center
                            )
                        )
                      ]
                  ),
                  TableRow(
                      children: <Widget>[
                        TableCell(
                            child: Text(
                                "1800-1899",
                                style: TextStyle(fontSize: 25),
                                textAlign: TextAlign.right
                            )
                        ),
                        TableCell(
                            child: Text(
                                "2",
                                style: TextStyle(fontSize: 25),
                                textAlign: TextAlign.center
                            )
                        )
                      ]
                  ),
                  TableRow(
                      children: <Widget>[
                        TableCell(
                            child: Text(
                                "1900-1999",
                                style: TextStyle(fontSize: 25),
                                textAlign: TextAlign.right
                            )
                        ),
                        TableCell(
                            child: Text(
                                "0",
                                style: TextStyle(fontSize: 25),
                                textAlign: TextAlign.center
                            )
                        )
                      ]
                  ),
                  TableRow(
                      children: <Widget>[
                        TableCell(
                            child: Text(
                                "2000-2099",
                                style: TextStyle(fontSize: 25),
                                textAlign: TextAlign.right
                            )
                        ),
                        TableCell(
                            child: Text(
                                "6",
                                style: TextStyle(fontSize: 25),
                                textAlign: TextAlign.center
                            )
                        )
                      ]
                  ),
                  TableRow(
                      children: <Widget>[
                        TableCell(
                            child: Text(
                                "2100-2199",
                                style: TextStyle(fontSize: 25),
                                textAlign: TextAlign.right
                            )
                        ),
                        TableCell(
                            child: Text(
                                "4",
                                style: TextStyle(fontSize: 25),
                                textAlign: TextAlign.center
                            )
                        )
                      ]
                  ),
                  TableRow(
                      children: <Widget>[
                        TableCell(
                            child: Text(
                                "2200-2299",
                                style: TextStyle(fontSize: 25),
                                textAlign: TextAlign.right
                            )
                        ),
                        TableCell(
                            child: Text(
                                "2",
                                style: TextStyle(fontSize: 25),
                                textAlign: TextAlign.center
                            )
                        )
                      ]
                  ),
                  TableRow(
                      children: <Widget>[
                        TableCell(
                            child: Text(
                                "2300-2399",
                                style: TextStyle(fontSize: 25),
                                textAlign: TextAlign.right
                            )
                        ),
                        TableCell(
                            child: Text(
                                "0",
                                style: TextStyle(fontSize: 25),
                                textAlign: TextAlign.center
                            )
                        )
                      ]
                  )
                ]
            )
          ]
        )
    );
  }
}