import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import 'package:ohthatsa/other/AppDrawer.dart';
import 'package:ohthatsa/util/DayCalculator.dart';
import 'package:ohthatsa/util/Months.dart';

class MonthValuesPage extends StatefulWidget {
  @override
  _MonthValuesState createState() => _MonthValuesState();
}

class _MonthValuesState extends State<MonthValuesPage> {
  int year;
  int yy;
  String centuriesString;
  String yyString;
  double yyDiv4;
  int yyDiv4Floored;
  int yearValue;

  @override
  void initState(){
    super.initState();
    this.setYearValues(DateTime.now().year);
  }
  void setYearValues(newYear){
    year = newYear;
    yy = year % 100;
    centuriesString = (year ~/ 100).toString();
    yyString = year.toString().substring(2);
    yyDiv4 = yy / 4;
    yyDiv4Floored = yyDiv4.floor();
    yearValue = DayCalculator.getYearValue(year);

    setState(() {});
  }
  static const formulaStyle = TextStyle(
    fontSize: 20
  );
  static const formulaStyleU = TextStyle(
    fontSize: 20,
    decoration: TextDecoration.underline
  );
  static const YYStyle = TextStyle(
    color: Colors.green,
    fontSize: 20
  );
  static const YYStyleU = TextStyle(
      color: Colors.green,
      fontSize: 20,
      decoration: TextDecoration.underline
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
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
            title: Text("Month Values")
        ),
        body: PageView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                      "Take only the last two digits: ",
                      style: TextStyle(fontSize: 25)
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "YY",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 25
                        )
                      ),
                      Text(
                        "YY",
                        style: YYStyle
                      )
                    ],
                  ),
                  Text(
                    "Calculate:",
                    style: TextStyle(fontSize: 25)
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          "(",
                        style: formulaStyle,
                      ),
                      Text(
                          "YY",
                          style: YYStyle
                      ),
                      Text(
                        " + floor(",
                          style: formulaStyle
                      ),
                      Text(
                          "YY",
                          style: YYStyle
                      ),
                      Text(
                          " / 4)) % 7",
                          style: formulaStyle
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("1", style: pageNumCurrent),
                      Text(" - ", style: pageNum),
                      Text("2", style: pageNum),
                    ],
                  )
                ],
              )
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  NumberPicker.integer(
                    initialValue: year,
                    minValue: 1700,
                    maxValue: 2399,
                    onChanged: (newYear) => this.setYearValues(newYear)
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("With ", style: formulaStyle),
                      Text(centuriesString, style: formulaStyle),
                      Text(year.toString().substring(2), style: YYStyle),
                      Text(" our formula becomes: ", style: formulaStyle),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("(", style: formulaStyle),
                      Text(yyString, style: YYStyle),
                      Text(" + floor(", style: formulaStyle),
                      Text(yyString, style: YYStyleU),
                      Text(" / 4", style: formulaStyleU),
                      Text(")) % 7", style: formulaStyle),
                    ],
                  ),
                  Text("arrow", style: TextStyle(fontSize: 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("(", style: formulaStyle),
                      Text(yyString, style: YYStyle),
                      Text(" + ", style: formulaStyle),
                      Text("floor(" + yyDiv4.toString() + ")", style: formulaStyleU),
                      Text(") % 7", style: formulaStyle),
                    ],
                  ),
                  Text("arrow", style: TextStyle(fontSize: 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("(", style: formulaStyleU),
                      Text(yyString, style: YYStyleU),
                      Text(" + " + yyDiv4Floored.toString() + ")", style: formulaStyleU),
                      Text(" % 7", style: formulaStyle),
                    ],
                  ),
                  Text("arrow", style: TextStyle(fontSize: 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text((yy + yyDiv4Floored).toString(), style: formulaStyleU),
                      Text(" % 7", style: formulaStyleU),
                    ],
                  ),
                  Text("arrow", style: TextStyle(fontSize: 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("So the year value of " + year.toString() + " is: ", style: formulaStyle),
                      Text(yearValue.toString(), style: formulaStyleU),
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
                ]
              )
            )
          ]
        )
    );
  }
}