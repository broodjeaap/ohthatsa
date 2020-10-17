import 'package:flutter/material.dart';
import 'package:ohthatsa/pages/practice/month/MonthPracticeSetup.dart';
import 'package:ohthatsa/util/DayCalculator.dart';
import 'package:ohthatsa/AppDrawer.dart';
import "dart:math";

class MonthPracticePage extends StatefulWidget {
  @override
  _MonthPracticeState createState() => _MonthPracticeState();
}

class _MonthPracticeState extends State<MonthPracticePage> {
  int _count = 0;
  int _correct = 0;
  int _incorrect = 0;
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
    MonthPracticeSetup setup = ModalRoute.of(context).settings.arguments;
    if(_count == 0) {
      _count = setup.count;
    }
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
                      "Correct: " + _correct.toString()
                  ),
                  new Text(
                      _count.toString() + " left"
                  ),
                  new Text(
                    "Incorrect: " + _incorrect.toString()
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
      _correct += 1;
    } else {
      _incorrect += 1;
    }
    _count -= 1;
    setState(() => {
      _month = _months[_random.nextInt(_months.length)]
    });
    if(_count == 0) {
      Navigator.pop(context);
    }
  }
}