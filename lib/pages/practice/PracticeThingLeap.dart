import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/text.dart';
import 'package:ohthatsa/pages/practice/PracticeAnswer.dart';
import 'package:ohthatsa/pages/practice/PracticeThing.dart';
import 'package:ohthatsa/pages/practice/PracticeType.dart';
import 'package:ohthatsa/util/DayCalculator.dart';

class PracticeThingLeap extends PracticeThing {
  int current;

  PracticeThingLeap(){
    next();
  }

  @override
  bool answer(int answer) {
    answers.add(PracticeAnswer(current, answer));
    final correctAnswer = DayCalculator.isLeapYear(current);
    return (answer != 0) == correctAnswer;
  }

  @override
  void next() {
    current = random.nextInt(10000);
  }

  List<bool> getBoolAnswers(){
    return answers.map((answer) =>
      (answer.answer != 0) == DayCalculator.isLeapYear(answer.question)
    ).toList();
  }

  Text getAppBarTitleText(){
    return Text("Practicing Leap Years");
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
      final correctAnswer = DayCalculator.isLeapYear(answer.question);
      text = answer.question.toString() + (showCorrect ? ": $correctAnswer" : "");
      if((answer.answer != 0) == correctAnswer){
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
      final correctAnswer = DayCalculator.isLeapYear(answer.question);
      text = answer.question.toString() + (showCorrect ? ": $correctAnswer" : "");
      if((answer.answer != 0) == correctAnswer){
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