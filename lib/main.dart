import 'package:flutter/material.dart';
import 'file:///D:/dev/projects/ohthatsa/lib/pages/practice/MonthPracticeSetupPage.dart';
import 'file:///D:/dev/projects/ohthatsa/lib/pages/YearsPage.dart';

import 'pages/practice/month/MonthPracticePage.dart';
import 'pages/MonthValuesPage.dart';

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
        '/practice/month/setup': (context) => MonthPracticeSetupPage(),
        '/practice/month/practice': (context) => MonthPracticePage(),
      }
    );
  }
}


