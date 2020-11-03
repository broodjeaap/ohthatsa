import 'package:flutter/material.dart';
import 'package:ohthatsa/pages/practice/PracticeSetup.dart';
import 'package:ohthatsa/pages/practice/PracticeThing.dart';
import 'package:ohthatsa/pages/practice/PracticeThingCentury.dart';
import 'package:ohthatsa/pages/practice/PracticeThingLeap.dart';
import 'package:ohthatsa/pages/practice/PracticeThingMonth.dart';
import 'package:ohthatsa/AppDrawer.dart';
import 'package:ohthatsa/pages/practice/PracticeType.dart';
import 'package:ohthatsa/util/Extensions.dart';

import 'PracticeAnswer.dart';

class PracticePage extends StatefulWidget {
  final PracticeSetup practiceSetup;
  PracticePage(
      this.practiceSetup
  );
  @override
  _PracticeState createState() => _PracticeState(practiceSetup);
}

class _PracticeState extends State<PracticePage> {
  int _startCount = 0;
  bool _showCorrect = true;
  PracticeThing practiceThing;

  int _count = 0;
  int _correct = 0;
  int _incorrect = 0;

  _PracticeState(PracticeSetup practiceSetup){
    this._startCount = practiceSetup.count;
    this._showCorrect = practiceSetup.showCorrect;
    switch(practiceSetup.practiceType){
      case (PracticeType.month): {
        this.practiceThing = PracticeThingMonth();
        break;
      }
      case (PracticeType.century): {
        this.practiceThing = PracticeThingCentury();
        break;
      }
      case (PracticeType.leap): {
        this.practiceThing = PracticeThingLeap();
        break;
      }
      default: {
        //
      }
    }
  }

  Widget getAnswerRow(){
    List<Widget> answerBoxes = List<Widget>();
    answerBoxes.addAll(practiceThing.getBoolAnswers().map(
        (isCorrect) => Expanded(child: Container(height: 50, color: isCorrect ? Colors.green : Colors.red))
    ));
    answerBoxes.addAll(Iterable.generate(_startCount - _count).map(
        (_) => Expanded(child: Container(height: 50, color: Colors.blue))
    ));
    return Row(children: answerBoxes);
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
              checkAnswer(i);
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
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: practiceThing.getAppBarTitleText(),
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
                Column(
                  children: <Widget>[
                    Opacity(
                        opacity: 0.3,
                        child: practiceThing.getSecondLastAnswerText(_showCorrect)
                    ),
                    Opacity(
                        opacity: 0.6,
                        child: practiceThing.getLastAnswerText(_showCorrect)
                    ),
                    practiceThing.getCurrentQuestionText()
                  ]
                ),
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

  void checkAnswer(int answer){
    if(practiceThing.answer(answer)){
      _correct += 1;
    } else {
      _incorrect += 1;
    }
    _count += 1;
    setState(() => {
      practiceThing.next()
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