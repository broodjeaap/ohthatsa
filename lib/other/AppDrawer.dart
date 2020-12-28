import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text("Oh That's A ..."),
          ),
          ListTile(
              title: Text("Practice"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/practice/setup");
              }
          ),
        ],
      )
    );
  }
}