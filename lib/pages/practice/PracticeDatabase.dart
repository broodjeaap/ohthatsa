import 'package:ohthatsa/pages/practice/PracticeAnswer.dart';
import 'package:ohthatsa/pages/practice/PracticeType.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class PracticeDatabase {
  Database _database;

  static PracticeDatabase getDatabase() {
    PracticeDatabase practiceDatabase = PracticeDatabase();
    practiceDatabase.open();
    return practiceDatabase;
  }

  _onCreate(Database database, int version) async {
    String types = PracticeType.values.map((type) => "'${type.toString().split(".").last}'").join(", ");
    await database.execute('''
    CREATE TABLE PracticeAnswer (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      question INTEGER NOT NULL,
      answer INTEGER NOT NULL,
      type TEXT CHECK( type IN ($types) ) NOT NULL,
      time DATETIME NOT NULL
    );
    ''');
  }

  Future open() async{
    var databasesPath = await getDatabasesPath();
    final databaseName = "answers.db";
    var path = join(databasesPath, databaseName);
    this._database = await openDatabase(
        path,
        version: 1,
        onCreate: _onCreate
    );
  }

  Future insertAnswer(PracticeAnswer answer) async {
    this._database.insert("PracticeAnswer", answer.toMap());
  }

  static insertAnswers(List<PracticeAnswer> answers) async {
    var practiceDatabase = PracticeDatabase();
    await practiceDatabase.open();
    answers.forEach((answer) {
      practiceDatabase.insertAnswer(answer);
    });
  }
}