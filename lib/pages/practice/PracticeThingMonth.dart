import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ohthatsa/pages/practice/PracticeThing.dart';
import 'package:ohthatsa/pages/practice/month/MonthPracticeAnswer.dart';
import 'package:ohthatsa/util/Months.dart';

class PracticeThingMonth extends PracticeThing {
  final random = Random();
  final List<MonthPracticeAnswer> answers = new List<MonthPracticeAnswer>();
  Month current;
  
  PracticeThingMonth(){
    next();
  }
  @override
  bool answer(int answer) {
    answers.add(MonthPracticeAnswer(current, answer));
    return current.value == answer;
  }

  @override
  void next() {
    current = Months.getFromInt(random.nextInt(Months.length));
  }

  List<bool> getBoolAnswers(){
    return answers.map((answer) => answer.month.value == answer.answer).toList();
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
      text = answer.month.toString() + (showCorrect ? ": ${answer.month.value}" : "");
      if(answer.month.value == answer.answer){
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
      text = answer.month.toString() + (showCorrect ? ": ${answer.month.value}" : "");
      if(answer.month.value == answer.answer){
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