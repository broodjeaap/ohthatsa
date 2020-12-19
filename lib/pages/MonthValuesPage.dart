import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import 'package:ohthatsa/other/AppDrawer.dart';
import 'package:ohthatsa/util/Months.dart';

class MonthValuesPage extends StatefulWidget {
  @override
  _MonthValuesState createState() => _MonthValuesState();
}

class _MonthValuesState extends State<MonthValuesPage> {
  int year = DateTime.now().year;
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
                    onChanged: (newYear) =>
                        setState(() => year = newYear),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("With ", style: formulaStyle),
                      Text((year / 100).floor().toString(), style: formulaStyle),
                      Text(year.toString().substring(2), style: YYStyle),
                      Text(" our formula becomes: ", style: formulaStyle),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("(", style: formulaStyle),
                      Text(year.toString().substring(2), style: YYStyle),
                      Text(" + floor(", style: formulaStyle),
                      Text(year.toString().substring(2), style: YYStyleU),
                      Text(" / 4", style: formulaStyleU),
                      Text(")) % 7", style: formulaStyle),
                    ],
                  ),
                  Text("arrow", style: TextStyle(fontSize: 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("(", style: formulaStyle),
                      Text(year.toString().substring(2), style: YYStyle),
                      Text(" + ", style: formulaStyle),
                      Text("floor(" + ((year % 100) / 4).toString() + ")", style: formulaStyleU),
                      Text(") % 7", style: formulaStyle),
                    ],
                  ),
                  Text("arrow", style: TextStyle(fontSize: 10)),
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