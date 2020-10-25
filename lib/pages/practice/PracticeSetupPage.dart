import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:ohthatsa/AppDrawer.dart';
import 'file:///D:/dev/projects/ohthatsa/lib/pages/practice/PracticeSetup.dart';

class PracticeSetupPage extends StatefulWidget {
  @override
  _PracticeSetupState createState() => _PracticeSetupState();
}

class _PracticeSetupState extends State<PracticeSetupPage> {
  int _count = 12;
  bool _showCorrect = true;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Practice Months"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Text(
                "How many rounds?",
                style: TextStyle(fontSize: 30),
              ),
              NumberPicker.integer(
                  initialValue: _count,
                  minValue: 1,
                  maxValue: 500,
                  onChanged: (newNumber) =>
                      setState(() => _count = newNumber),
              ),
              SizedBox(height: 30),
              CheckboxListTile(
                title: Text("Show correct Answer"),
                value: _showCorrect,
                onChanged: (value) {
                  setState(() {
                    _showCorrect = !_showCorrect;
                  });
                }
              ),
              SizedBox(height: 30),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context,
                      '/practice/month/practice',
                    arguments: PracticeSetup(_count, _showCorrect)
                  );
                },
                child: Text("Start!"),
                color: Colors.blue,
                textColor: Colors.white,
                padding: EdgeInsets.all(8.0)
              )
            ]
          )
        )
      )
    );
  }
}

