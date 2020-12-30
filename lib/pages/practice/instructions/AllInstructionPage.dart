import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:ohthatsa/other/AppDrawer.dart';
import 'package:ohthatsa/util/DayCalculator.dart';
import 'package:ohthatsa/util/Months.dart';
import 'package:ohthatsa/util/TextStyles.dart';

class AllInstructionPage extends StatefulWidget {
  @override
  _AllInstructionPageState createState() => _AllInstructionPageState();
}

class _AllInstructionPageState extends State<AllInstructionPage> {

  @override
  void initState(){
    super.initState();
  }

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
                      Text20("To calculate the weekday"),
                      Text20("Add all the values together:"),
                      Text20("Day of the Month"),
                      Text15("+"),
                      Text20("Month Value"),
                      Text15("+"),
                      Text20("Year Value"),
                      Text15("+"),
                      Text20("Century Value"),
                      Text15("-"),
                      Text20("Leap Value (1 or 0)"),
                      Text15("(if in January/February)"),
                      Text15(""),
                      Text20("Mod the result by 7"),
                      Text15(""),
                      Text20("And check what day it is:"),
                      Table(
                        children: List.generate(daysOfTheWeek.length, (i) =>
                          TableRow(
                            children: <Widget> [
                              TableCell(
                                child: Text(
                                  daysOfTheWeek[i],
                                  textAlign: TextAlign.right,
                                  style: TextStyles.textStyle20
                                )
                              ),
                              TableCell(
                                child: Text(
                                  i.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyles.textStyle20
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