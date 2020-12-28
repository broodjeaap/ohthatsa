import 'package:flutter/material.dart';
import 'package:ohthatsa/pages/practice/PracticeAnswer.dart';
import 'package:ohthatsa/pages/practice/PracticePage.dart';
import 'package:ohthatsa/pages/practice/thing/PracticeThing.dart';
import 'package:ohthatsa/pages/practice/PracticeType.dart';

class PracticeThingMod extends PracticeThing {
  int current;

  PracticeThingMod(PracticePageState practicePageState) : super(practicePageState) {
    next();
  }

  @override
  bool isCorrect(int answer){
    final correctAnswer = current % 7;
    return answer == correctAnswer;
  }

  @override
  bool answer(int answer) {
    final isCorrect = this.isCorrect(answer);
    answers.add(PracticeAnswer(current, answer, isCorrect));
    return isCorrect;
  }

  @override
  void next() {
    current = random.nextInt(141);
  }

  @override
  Text getAppBarTitleText() {
    return Text("Practicing Modulo");
  }

  @override
  List<bool> getBoolAnswers() {
    return answers.map((answer) =>
      answer.correct
    ).toList();
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
      final correctAnswer = answer.question % 7;
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
      final correctAnswer = answer.question % 7;
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