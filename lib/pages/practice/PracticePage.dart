import 'package:flutter/material.dart';
import 'package:ohthatsa/pages/practice/PracticeDatabase.dart';
import 'package:ohthatsa/pages/practice/PracticeSetup.dart';
import 'package:ohthatsa/pages/practice/thing/PracticeThing.dart';
import 'package:ohthatsa/pages/practice/thing/PracticeThingAll.dart';
import 'package:ohthatsa/pages/practice/thing/PracticeThingCentury.dart';
import 'package:ohthatsa/pages/practice/thing/PracticeThingLeap.dart';
import 'package:ohthatsa/pages/practice/thing/PracticeThingMod.dart';
import 'package:ohthatsa/pages/practice/thing/PracticeThingMonth.dart';
import 'package:ohthatsa/other/AppDrawer.dart';
import 'package:ohthatsa/pages/practice/PracticeType.dart';
import 'package:ohthatsa/pages/practice/thing/PracticeThingYear.dart';


class PracticePage extends StatefulWidget {
  final PracticeSetup practiceSetup;
  PracticePage(
      this.practiceSetup
  );
  @override
  PracticePageState createState() => PracticePageState(practiceSetup);
}

class PracticePageState extends State<PracticePage> {
  int _startCount = 0;
  bool _showCorrect = true;
  PracticeType practiceType;
  PracticeThing practiceThing;

  int _count = 0;
  int _correct = 0;
  int _incorrect = 0;

  PracticePageState(PracticeSetup practiceSetup){
    this._startCount = practiceSetup.count;
    this._showCorrect = practiceSetup.showCorrect;
    practiceType = practiceSetup.practiceType;
    switch(practiceType){
      case (PracticeType.month): {
        this.practiceThing = PracticeThingMonth(this);
        break;
      }
      case (PracticeType.year): {
        this.practiceThing = PracticeThingYear(this);
        break;
      }
      case (PracticeType.century): {
        this.practiceThing = PracticeThingCentury(this);
        break;
      }
      case (PracticeType.leap): {
        this.practiceThing = PracticeThingLeap(this);
        break;
      }
      case (PracticeType.mod): {
        this.practiceThing = PracticeThingMod(this);
        break;
      }
      case (PracticeType.all): {
        this.practiceThing = PracticeThingAll(this);
        break;
      }
      default: {
        break;
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

  SimpleDialog finishedPracticeDialog() {
    return SimpleDialog(
      title: Text(
          "Practice Complete!",
          style: TextStyle(fontSize: 25, color: Colors.blue)
      ),
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
                practiceThing.getButtons(),
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
      PracticeDatabase.insertAnswers(practiceThing.answers, practiceType);

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