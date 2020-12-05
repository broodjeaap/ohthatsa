import 'package:flutter/material.dart';

import 'package:numberpicker/numberpicker.dart';
import 'package:ohthatsa/util/DayCalculator.dart';

import 'package:ohthatsa/other/AppDrawer.dart';

class YearsPage extends StatefulWidget  {
  @override
  _YearsPageState createState() => _YearsPageState();
}

class _YearsPageState extends State<YearsPage> {
  int _year = DateTime.now().year;
  @override
  Widget build(BuildContext context){
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text("Years"),
        ),
        body: Center(
            child: Column(
              children: <Widget>[
                NumberPicker.integer(
                  initialValue: _year, // TODO set to current year
                  minValue: 1800,
                  maxValue: 2399,
                  onChanged: (newYear) =>
                    setState(() => _year = newYear),
                ),
                Text("You picked the year: $_year"),
                Text("The century code is: " + DayCalculator.getCenturyValue(_year).toString()),
                Text("Is this a leap year: " + DayCalculator.isLeapYear(_year).toString()),
              ]
            )
        )
    );
  }
}