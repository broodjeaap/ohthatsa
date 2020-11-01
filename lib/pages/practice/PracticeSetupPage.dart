import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:ohthatsa/AppDrawer.dart';
import 'package:ohthatsa/pages/practice/PracticeSetup.dart';

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
        title: Text("Practice"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "How many rounds",
                    style: TextStyle(fontSize: 20),
                  ),
                  NumberPicker.integer(
                    initialValue: _count,
                    minValue: 1,
                    maxValue: 500,
                    onChanged: (newNumber) =>
                        setState(() => _count = newNumber),
                  )
                ]
              ),
              CheckboxListTile(
                title: Text(
                  "Show correct Answer",
                  style: TextStyle(fontSize: 20)
                ),
                value: _showCorrect,
                onChanged: (value) {
                  setState(() {
                    _showCorrect = !_showCorrect;
                  });
                }
              ),
              Spacer(),
              Table(
                border: TableBorder(
                  //horizontalInside: BorderSide(),
                  //verticalInside: BorderSide()
                ),
                children: <TableRow>[
                  TableRow(
                    children: <Widget>[
                      // Header
                      Text(""),
                      Text("7d", textAlign: TextAlign.center, style: TextStyle(fontSize: 25)),
                      Text("30d", textAlign: TextAlign.center, style: TextStyle(fontSize: 25)),
                      Text("All", textAlign: TextAlign.center, style: TextStyle(fontSize: 25))
                    ]
                  ),
                  TableRow(
                    children: <Widget>[
                      FlatButton(
                        child: Text("Month"),
                        color: Colors.blue,
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(
                              context,
                              '/practice/month/practice',
                              arguments: PracticeSetup(_count, _showCorrect)
                          );
                        },
                      ),
                      Text("85%", textAlign: TextAlign.center, style: TextStyle(fontSize: 25)),
                      Text("70%", textAlign: TextAlign.center, style: TextStyle(fontSize: 25)),
                      Text("50%", textAlign: TextAlign.center, style: TextStyle(fontSize: 25))
                    ]
                  ),
                  TableRow(
                    children: <Widget>[
                      FlatButton(
                        child: Text("Year"),
                        color: Colors.blue,
                        textColor: Colors.white,
                        onPressed: () {},
                      ),
                      Text("80%", textAlign: TextAlign.center, style: TextStyle(fontSize: 25)),
                      Text("70%", textAlign: TextAlign.center, style: TextStyle(fontSize: 25)),
                      Text("50%", textAlign: TextAlign.center, style: TextStyle(fontSize: 25))
                    ]
                  ),
                  TableRow(
                    children: <Widget>[
                      FlatButton(
                        child: Text("Leap"),
                        color: Colors.blue,
                        textColor: Colors.white,
                        onPressed: () {},
                      ),
                      Text("80%", textAlign: TextAlign.center, style: TextStyle(fontSize: 25)),
                      Text("70%", textAlign: TextAlign.center, style: TextStyle(fontSize: 25)),
                      Text("50%", textAlign: TextAlign.center, style: TextStyle(fontSize: 25))
                    ]
                  ),
                  TableRow(
                    children: <Widget>[
                      FlatButton(
                        child: Text("All"),
                        color: Colors.blue,
                        textColor: Colors.white,
                        onPressed: () {},
                      ),
                      Text("80%", textAlign: TextAlign.center, style: TextStyle(fontSize: 25)),
                      Text("70%", textAlign: TextAlign.center, style: TextStyle(fontSize: 25)),
                      Text("50%", textAlign: TextAlign.center, style: TextStyle(fontSize: 25))
                    ]
                  ),
                ]
              ),
            ]
          )
        )
      )
    );
  }
}

