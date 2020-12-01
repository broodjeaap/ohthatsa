import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ohthatsa/AppDrawer.dart';
import 'package:ohthatsa/main.dart';
import 'package:ohthatsa/pages/practice/thing/PracticeThing.dart';
import 'package:ohthatsa/pages/practice/thing/PracticeThingAll.dart';
import 'package:ohthatsa/pages/practice/thing/PracticeThingYear.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Notifications")
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            child: Text("Notify!"),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: _notify
          ),
          FlatButton(
              child: Text("Schedule notification!"),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: _scheduleNotify
          ),
          FlatButton(
              child: Text("Repeat!"),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: _repeatNotification
          ),
          FlatButton(
              child: Text("Waiting?"),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: _checkPendingNotificationRequests
          ),
          FlatButton(
              child: Text("Cancel"),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: _cancelAllNotifications
          ),
        ],
      )
    );
  }

  Future<void> _notify() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails("test", "test", "test", ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'Title!',
      'and the body...\nnewline;alskdjf;leowijhfraojnfoeiurhowieurhlaskbjdfowiuehrpwqiuehrwiejhraowlijehbrwaoliuh?',
      platformChannelSpecifics,
      payload: "test item?"
    );
  }

  Future<void> _scheduleNotify() async {
    PracticeThingAll pt = PracticeThingAll();

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      pt.dateFormatter.format(pt.current),
      pt.weekdayFormatter.format(pt.current),
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
      const NotificationDetails(
        android: AndroidNotificationDetails("id", "name", "desc")
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time
    );
  }

  Future<void> _checkPendingNotificationRequests() async {
    final List<PendingNotificationRequest> pendingNotificationRequests =
    await flutterLocalNotificationsPlugin.pendingNotificationRequests();
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content:
        Text('${pendingNotificationRequests.length} pending notification '
            'requests'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<void> _repeatNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        'id',
        'name',
        'desc'
    );
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.periodicallyShow(0, 'repeating title',
        'repeating body', RepeatInterval.hourly, platformChannelSpecifics,
        androidAllowWhileIdle: true);
  }

  Future<void> _cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}