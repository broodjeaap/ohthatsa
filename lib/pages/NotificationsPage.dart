import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ohthatsa/AppDrawer.dart';
import 'package:ohthatsa/main.dart';

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
          )
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
      'and the body...',
      platformChannelSpecifics,
      payload: "test item?"
    );

  }
}