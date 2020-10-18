import 'package:flutter/material.dart';
import 'package:ohthatsa/pages/practice/month/MonthPracticeSetup.dart';
import 'package:ohthatsa/util/DayCalculator.dart';
import 'package:ohthatsa/AppDrawer.dart';
import 'package:ohthatsa/util/Months.dart';
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
  Month _month = Months.getFromInt(_random.nextInt(Months.length));
  List<MonthPracticeAnswer> answers = new List<MonthPracticeAnswer>();

  Widget getAnswerRow(){
    List<Widget> answerBoxes = new List<Widget>();
    for(MonthPracticeAnswer answer in answers){
      Color c = Colors.green;
      if(answer.month.value != answer.answer){
        c = Colors.red;
      }
      answerBoxes.add(
          new Expanded(
            child: new Container(
              height: 50,
              color: c
            )
          )
      );
    }
    for(int i in Iterable.generate(_startCount - _count)) {
      answerBoxes.add(
          new Expanded(
              child: new Container(
                  height: 50,
                  color: Colors.blue,
              )
          )
      );
    }
    return new Row(children: answerBoxes);
  }

  Widget getButtons(){
    List<Widget> buttons = new List<Widget>();
    for(int i in [1,2,3,4,5,6,-1,0,-1]){
      if (i == -1){
        buttons.add(Container());
        continue;
      }
      buttons.add(
        new FlatButton(
            onPressed: () {
              checkMonth(i);
            },
            color: Colors.blue,
            textColor: Colors.white,
            child: new Text(i.toString())
        )
      );
    }
    return new GridView.count(
      primary: false,
      crossAxisCount: 3,
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      shrinkWrap: true,
      children: buttons
    );
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
        child: new Container(
          padding: EdgeInsets.all(20),
          child: new Column(
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                        "Correct: " + _correct.toString(),
                        style: TextStyle(
                          fontSize: 20,
                        )
                    ),
                    new Text(
                        (_startCount - _count).toString() + " left",
                        style: TextStyle(
                          fontSize: 20,
                        )
                    ),
                    new Text(
                        "Incorrect: " + _incorrect.toString(),
                        style: TextStyle(
                          fontSize: 20,
                        )
                    )
                  ],
                ),
                new Text(
                    _month.string,
                    style: TextStyle(
                      fontSize: 30,
                    )
                ),
                getButtons(),
                new Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: getAnswerRow()
                )
              ]
          )
        )
      )
    );
  }

  void checkMonth(int answer){
    if(answer == _month.value){
      _correct += 1;
    } else {
      _incorrect += 1;
    }
    _count += 1;
    answers.add(new MonthPracticeAnswer(_month, answer));
    if((_startCount - _count) == 0) {
      Navigator.pop(context);
      return;
    }
    setState(() => {
      _month = Months.getFromInt(_random.nextInt(Months.length))
    });
  }
}