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
      correct BOOLEAN NOT NULL,
      FOREIGN KEY(sessionId) REFERENCES PracticeSession(id)
    );
    ''');
    await database.execute('''
    CREATE VIEW AnswersView AS
    SELECT
      PracticeSession.id as practice_id,
      PracticeAnswer.id as answer_id,
      PracticeSession.type as type,
      PracticeAnswer.question as question,
      PracticeAnswer.answer as answer,
      PracticeAnswer.correct as correct,
      PracticeAnswer.time as time
    FROM PracticeSession 
        INNER JOIN PracticeAnswer on PracticeSession.id = PracticeAnswer.sessionId;
    ''');
    await database.execute('''
    CREATE VIEW AnswersCorrectByTypeViewAll AS
    SELECT 
        type,
        SUM(correct = 1)*1.0 AS correct,
        SUM(correct = 0)*1.0 AS incorrect,
        COUNT(*) AS total
      FROM
        AnswersView
      GROUP BY
        type;
    ''');
    await database.execute('''
    CREATE VIEW AnswersCorrectByTypeView7d AS
    SELECT 
        type,
        SUM(correct = 1)*1.0 AS correct,
        SUM(correct = 0)*1.0 AS incorrect,
        COUNT(*) AS total,
        CAST(
          strftime('%s', time) 
          AS INTEGER
        ) as time,
        CAST(
          strftime("%s", DATETIME('now', '-7 day')) 
          AS INTEGER
        ) as before
      FROM
        AnswersView
      WHERE
        time > before
      GROUP BY
        type;
    ''');
    await database.execute('''
    CREATE VIEW AnswersCorrectByTypeView30d AS
    SELECT 
        type,
        SUM(correct = 1)*1.0 AS correct,
        SUM(correct = 0)*1.0 AS incorrect,
        COUNT(*) AS total,
        CAST(
          strftime('%s', time) 
          AS INTEGER
        ) as time,
        CAST(
          strftime("%s", DATETIME('now', '-1 month')) 
          AS INTEGER
        ) as before
      FROM
        AnswersView
      WHERE
        time > before
      GROUP BY
        type;
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
  }

  // TODO test the database
  static Future<Map<String, double>> getStats() async {
    var db = await getDatabase();
    List<Map<String, dynamic>> answers = await db.rawQuery('''
      SELECT
        "All" AS range,
        type,
        correct,
        incorrect,
        total,
        (correct / total) * 100 AS ratio
      FROM
        AnswersCorrectByTypeViewAll
      UNION ALL
      SELECT
        "7d" AS range,
        type,
        correct,
        incorrect,
        total,
        (correct / total) * 100 AS ratio
      FROM
        AnswersCorrectByTypeView7d
      UNION ALL
      SELECT
        "30d" AS range,
        type,
        correct,
        incorrect,
        total,
        (correct / total) * 100 AS ratio
      FROM
        AnswersCorrectByTypeView30d;
    ''');
    print(answers);
    var stats = getEmtpyStats();
    for(var stat in answers){
      var typeRange = "${stat['range']} ${stat['type']}";
      stats[typeRange] = stat['ratio'] as double;
    }
    print(stats);
    return stats;
  }

  static Map<String, double> getEmtpyStats(){
    Map<String, double> emptyStats = Map<String, double>();
    ["All", "30d", "7d"].forEach((range) => {
      PracticeType.values.forEach((type) {
        var typeRange = "$range ${type.toString().split(".").last}";
        emptyStats[typeRange] = 0;
      })
    });
    return emptyStats;
  }
}