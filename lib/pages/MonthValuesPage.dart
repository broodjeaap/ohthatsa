import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ohthatsa/other/AppDrawer.dart';
import 'package:ohthatsa/util/Months.dart';

class MonthValuesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
            title: Text("Month Values")
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text(
                  "To calculate the value for a year,",
                  style: TextStyle(fontSize: 20)
              ),
              Text(
                  "Take only the last two digits: ",
                  style: TextStyle(fontSize: 20)
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
                    style: TextStyle(
                      color: Colors.green,
                        fontSize: 25
                    )
                  )
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
                  "The final calculation gives us a year value of:",
                  style: TextStyle(fontSize: 20)
              ),
              Text(
                  "6",
                  style: TextStyle(fontSize: 20)
              ),
            ],
          )
        )
    );
  }
}