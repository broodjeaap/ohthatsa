import 'package:flutter/material.dart';
import 'package:ohthatsa/pages/practice/PracticeSetupPage.dart';
import 'package:ohthatsa/pages/practice/PracticePage.dart';

import 'package:ohthatsa/pages/practice/instructions/LeapInstructionPage.dart';
import 'package:ohthatsa/pages/practice/instructions/MonthInstructionPage.dart';
import 'package:ohthatsa/pages/practice/instructions/YearInstructionPage.dart';
import 'package:ohthatsa/pages/practice/instructions/CenturyInstructionPage.dart';
import 'package:ohthatsa/pages/practice/instructions/ModInstructionPage.dart';
import 'package:ohthatsa/pages/practice/instructions/AllInstructionPage.dart';


Future<void> main() async {
  runApp(OhThatsA());
}

class OhThatsA extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "OhThatsA",
      home: PracticeSetupPage(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case "/": {
        return MaterialPageRoute(builder: (context) => PracticeSetupPage());
      }
      case "/practice/setup": {
        return MaterialPageRoute(builder: (context) => PracticeSetupPage());
      }
      case "/practice/practice": {
        return MaterialPageRoute(builder: (context) => PracticePage(settings.arguments));
      }
      case "/instructions/month": {
        return MaterialPageRoute(builder: (context) => MonthInstructionPage());
      }
      case "/instructions/year": {
        return MaterialPageRoute(builder: (context) => YearInstructionPage());
      }
      case "/instructions/century": {
        return MaterialPageRoute(builder: (context) => CenturyInstructionPage());
      }
      case "/instructions/leap": {
        return MaterialPageRoute(builder: (context) => LeapInstructionPage());
      }
      case "/instructions/mod": {
        return MaterialPageRoute(builder: (context) => ModInstructionPage());
      }
      case "/instructions/all": {
        return MaterialPageRoute(builder: (context) => AllInstructionPage());
      }
      default: {
        return null;
      }
    }
  }


}


