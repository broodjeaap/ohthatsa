import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:ohthatsa/other/AppDrawer.dart';
import 'package:ohthatsa/util/DayCalculator.dart';
import 'package:ohthatsa/util/Months.dart';

class LeapInstructionPage extends StatefulWidget {
  @override
  _LeapInstructionPageState createState() => _LeapInstructionPageState();
}

class _LeapInstructionPageState extends State<LeapInstructionPage> {
  int year;
  bool isLeapYear;
  bool divBy4;
  bool divBy100;
  bool divBy400;

  @override
  void initState(){
    super.initState();
    this.setYear(DateTime.now().year);
  }

  void setYear(int newYear){
    year = newYear;
    isLeapYear = DayCalculator.isLeapYear(year);
    divBy4 = (year % 4) == 0;
    divBy100 = (year % 100) == 0;
    divBy400 = (year % 400) == 0;
    setState(() {});
  }

  static const textStyle = TextStyle(
      fontSize: 20
  );
  static const pageNum = TextStyle(
      color: Colors.grey,
      fontSize: 20
  );
  static const pageNumCurrent = TextStyle(
      color: Colors.blue,
      fontSize: 20
  );
  @override
  Widget build(BuildContext context){
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
            title: Text("Leap Year Instructions")
        ),

        body: PageView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 10),
              child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("A year is a leap year if...", style: textStyle),
                    Text("It is divisible by 4, unless...", style: textStyle),
                    Text("It's also divisible by 100, unless...", style: textStyle),
                    Text("It's divisible by 400", style: textStyle),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("1", style: pageNumCurrent),
                        Text(" - ", style: pageNum),
                        Text("2", style: pageNum),
                      ],
                    )
                  ]
              )
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  NumberPicker.integer(
                      initialValue: year,
                      minValue: 0,
                      maxValue: 10000,
                      onChanged: (newYear) => { this.setYear(newYear) }
                  ),
                  Visibility(
                    visible: divBy4,
                    child: Text(year.toString() + " is divisible by 4", style: textStyle)
                  ),
                  Visibility(
                      visible: divBy100,
                      child: Column(
                        children: <Widget>[
                          Text("But...", style: textStyle),
                          Text(year.toString() + " is also divisible by 100", style: textStyle)
                        ],
                      )
                  ),
                  Visibility(
                      visible: divBy400,
                      child: Column(
                        children: <Widget>[
                          Text("But...", style: textStyle),
                          Text(year.toString() + " is also divisible by 400", style: textStyle)
                        ],
                      )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("So " + year.toString() + " is", style: textStyle),
                      Text(this.isLeapYear ? " " : " not ", style: textStyle),
                      Text("a leap year", style: textStyle)
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("1", style: pageNum),
                      Text(" - ", style: pageNum),
                      Text("2", style: pageNumCurrent),
                    ],
                  )
                ],
              )
            )
        ]
      )
    );
  }
}