import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:ohthatsa/AppDrawer.dart';
import 'package:ohthatsa/pages/practice/PracticeDatabase.dart';
import 'package:ohthatsa/pages/practice/PracticeSetup.dart';
import 'package:ohthatsa/pages/practice/PracticeType.dart';

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
                      TableRow(
                          children: <Widget>[
                            FlatButton(
                              child: Text("Month"),
                              color: Colors.blue,
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.pushNamed(
                                    context,
                                    '/practice/practice',
                                    arguments: PracticeSetup(_count, _showCorrect, PracticeType.month)
                                );
                              },
                            ),
                            Text(
                                snapshot.hasData ?
                                snapshot.data["7d month"].toString() + "%" : "-",
                                textAlign: TextAlign.center, style: TextStyle(fontSize: 25)
                            ),
                            Text(
                                snapshot.hasData ?
                                snapshot.data["30d month"].toString() + "%" : "-",
                                textAlign: TextAlign.center, style: TextStyle(fontSize: 25)
                            ),
                            Text(
                                snapshot.hasData ?
                                snapshot.data["All month"].toString() + "%" : "-",
                                textAlign: TextAlign.center, style: TextStyle(fontSize: 25)
                            ),
                          ]
                      ),
                      TableRow(
                          children: <Widget>[
                            FlatButton(
                              child: Text("Century"),
                              color: Colors.blue,
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.pushNamed(
                                    context,
                                    '/practice/practice',
                                    arguments: PracticeSetup(_count, _showCorrect, PracticeType.century)
                                );
                              },
                            ),
                            Text(
                                snapshot.hasData ?
                                snapshot.data["7d century"].toString() + "%" : "-",
                                textAlign: TextAlign.center, style: TextStyle(fontSize: 25)
                            ),
                            Text(
                                snapshot.hasData ?
                                snapshot.data["30d century"].toString() + "%" : "-",
                                textAlign: TextAlign.center, style: TextStyle(fontSize: 25)
                            ),
                            Text(
                                snapshot.hasData ?
                                snapshot.data["All century"].toString() + "%" : "-",
                                textAlign: TextAlign.center, style: TextStyle(fontSize: 25)
                            ),
                          ]
                      ),
                      TableRow(
                          children: <Widget>[
                            FlatButton(
                              child: Text("Leap"),
                              color: Colors.blue,
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.pushNamed(
                                    context,
                                    '/practice/practice',
                                    arguments: PracticeSetup(_count, _showCorrect, PracticeType.leap)
                                );
                              },
                            ),
                            Text(
                                snapshot.hasData ?
                                snapshot.data["7d leap"].toString() + "%" : "-",
                                textAlign: TextAlign.center, style: TextStyle(fontSize: 25)
                            ),
                            Text(
                                snapshot.hasData ?
                                snapshot.data["30d leap"].toString() + "%" : "-",
                                textAlign: TextAlign.center, style: TextStyle(fontSize: 25)
                            ),
                            Text(
                                snapshot.hasData ?
                                snapshot.data["All leap"].toString() + "%" : "-",
                                textAlign: TextAlign.center, style: TextStyle(fontSize: 25)
                            ),
                          ]
                      ),
                      TableRow(
                          children: <Widget>[
                            FlatButton(
                              child: Text("Mod7"),
                              color: Colors.blue,
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.pushNamed(
                                    context,
                                    '/practice/practice',
                                    arguments: PracticeSetup(_count, _showCorrect, PracticeType.mod)
                                );
                              },
                            ),
                            Text(
                                snapshot.hasData ?
                                snapshot.data["7d mod"].toString() + "%" : "-",
                                textAlign: TextAlign.center, style: TextStyle(fontSize: 25)
                            ),
                            Text(
                                snapshot.hasData ?
                                snapshot.data["30d mod"].toString() + "%" : "-",
                                textAlign: TextAlign.center, style: TextStyle(fontSize: 25)
                            ),
                            Text(
                                snapshot.hasData ?
                                snapshot.data["All mod"].toString() + "%" : "-",
                                textAlign: TextAlign.center, style: TextStyle(fontSize: 25)
                            ),
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
                            Text(
                                snapshot.hasData ?
                                snapshot.data["7d mod"].toString() + "%" : "-",
                                textAlign: TextAlign.center, style: TextStyle(fontSize: 25)
                            ),
                            Text(
                                snapshot.hasData ?
                                snapshot.data["30d mod"].toString() + "%" : "-",
                                textAlign: TextAlign.center, style: TextStyle(fontSize: 25)
                            ),
                            Text(
                                snapshot.hasData ?
                                snapshot.data["All mod"].toString() + "%" : "-",
                                textAlign: TextAlign.center, style: TextStyle(fontSize: 25)
                            ),
                          ]
                      ),
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

