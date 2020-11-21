import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:ohthatsa/AppDrawer.dart';
import 'package:ohthatsa/pages/practice/PracticeDatabase.dart';
import 'package:ohthatsa/pages/practice/PracticeSetup.dart';
import 'package:ohthatsa/pages/practice/PracticeType.dart';
import 'package:ohthatsa/util/Extensions.dart';

class PracticeSetupPage extends StatefulWidget {
  @override
  _PracticeSetupState createState() => _PracticeSetupState();
}

class _PracticeSetupState extends State<PracticeSetupPage> {
  int _count = 12;
  bool _showCorrect = true;
  final _ranges = ["", "7d", "30d", "All"];

  Future<Map<String, double>> _answerStats;

  @override
  void initState() {
    this._answerStats = PracticeDatabase.getStats();
    super.initState();
  }

  TableRow getStatTableRow(AsyncSnapshot<Map<String, double>> snapshot, PracticeType practiceType){
    final typeString = practiceType.toString().split(".").last;
    return TableRow(
        children: <Widget>[
          FlatButton(
            child: Text(typeString.capitalize()),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              Navigator.pushNamed(
                  context,
                  '/practice/practice',
                  arguments: PracticeSetup(_count, _showCorrect, practiceType)
              );
            },
          ),
          getStatTableText(snapshot.hasData ? snapshot.data["7d $typeString"] : null),
          getStatTableText(snapshot.hasData ? snapshot.data["30d $typeString"] : null),
          getStatTableText(snapshot.hasData ? snapshot.data["All $typeString"] : null),
        ]
    );
  }

  Widget getStatTableText(double value){
    var text = "-";
    var color = Colors.grey.shade500;
    if (value != null){
      text = value.toString() + "%";
      color = value >= 70 ? Colors.green : Colors.red;
    }
    return Align(
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 25,
          color: color,
        ),
        textAlign: TextAlign.center,
      )
    );
  }

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
              FutureBuilder<Map<String, double>>(
                future: _answerStats,
                builder: (BuildContext context, AsyncSnapshot<Map<String, double>> snapshot){
                  return Table(
                    children: <TableRow>[
                      TableRow(
                          children: <Widget>[ // Header
                            Text(""),
                            Text("7d", textAlign: TextAlign.center, style: TextStyle(fontSize: 25)),
                            Text("30d", textAlign: TextAlign.center, style: TextStyle(fontSize: 25)),
                            Text("All", textAlign: TextAlign.center, style: TextStyle(fontSize: 25))
                          ]
                      ),
                      getStatTableRow(snapshot, PracticeType.month),
                      getStatTableRow(snapshot, PracticeType.year),
                      getStatTableRow(snapshot, PracticeType.century),
                      getStatTableRow(snapshot, PracticeType.leap),
                      getStatTableRow(snapshot, PracticeType.mod),
                      getStatTableRow(snapshot, PracticeType.all),
                    ]
                  );
                }
              )
            ]
          )
        )
      )
    );
  }
}

