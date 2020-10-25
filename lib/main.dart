import 'package:flutter/material.dart';
import 'file:///D:/dev/projects/ohthatsa/lib/pages/practice/PracticeSetupPage.dart';
import 'package:ohthatsa/pages/YearsPage.dart';

import 'package:ohthatsa/pages/practice/month/MonthPracticePage.dart';
import 'package:ohthatsa/pages/MonthValuesPage.dart';

void main() {
  runApp(OhThatsA());
}

class OhThatsA extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "OhThatsA",
      initialRoute: '/years',
      routes: {
        '/monthValues': (context) => MonthValuesPage(),
        '/years': (context) => YearsPage(),
        '/practice/month/setup': (context) => PracticeSetupPage(),
        '/practice/month/practice': (context) => MonthPracticePage(),
      }
    );
  }
}


