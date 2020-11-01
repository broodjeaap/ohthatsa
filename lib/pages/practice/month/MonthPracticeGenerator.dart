import 'dart:math';

import 'package:ohthatsa/pages/practice/PracticeGenerator.dart';
import 'package:ohthatsa/util/Months.dart';
import 'package:ohthatsa/util/Extensions.dart';

class MonthPracticeGenerator extends PracticeGenerator {
  final random = Random();
  Month current;
  MonthPracticeGenerator(){
    next();
  }
  bool check(int value){
    return current.value == value;
  }

  void next(){
    current = Months.getFromInt(random.nextInt(Months.length));
  }

  String toString(){
    return current.toString().capitalize();
  }
}