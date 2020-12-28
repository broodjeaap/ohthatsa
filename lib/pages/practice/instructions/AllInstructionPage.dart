import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:ohthatsa/other/AppDrawer.dart';
import 'package:ohthatsa/util/DayCalculator.dart';
import 'package:ohthatsa/util/Months.dart';

class AllInstructionPage extends StatefulWidget {
  @override
  _AllInstructionPageState createState() => _AllInstructionPageState();
}

class _AllInstructionPageState extends State<AllInstructionPage> {

  @override
  void initState(){
    super.initState();
  }

  static const textStyle = TextStyle(
      fontSize: 20
  );
  static const textStyleU = TextStyle(
      fontSize: 20,
      decoration: TextDecoration.underline
  );
  static const valueStyle = TextStyle(
      color: Colors.green,
      fontSize: 20
  );
  static const daysOfTheWeek = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
            title: Text("All Instructions")
        ),

        body: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 10),
                child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("To calculate the weekday", style: textStyle),
                      Text("Add all the values together:", style: textStyle),
                      Text("Day of the Month", style: textStyle),
                      Text("+", style: TextStyle(fontSize: 15)),
                      Text("Month Value", style: textStyle),
                      Text("+", style: TextStyle(fontSize: 15)),
                      Text("Year Value", style: textStyle),
                      Text("+", style: TextStyle(fontSize: 15)),
                      Text("Century Value", style: textStyle),
                      Text("-", style: TextStyle(fontSize: 15)),
                      Text("Leap Value (1 or 0)", style: textStyle),
                      Text("(if in January/February)", style: TextStyle(fontSize: 15)),
                      Text("", style: TextStyle(fontSize: 15)),
                      Text("Mod the result by 7", style: textStyle),
                      Text("", style: TextStyle(fontSize: 15)),
                      Text("And check what day it is:", style: textStyle),
                      Table(
                        children: List.generate(daysOfTheWeek.length, (i) =>
                          TableRow(
                            children: <Widget> [
                              TableCell(
                                child: Text(
                                  daysOfTheWeek[i],
                                  textAlign: TextAlign.right,
                                  style: TextStyle(fontSize: 20)
                                )
                              ),
                              TableCell(
                                child: Text(
                                  i.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20)
                                )
                              )
                            ]
                          )
                        )
                      )
                    ]
                ),
              ),
            ]
        )
    );
  }
}