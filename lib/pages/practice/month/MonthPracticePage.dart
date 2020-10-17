import 'package:flutter/material.dart';
import 'package:ohthatsa/pages/practice/month/MonthPracticeSetup.dart';
import 'package:ohthatsa/util/DayCalculator.dart';
import 'package:ohthatsa/AppDrawer.dart';
import "dart:math";

import 'MonthPracticeAnswer.dart';

class MonthPracticePage extends StatefulWidget {
  @override
  _MonthPracticeState createState() => _MonthPracticeState();
}

class _MonthPracticeState extends State<MonthPracticePage> {
  int _startCount = 0;
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
  List<MonthPracticeAnswer> answers = new List<MonthPracticeAnswer>();

  Widget getAnswerRow(){
    List<Widget> answerBoxes = new List<Widget>();
    double screenWidth = MediaQuery.of(context).size.width;
    for(MonthPracticeAnswer answer in answers){
      Color c = Colors.green;
      if(answer.month != answer.answer){
        c = Colors.red;
      }
      answerBoxes.add(
          new SizedBox(
              width: screenWidth / _startCount,
              height: 100,
              child: new DecoratedBox(
                  decoration: BoxDecoration(color: c)
              )
          )
      );
    }
    return new Row(children: answerBoxes);
  }

  @override
  Widget build(BuildContext context) {
    MonthPracticeSetup setup = ModalRoute.of(context).settings.arguments;
    _startCount = setup.count;
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
                      (_startCount - _count).toString() + " left"
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
            ),
            new Align(
                alignment: FractionalOffset.bottomCenter,
                child: getAnswerRow()
            )
          ],
        )
      )
    );
  }

  void checkMonth(int answer){
    int month = DayCalculator.getMonthValueByString(_month);
    if(answer == month){
      _correct += 1;
    } else {
      _incorrect += 1;
    }
    _count += 1;
    answers.add(new MonthPracticeAnswer(month, answer));
    if((_startCount - _count) == 0) {
      Navigator.pop(context);
      return;
    }
    setState(() => {
      _month = _months[_random.nextInt(_months.length)]
    });
  }
}