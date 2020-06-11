import 'package:flutter/material.dart';

import 'AppDrawer.dart';

class YearsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Overview"),
      ),
      body: Center(
          child: Text("Years page")
      )
    );
  }
}