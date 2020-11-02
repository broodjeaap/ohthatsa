import 'package:flutter/material.dart';
import 'package:ohthatsa/pages/YearsPage.dart';
import 'package:ohthatsa/pages/practice/PracticeSetup.dart';

import 'package:ohthatsa/pages/practice/PracticeSetupPage.dart';
import 'file:///D:/dev/projects/ohthatsa/lib/pages/practice/PracticePage.dart';
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
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case "/monthValues": {
        return MaterialPageRoute(builder: (context) => MonthValuesPage());
      }
      case "/years": {
        return MaterialPageRoute(builder: (context) => YearsPage());
      }
      case "/practice/setup": {
        return MaterialPageRoute(builder: (context) => PracticeSetupPage());
      }
      case "/practice/month/practice": {
        return MaterialPageRoute(builder: (context) => PracticePage(settings.arguments));
      }
      default: {
        return MaterialPageRoute(builder: (context) => YearsPage());
      }
    }
  }
}


