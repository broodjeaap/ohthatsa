import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:ohthatsa/AppDrawer.dart';
import 'package:ohthatsa/pages/practice/month/MonthPracticeSetup.dart';

class MonthPracticeSetupPage extends StatefulWidget {
  @override
  _MonthPracticeSetupState createState() => _MonthPracticeSetupState();
}

class _MonthPracticeSetupState extends State<MonthPracticeSetupPage> {
  int _count = 5;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Practice Months"),
      ),
      body: Center(
        child: new Column(
          children: <Widget>[
            new Text("How many times would you like to practice?"),
            new NumberPicker.integer(
                initialValue: _count,
                minValue: 1,
                maxValue: 1000000,
                onChanged: (newNumber) =>
                    setState(() => _count = newNumber),
            ),
            new FlatButton(
              onPressed: () {
                Navigator.pushNamed(
                    context,
                    '/practice/month/practice',
                  arguments: MonthPracticeSetup(_count)
                );
              },
              child: new Text("Start!"),
              color: Colors.blue,
              textColor: Colors.white,
              padding: EdgeInsets.all(8.0)
            )
          ]
        )
      )
    );
  }
}

