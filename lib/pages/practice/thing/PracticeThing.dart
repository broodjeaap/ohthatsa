import 'dart:math';

import 'package:flutter/material.dart';

import 'package:ohthatsa/pages/practice/PracticeAnswer.dart';
import 'package:ohthatsa/pages/practice/PracticePage.dart';

abstract class PracticeThing {
  final random = Random();
  final List<PracticeAnswer> answers = new List<PracticeAnswer>();

  final PracticePageState practicePageState;

  PracticeThing(this.practicePageState){
    next();
  }

  bool isCorrect(int answer);
  bool answer(int answer);
  void next();
  List<bool> getBoolAnswers();
  Text getAppBarTitleText();
  Text getCurrentQuestionText();
  Text getLastAnswerText(bool showCorrect);
  Text getSecondLastAnswerText(bool showCorrect);

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
                practicePageState.checkAnswer(i);
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
}