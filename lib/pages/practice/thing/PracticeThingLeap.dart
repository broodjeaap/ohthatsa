import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/text.dart';
import 'package:ohthatsa/pages/practice/PracticeAnswer.dart';
import 'package:ohthatsa/pages/practice/thing/PracticeThing.dart';
import 'package:ohthatsa/pages/practice/PracticePage.dart';
import 'package:ohthatsa/util/DayCalculator.dart';

class PracticeThingLeap extends PracticeThing {
  int current;

  PracticeThingLeap(PracticePageState practicePageState) : super(practicePageState) {
    next();
  }

  @override
  bool isCorrect(int answer){
    final correctAnswer = DayCalculator.isLeapYear(current);
    return (answer != 0) == correctAnswer;
  }

  @override
  bool answer(int answer) {
    final isCorrect = this.isCorrect(answer);
    answers.add(PracticeAnswer(current, answer, isCorrect));
    return isCorrect;
  }

  @override
  void next() {
    current = random.nextInt(10000);
  }

  List<bool> getBoolAnswers(){
    return answers.map((answer) =>
      answer.correct
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
      final correctAnswer = DayCalculator.isLeapYear(answer.question);
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

  Widget getButtons(){
    return GridView.count(
        primary: false,
        crossAxisCount: 2,
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        shrinkWrap: true,
        children: <Widget>[
          FlatButton(
              onPressed: () {
                practicePageState.checkAnswer(0);
              },
              color: Colors.blue,
              textColor: Colors.white,
              child: Text(
                  "0",
                  style: TextStyle(fontSize: 30)
              )
          ),
          FlatButton(
              onPressed: () {
                practicePageState.checkAnswer(1);
              },
              color: Colors.blue,
              textColor: Colors.white,
              child: Text(
                  "1",
                  style: TextStyle(fontSize: 30)
              )
          )
        ]
    );
  }
}