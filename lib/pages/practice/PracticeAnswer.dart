import 'package:intl/intl.dart';
import 'package:ohthatsa/pages/practice/PracticeDatabase.dart';
import 'package:ohthatsa/pages/practice/PracticeType.dart';
import 'package:ohthatsa/util/Months.dart';

class PracticeAnswer {
  final int question;
  final int answer;
  final PracticeType practiceType;
  DateTime dateTime;

  PracticeAnswer(this.question, this.answer, this.practiceType){
    dateTime = DateTime.now();
  }

  Map<String, dynamic> toMap() {
    // Should match the SQLite format YYYY-MM-DD HH:MM:SS.SSS
    String timeFormat = DateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(dateTime);
    return <String, dynamic>{
      "question": question,
      "answer": answer,
      "type": practiceType.toString().split(".").last,
      "time": timeFormat
    };
  }
}