import 'dart:math';

import 'package:flutter/material.dart';

import 'PracticeAnswer.dart';

abstract class PracticeThing {
  final random = Random();
  final List<PracticeAnswer> answers = new List<PracticeAnswer>();

  bool answer(int answer);
  void next();
  List<bool> getBoolAnswers();
  Text getAppBarTitleText();
  Text getCurrentQuestionText();
  Text getLastAnswerText(bool showCorrect);
  Text getSecondLastAnswerText(bool showCorrect);
}