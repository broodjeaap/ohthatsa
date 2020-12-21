import 'package:flutter/material.dart';
import 'package:ohthatsa/pages/NotificationsPage.dart';
import 'package:ohthatsa/pages/YearsPage.dart';
import 'package:ohthatsa/pages/practice/PracticeSetup.dart';
import 'package:ohthatsa/pages/practice/PracticeSetupPage.dart';
import 'package:ohthatsa/pages/practice/PracticePage.dart';
import 'package:ohthatsa/pages/MonthValuesPage.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ohthatsa/pages/practice/instructions/YearInstructionPage.dart';
import 'package:rxdart/subjects.dart';
import 'package:flutter/services.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
  BehaviorSubject<ReceivedNotification>();

final BehaviorSubject<String> selectNotificationSubject =
  BehaviorSubject<String>();

const MethodChannel platform =
  MethodChannel('net.broodjeaap.othatsa');

class ReceivedNotification {
  ReceivedNotification({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.payload,
  });

  final int id;
  final String title;
  final String body;
  final String payload;
}


Future<void> main() async {

  // Notification stuff
  WidgetsFlutterBinding.ensureInitialized();

  await _configureLocalTimeZone();

  final NotificationAppLaunchDetails notificationAppLaunchDetails =
      await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

  const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');

  final IOSInitializationSettings initializationSettingsIOS =
  IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      onDidReceiveLocalNotification:
          (int id, String title, String body, String payload) async {
        didReceiveLocalNotificationSubject.add(ReceivedNotification(
            id: id, title: title, body: body, payload: payload));
      });
  const MacOSInitializationSettings initializationSettingsMacOS =
    MacOSInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false
    );
  final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
      macOS: initializationSettingsMacOS
  );
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onSelectNotification: (String payload) async {
      if (payload != null) {
        debugPrint('notification payload: $payload');
      }
      selectNotificationSubject.add(payload);
    }
  );
  // end of notification stuff the fuck

  runApp(OhThatsA());
}

Future<void> _configureLocalTimeZone() async {
  tz.initializeTimeZones();
  final String timeZoneName = await platform.invokeMethod('getTimeZoneName');
  tz.setLocalLocation(tz.getLocation(timeZoneName));
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
      case "/practice/practice": {
        return MaterialPageRoute(builder: (context) => PracticePage(settings.arguments));
      }
      case "/notifications": {
        return MaterialPageRoute(builder: (context) => NotificationsPage());
      }
      case "/instructions/year": {
        return MaterialPageRoute(builder: (context) => YearInstructionPage());
      }
      default: {
        return null;
      }
    }
  }


}


