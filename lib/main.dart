import 'package:flutter/material.dart';
import 'package:ohthatsa/YearsPage.dart';

import 'MonthValuesPage.dart';

void main() {
  runApp(OhThatsA());
}

class OhThatsA extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "OhThatsA",
      initialRoute: '/monthValues',
      routes: {
        '/monthValues': (context) => MonthValuesPage(),
        '/years': (context) => YearsPage(),
      }
    );
  }
}


