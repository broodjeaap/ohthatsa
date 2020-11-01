import 'package:flutter/material.dart';
import 'package:ohthatsa/pages/practice/PracticeGenerator.dart';
import 'package:ohthatsa/pages/practice/month/MonthPracticeGenerator.dart';
import 'file:///D:/dev/projects/ohthatsa/lib/pages/practice/PracticeSetup.dart';
import 'package:ohthatsa/util/DayCalculator.dart';
import 'package:ohthatsa/AppDrawer.dart';
import 'package:ohthatsa/util/Months.dart';
import 'package:ohthatsa/util/Extensions.dart';
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
  bool _showCorrect = true;
  static final practiceGenerator = MonthPracticeGenerator();
  List<MonthPracticeAnswer> answers = List<MonthPracticeAnswer>();

  Widget getAnswerRow(){
    List<Widget> answerBoxes = List<Widget>();
    for(MonthPracticeAnswer answer in answers){
      Color c = Colors.green;
      if(answer.month.value != answer.answer){
        c = Colors.red;
      }
      answerBoxes.add(
          Expanded(
            child: Container(
              height: 50,
              color: c
            )
          )
      );
    }
    for(int i in Iterable.generate(_startCount - _count)) {
      answerBoxes.add(
          Expanded(
              child: Container(
                  height: 50,
                  color: Colors.blue,
              )
          )
      );
    }
    return Row(children: answerBoxes);
  }

  Widget getQuestions(){
    List<Widget> questions = List<Widget>();
    if(answers.length >= 2){
      MonthPracticeAnswer answer = answers[answers.length - 2];
      StringBuffer tmp = StringBuffer("${answer.month.string.capitalize()}");
      if (_showCorrect){
        tmp.write(": ${answer.month.value}");
      }
      questions.add(
        Opacity(
          opacity: 0.3,
          child: Text(
              tmp.toString(),
            style: TextStyle(
              fontSize: 10,
              color: answer.answer == answer.month.value ? Colors.green : Colors.red
            )
          )
        )
      );
    } else {
      questions.add(
          Opacity(
              opacity: 0.6,
              child: Text(
                  "-",
                  style: TextStyle(fontSize: 10)
              )
          )
      );
    }
    if(answers.length >= 1){
      MonthPracticeAnswer answer = answers[answers.length - 1];
      StringBuffer tmp = StringBuffer("${answer.month.string.capitalize()}");
      if (_showCorrect){
        tmp.write(": ${answer.month.value}");
      }
      questions.add(
          Opacity(
              opacity: 0.6,
              child: Text(
                  tmp.toString(),
                  style: TextStyle(
                    fontSize: 15,
                    color: answer.answer == answer.month.value ? Colors.green : Colors.red
                  )
              )
          )
      );
    } else {
      questions.add(
          Opacity(
              opacity: 0.6,
              child: Text(
                  "-",
                  style: TextStyle(fontSize: 15)
              )
          )
      );
    }
    questions.add(
        Text(
            practiceGenerator.toString(),
            style: TextStyle(
              fontSize: 30,
            )
        )
    );
    return Column(
        children: questions
    );
  }

  Widget getButtons(){
    List<Widget> buttons = List<Widget>();
    for(int i in [1,2,3,4,5,6,-1,0,-1]){
      if (i == -1){
        buttons.add(Container());
        continue;
      }
      buttons.add(
        FlatButton(
            onPressed: () {
              checkMonth(i);
            },
            color: Colors.blue,
            textColor: Colors.white,
            child: Text(
              i.toString(),
              style: TextStyle(fontSize: 30)
            )
        )
      );
    }
    return GridView.count(
      primary: false,
      crossAxisCount: 3,
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      shrinkWrap: true,
      children: buttons
    );
  }

  SimpleDialog finishedPracticeDialog() {
    return SimpleDialog(
      title: Text("Practice Complete!"),
      contentPadding: EdgeInsets.all(50),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Rounds of Practice:"),
            Text(_startCount.toString())
          ]
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Correct:"),
              Text(_correct.toString()),
            ]
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Incorrect:"),
              Text(_incorrect.toString()),
            ]
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                (_correct / _startCount * 100).round().toString() + "%",
                style: TextStyle(
                  color: (_correct / _startCount * 100) > 70 ? Colors.green : Colors.red,
                  fontSize: 30,
                )
              ),
            ]
        ),
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    PracticeSetup setup = ModalRoute.of(context).settings.arguments;
    _startCount = setup.count;
    _showCorrect = setup.showCorrect;
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Practicing months"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                        "Correct: " + _correct.toString(),
                        style: TextStyle(
                          fontSize: 20,
                        )
                    ),
                    Text(
                        (_startCount - _count).toString() + " Left",
                        style: TextStyle(
                          fontSize: 20,
                        )
                    ),
                    Text(
                        "Incorrect: " + _incorrect.toString(),
                        style: TextStyle(
                          fontSize: 20,
                        )
                    )
                  ],
                ),
                getQuestions(),
                getButtons(),
                Align(
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
    if(practiceGenerator.check(answer)){
      _correct += 1;
    } else {
      _incorrect += 1;
    }
    _count += 1;
    answers.add(MonthPracticeAnswer(practiceGenerator.current, answer));
    setState(() => {
      practiceGenerator.next()
    });
    if((_startCount - _count) == 0) {
      showDialog(
        context: context,
        child: finishedPracticeDialog()
      ).then((val) {
        Navigator.pop(context);
      });
      return;
    }
  }
}