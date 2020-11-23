import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ohthatsa/pages/practice/PracticeAnswer.dart';
import 'package:ohthatsa/pages/practice/thing/PracticeThing.dart';
import 'package:ohthatsa/util/DayCalculator.dart';

class PracticeThingCentury extends PracticeThing {
  int current;

  PracticeThingCentury(){
    next();
  }

  @override
  bool isCorrect(int answer){
    final correctAnswer = DayCalculator.getCenturyValue(current);
    return answer == correctAnswer;
  }

  @override
  bool answer(int answer) {
    bool isCorrect = this.isCorrect(answer);
    answers.add(PracticeAnswer(current, answer, isCorrect));
    return isCorrect;
  }

  @override
  void next() {
    current = 1700 + random.nextInt(500);
  }

  List<bool> getBoolAnswers(){
    return answers.map((answer) =>
      answer.correct
    ).toList();
  }

  Text getAppBarTitleText(){
    return Text("Practicing Centuries");
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
      final correctAnswer = DayCalculator.getCenturyValue(answer.question);
      text = answer.question.toString() + (showCorrect ? ": $correctAnswer" : "");
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
      final correctAnswer = DayCalculator.getCenturyValue(answer.question);
      text = answer.question.toString() + (showCorrect ? ": $correctAnswer" : "");
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