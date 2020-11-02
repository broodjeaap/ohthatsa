import 'package:flutter/material.dart';

abstract class PracticeThing {
  bool answer(int answer);
  void next();
  List<bool> getBoolAnswers();
  Text getAppBarTitleText();
  Text getCurrentQuestionText();
  Text getLastAnswerText(bool showCorrect);
  Text getSecondLastAnswerText(bool showCorrect);
}