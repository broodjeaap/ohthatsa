import 'package:flutter/material.dart';

import 'package:numberpicker/numberpicker.dart';
import 'file:///D:/dev/projects/ohthatsa/lib/util/DayCalculator.dart';

import '../AppDrawer.dart';

class YearsPage extends StatefulWidget  {
  @override
  _YearsPageState createState() => _YearsPageState();
}

class _YearsPageState extends State<YearsPage> {
  int _year = new DateTime.now().year;
  @override
  Widget build(BuildContext context){
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text("Years"),
        ),
        body: Center(
            child: new Column(
              children: <Widget>[
                new NumberPicker.integer(
                  initialValue: _year, // TODO set to current year
                  minValue: 1800,
                  maxValue: 2399,
                  onChanged: (newYear) =>
                    setState(() => _year = newYear),
                ),
                new Text("You picked the year: $_year"),
                new Text("The century code is: " + DayCalculator.getCenturyValue(_year).toString()),
                new Text("Is this a leap year: " + DayCalculator.isLeapYear(_year).toString()),
              ]
            )
        )
    );
  }
}