import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:ohthatsa/other/AppDrawer.dart';
import 'package:ohthatsa/util/DayCalculator.dart';
import 'package:ohthatsa/util/Months.dart';

class ModInstructionPage extends StatefulWidget {
  @override
  _ModInstructionPageState createState() => _ModInstructionPageState();
}

class _ModInstructionPageState extends State<ModInstructionPage> {
  int value;
  int div;
  int remainder;

  @override
  void initState(){
    super.initState();
    this.setValue(5);
  }

  void setValue(int newValue){
    value = newValue;
    div = value ~/ 7;
    remainder = value % 7;
    setState(() {});
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
            title: Text("Modulus Instructions")
        ),

        body: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 10),
                  child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Modulus (Mod) is the remainder after dividing", style: textStyle),
                        NumberPicker.integer(
                            initialValue: value,
                            minValue: 0,
                            maxValue: 150,
                            onChanged: (newValue) => { this.setValue(newValue) }
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(value.toString(), style: valueStyle),
                            Text(" divided by 7 is " + div.toString(), style: textStyle),
                          ],
                        ),
                        Text("But that leaves " + remainder.toString() + " left over", style: textStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("So the result of ", style: textStyle),
                            Text(value.toString(), style: valueStyle),
                            Text(" mod 7 is ", style: textStyle),
                            Text(remainder.toString(), style: textStyleU),
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