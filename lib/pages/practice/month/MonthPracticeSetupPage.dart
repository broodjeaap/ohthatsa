import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:ohthatsa/AppDrawer.dart';

class MonthPracticeSetupPage extends StatefulWidget {
  @override
  _MonthPracticeSetupState createState() => _MonthPracticeSetupState();
}

class _MonthPracticeSetupState extends State<MonthPracticeSetupPage> {
  int _number = 5;
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
                initialValue: _number,
                minValue: 1,
                maxValue: 1000000,
                onChanged: (newNumber) =>
                    setState(() => _number = newNumber),
            ),
            new FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, '/practice/month/practice');
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

