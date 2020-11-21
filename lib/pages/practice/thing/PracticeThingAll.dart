import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/src/widgets/text.dart';
import 'package:ohthatsa/pages/practice/PracticeAnswer.dart';
import 'package:ohthatsa/pages/practice/thing/PracticeThing.dart';

class PracticeThingAll extends PracticeThing {
  DateTime current;
  final dateFormatter = DateFormat.yMMMMd();
  final weekdayFormatter = DateFormat.EEEE();

  final monthList = [
    DateTime.january,
    DateTime.february,
    DateTime.march,
    DateTime.may,
    DateTime.june,
    DateTime.july,
    DateTime.august,
    DateTime.september,
    DateTime.october,
    DateTime.november,
    DateTime.december
  ];

  PracticeThingAll() {
    next();
  }

  @override
  bool isCorrect(int answer){
    return (current.weekday % 7) == answer;
  }

  @override
  bool answer(int answer) {
    bool isCorrect = this.isCorrect(answer);
    answers.add(PracticeAnswer(current.millisecondsSinceEpoch, answer, isCorrect));
    return isCorrect;
  }

  @override
  void next() {
    var year = 1700 + random.nextInt(500);
    var month = monthList[random.nextInt(monthList.length)];
    var dt1 = DateTime.utc(year, month, 0);
    var dt2 = DateTime.utc( // Wrap to next year january if month is dec
      year + (month == DateTime.december ? 1 : 0),
      (month == DateTime.december ? 1 : month+1),
      0
    );
    var daysInMonth = dt2.difference(dt1);
    current = DateTime.utc(
      year,
      month,
      random.nextInt(daysInMonth.inDays) + 1
    );
  }

  List<bool> getBoolAnswers() {
    return answers.map((answer) =>
      answer.correct
    ).toList();
  }

  Text getAppBarTitleText() {
    return Text("Practicing Days");
  }

  Text getCurrentQuestionText(){
    return Text(
      dateFormatter.format(current),
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
      final dt = DateTime.fromMillisecondsSinceEpoch(answer.question, isUtc: true);
      final weekdayString = weekdayFormatter.format(dt);
      final correctAnswer = dt.weekday % 7;
      text = dateFormatter.format(dt) + (showCorrect ? ": $weekdayString ($correctAnswer)" : "");
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
      final dt = DateTime.fromMillisecondsSinceEpoch(answer.question, isUtc: true);
      final weekdayString = weekdayFormatter.format(dt);
      final correctAnswer = dt.weekday % 7;
      text = dateFormatter.format(dt) + (showCorrect ? ": $weekdayString ($correctAnswer)" : "");
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