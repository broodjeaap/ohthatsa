import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'file:///D:/dev/projects/ohthatsa/lib/util/DayCalculator.dart';
import '../../../AppDrawer.dart';
import "dart:math";

class MonthPracticePage extends StatefulWidget {
  @override
  _MonthPracticeState createState() => _MonthPracticeState();
}

class _MonthPracticeState extends State<MonthPracticePage> {
  int count = 0;
  int correct = 0;
  int incorrect = 0;
  static final _random = new Random();
  static List<String> _months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  String _month = _months[_random.nextInt(_months.length)];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Practicing months"),
      ),
      body: Center(
        child: new Column(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.all(20),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: <Widget>[
                  new Text(
                    "Correct: " + correct.toString()
                  ),
                  new Text(
                    "Incorrect: " + incorrect.toString()
                  )
                ],
              )
            ),
            new Text(
                _month
            ),
            new GridView.count(
              primary: false,
              crossAxisCount: 3,
              padding: EdgeInsets.all(50),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              shrinkWrap: true,
              children: <Widget>[
                new FlatButton(
                    onPressed: () {
                      checkMonth(1);
                    },
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: new Text("1")
                ),
                new FlatButton(
                    onPressed: () {
                      checkMonth(2);
                    },
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: new Text("2")
                ),
                new FlatButton(
                    onPressed: () {
                      checkMonth(3);
                    },
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: new Text("3")
                ),
                new FlatButton(
                    onPressed: () {
                      checkMonth(4);
                    },
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: new Text("4")
                ),
                new FlatButton(
                    onPressed: () {
                      checkMonth(5);
                    },
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: new Text("5")
                ),
                new FlatButton(
                    onPressed: () {
                      checkMonth(6);
                    },
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: new Text("6")
                ),
                new FlatButton(
                    onPressed: () {
                      checkMonth(0);
                    },
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: new Text("0")
                )
              ]
            )
          ],
        )
      )
    );
  }

  void checkMonth(int value){
    if(value == DayCalculator.getMonthValueByString(_month)){
      correct += 1;
    } else {
      incorrect += 1;
    }
    setState(() =>
        _month = _months[_random.nextInt(_months.length)]
    );
  }
}