import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:ohthatsa/other/AppDrawer.dart';
import 'package:ohthatsa/util/DayCalculator.dart';
import 'package:ohthatsa/util/Months.dart';

class AllInstructionPage extends StatefulWidget {
  @override
  _AllInstructionPageState createState() => _AllInstructionPageState();
}

class _AllInstructionPageState extends State<AllInstructionPage> {

  @override
  void initState(){
    super.initState();
  }

  static const textStyle = TextStyle(
      fontSize: 20
  );
  static const textStyleU = TextStyle(
      fontSize: 20,
      decoration: TextDecoration.underline
  );
  static const valueStyle = TextStyle(
      color: Colors.green,
      fontSize: 20
  );
  @override
  Widget build(BuildContext context){
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
            title: Text("All Instructions")
        ),

        body: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0, 50, 0, 10),
                child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Modulus (Mod) is the remainder after dividing", style: textStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("value.toString()", style: valueStyle),
                          Text(" divided by 7 is " + "div.toString()", style: textStyle),
                        ],
                      ),
                      Text("But that leaves " + "remainder.toString()" + " left over", style: textStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("So the result of ", style: textStyle),
                          Text("value.toString()", style: valueStyle),
                          Text(" mod 7 is ", style: textStyle),
                          Text("remainder.toString()", style: textStyleU),
                        ],
                      ),
                    ]
                ),
              ),
            ]
        )
    );
  }
}