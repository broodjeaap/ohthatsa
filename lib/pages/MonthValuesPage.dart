import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ohthatsa/other/AppDrawer.dart';
import 'package:ohthatsa/util/Months.dart';

class MonthValuesPage extends StatelessWidget {
  static const formulaStyle = TextStyle(
      fontSize: 25
  );
  static const YYStyle = TextStyle(
      color: Colors.green,
      fontSize: 25
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
                    "And calculate:",
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
                  Text(
                    "Calculate:",
                    style: TextStyle(fontSize: 20)
                  ),
                  Text(
                    "(YY + floor(YY / 4)) % 7",
                    style: TextStyle(fontSize: 20)
                  ),
                  Text(
                      "So for example:",
                      style: TextStyle(fontSize: 20)
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          "19",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 25
                          )
                      ),
                      Text(
                          "67",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 25
                          )
                      )
                    ],
                  ),
                  Text(
                      "The calculation becomes",
                      style: TextStyle(fontSize: 20)
                  ),
                  Text(
                      "(67 + floor(67 / 4)) % 7",
                      style: TextStyle(fontSize: 20)
                  ),
                  Text(
                      "Let's first calculate '67 / 4': 16.75",
                      style: TextStyle(fontSize: 20)
                  ),
                  Text(
                      "Fill that into the calculation:",
                      style: TextStyle(fontSize: 20)
                  ),
                  Text(
                      "(67 + floor(16.75)) % 7",
                      style: TextStyle(fontSize: 20)
                  ),
                  Text(
                      "'Floor' it:",
                      style: TextStyle(fontSize: 20)
                  ),
                  Text(
                      "(67 + 16) % 7",
                      style: TextStyle(fontSize: 20)
                  ),
                  Text(
                      "Calculate '67 + 16': 83",
                      style: TextStyle(fontSize: 20)
                  ),
                  Text(
                      "And that leaves us with: ",
                      style: TextStyle(fontSize: 20)
                  ),
                  Text(
                      "83 % 7",
                      style: TextStyle(fontSize: 20)
                  ),
                  Text(
                      "Which gives us a year value of:",
                      style: TextStyle(fontSize: 20)
                  ),
                  Text(
                      "6",
                      style: TextStyle(fontSize: 20)
                  ),
                ],
              )
            ),
            Container(
              child: Text("test")
            )
          ]
        )
    );
  }
}