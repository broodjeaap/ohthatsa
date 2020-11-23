import 'package:intl/intl.dart';

class PracticeAnswer {
  final int question;
  final int answer;
  final bool correct;
  DateTime dateTime;
  int sessionId = -1;

  PracticeAnswer(this.question, this.answer, this.correct){
    dateTime = DateTime.now();
  }

  Map<String, dynamic> toMap() {
    // Should match the SQLite format YYYY-MM-DD HH:MM:SS.SSS
    String timeFormat = DateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(dateTime);
    return <String, dynamic>{
      "question": question,
      "answer": answer,
      "correct": correct ? 1 : 0,
      "time": timeFormat,
      "sessionId": sessionId
    };
  }
}