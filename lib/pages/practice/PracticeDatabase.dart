import 'dart:async';
import 'dart:core';

import 'package:ohthatsa/pages/practice/PracticeAnswer.dart';
import 'package:ohthatsa/pages/practice/PracticeType.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class PracticeDatabase {
  static _onCreate(Database database, int version) async {
    String types = PracticeType.values.map((type) => "'${type.toString().split(".").last}'").join(", ");
    await database.execute('''
    CREATE TABLE PracticeSession (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      type TEXT CHECK( type IN ($types) ) NOT NULL
    );
    ''');
    await database.execute('''
    CREATE TABLE PracticeAnswer (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      sessionId INTEGER NOT NULL,
      question INTEGER NOT NULL,
      answer INTEGER NOT NULL,
      time DATETIME NOT NULL,
      
      FOREIGN KEY(sessionId) REFERENCES PracticeSession(id)
    );
    ''');
  }

  static Future<Database> getDatabase() async {
    var databasesPath = await getDatabasesPath();
    final databaseName = "answers.db";

    return await openDatabase(
      join(databasesPath, databaseName),
      version: 1,
      onCreate: _onCreate
    );
  }

  static insertAnswers(List<PracticeAnswer> answers, PracticeType practiceType) async {
    var db = await getDatabase();
    int sessionId = await db.insert("PracticeSession",
        <String, dynamic>{
          "type": practiceType.toString().split(".").last
        }
    );
    var batch = db.batch();
    answers.forEach((answer) {
      answer.sessionId = sessionId;
      batch.insert("PracticeAnswer", answer.toMap());
    });
    await batch.commit(noResult: true);
    getStats();
  }

  static Future<Map<String, dynamic>> getStats() async {
    var db = await getDatabase();
    List<Map<String, dynamic>> answers = await db.rawQuery('''
      SELECT 
        PracticeSession.id as practice_id,
        PracticeAnswer.id as answer_id,
        PracticeSession.type as type,
        PracticeAnswer.question as question,
        PracticeAnswer.answer as answer,
        PracticeAnswer.time as time 
      FROM PracticeSession 
        INNER JOIN PracticeAnswer on PracticeSession.id = PracticeAnswer.id;''');
    print(answers);
    var first = answers.first;
    print(first["practice_id"]);
    print("something else");
  }
}