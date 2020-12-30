import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:ohthatsa/other/AppDrawer.dart';
import 'package:ohthatsa/util/DayCalculator.dart';
import 'package:ohthatsa/util/Months.dart';
import 'package:ohthatsa/util/TextStyles.dart';

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
                        Text20("Modulus (Mod) is the remainder after dividing"),
                        NumberPicker.integer(
                            initialValue: value,
                            minValue: 0,
                            maxValue: 150,
                            onChanged: (newValue) => { this.setValue(newValue) }
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(value.toString(), style: TextStyles.textStyle20.apply(color: Colors.green)),
                            Text20(" divided by 7 is " + div.toString()),
                          ],
                        ),
                        Text20("But that leaves " + remainder.toString() + " left over"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text20("So the result of "),
                            Text(value.toString(), style: TextStyles.textStyle20.apply(color: Colors.green)),
                            Text20(" mod 7 is "),
                            Text(remainder.toString(), style: TextStyles.textStyle20.apply(decoration: TextDecoration.underline)),
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