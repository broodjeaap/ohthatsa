import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ohthatsa/pages/practice/thing/PracticeThing.dart';
import 'package:ohthatsa/pages/practice/PracticeType.dart';
import 'package:ohthatsa/pages/practice/PracticeAnswer.dart';
import 'package:ohthatsa/util/Months.dart';

class PracticeThingMonth extends PracticeThing {

  Month current;
  
  PracticeThingMonth(){
    next();
  }

  @override
  bool isCorrect(int answer){
    return current.value == answer;
  }


  @override
  bool answer(int answer) {
    final isCorrect = this.isCorrect(answer);
    answers.add(PracticeAnswer(current.i, answer, isCorrect));
    return isCorrect;
  }

  @override
  void next() {
    current = Months.getFromInt(random.nextInt(Months.length));
  }

  List<bool> getBoolAnswers(){
    return answers.map(
      (answer) => answer.correct
    ).toList();
  }

  Text getAppBarTitleText(){
    return Text("Practicing Months");
  }

  Text getCurrentQuestionText(){
    return Text(
      current.toString(),
      style: TextStyle(
        fontSize: 30
      )
    );
  }

  Text getLastAnswerText(bool showCorrect){
    String text = "-";
    Color color = Colors.red;
    if(answers.length >= 1){
      final answer = answers[answers.length - 1];
      final month = Months.getFromInt(answer.question);
      text = month.toString() + (showCorrect ? ": ${month.value}" : "");
      if(answer.correct){
        color = Colors.green;
      }
    }
    return Text(
      text,
      style: TextStyle(
        fontSize: 15,
        color: color
      )
    );
  }
  Text getSecondLastAnswerText(bool showCorrect){
    String text = "-";
    Color color = Colors.red;
    if(answers.length >= 2){
      final answer = answers[answers.length - 2];
      final month = Months.getFromInt(answer.question);
      text = month.toString() + (showCorrect ? ": ${month.value}" : "");
      if(answer.correct){
        color = Colors.green;
      }
    }
    return Text(
      text,
      style: TextStyle(
        fontSize: 10,
        color: color
      )
    );
  }
}