import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:ohthatsa/other/AppDrawer.dart';
import 'package:ohthatsa/util/DayCalculator.dart';
import 'package:ohthatsa/util/TextStyles.dart';

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
                    Text20("A year is a leap year if..."),
                    Text20("It is divisible by 4, unless..."),
                    Text20("It's also divisible by 100, unless..."),
                    Text20("It's divisible by 400"),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("1", style: TextStyles.textStyle20.apply(color: Colors.blue)),
                        Text(" - ", style: TextStyles.textStyle20.apply(color: Colors.grey)),
                        Text("2", style: TextStyles.textStyle20.apply(color: Colors.grey)),
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
                    child: Text20(year.toString() + " is divisible by 4")
                  ),
                  Visibility(
                      visible: divBy100,
                      child: Column(
                        children: <Widget>[
                          Text20("But..."),
                          Text20(year.toString() + " is also divisible by 100")
                        ],
                      )
                  ),
                  Visibility(
                      visible: divBy400,
                      child: Column(
                        children: <Widget>[
                          Text20("But..."),
                          Text20(year.toString() + " is also divisible by 400")
                        ],
                      )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text20("So " + year.toString() + " is"),
                      Text20(this.isLeapYear ? " " : " not "),
                      Text20("a leap year")
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("1", style: TextStyles.textStyle20.apply(color: Colors.grey)),
                      Text(" - ", style: TextStyles.textStyle20.apply(color: Colors.grey)),
                      Text("2", style: TextStyles.textStyle20.apply(color: Colors.blue)),
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