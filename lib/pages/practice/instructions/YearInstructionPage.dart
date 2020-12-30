import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

import 'package:ohthatsa/other/AppDrawer.dart';
import 'package:ohthatsa/util/DayCalculator.dart';
import 'package:ohthatsa/util/TextStyles.dart';
import 'package:term_glyph/term_glyph.dart' as glyph;

class YearInstructionPage extends StatefulWidget {
  @override
  _YearInstructionPageState createState() => _YearInstructionPageState();
}

class _YearInstructionPageState extends State<YearInstructionPage> {
  int year;
  int yy;
  String centuriesString;
  String yyString;
  double yyDiv4;
  int yyDiv4Floored;
  int yearValue;

  @override
  void initState(){
    super.initState();
    this.setYearValues(DateTime.now().year);
  }
  void setYearValues(newYear){
    year = newYear;
    yy = year % 100;
    centuriesString = (year ~/ 100).toString();
    yyString = year.toString().substring(2);
    yyDiv4 = yy / 4;
    yyDiv4Floored = yyDiv4.floor();
    yearValue = DayCalculator.getYearValue(year);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
            title: Text("Year Instructions")
        ),
        body: PageView(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text20("Take only the last two digits: "),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("YY", style: TextStyles.textStyle20.apply(color: Colors.grey)),
                          Text("YY", style: TextStyles.textStyle20.apply(color: Colors.green)),
                        ],
                      ),
                      Text20("Calculate:"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text20("("),
                          Text("YY", style: TextStyles.textStyle20.apply(color: Colors.green)),
                          Text20(" + floor("),
                          Text("YY", style: TextStyles.textStyle20.apply(color: Colors.green)),
                          Text20(" / 4)) % 7"),
                        ],
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("1", style: TextStyles.textStyle20.apply(color: Colors.blue)),
                          Text(" - ", style: TextStyles.textStyle20.apply(color: Colors.grey)),
                          Text("2", style: TextStyles.textStyle20.apply(color: Colors.grey)),
                        ],
                      )
                    ],
                  )
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(0, 50, 0, 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        NumberPicker.integer(
                            initialValue: year,
                            minValue: 1700,
                            maxValue: 2399,
                            onChanged: (newYear) => this.setYearValues(newYear)
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text20("For "),
                            Text20(centuriesString),
                            Text(year.toString().substring(2), style: TextStyles.textStyle20.apply(color: Colors.green)),
                            Text20(" our formula becomes: "),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text20("("),
                            Text(yyString, style: TextStyles.textStyle20.apply(color: Colors.green)),
                            Text20(" + floor("),
                            Text(yyString, style: TextStyles.textStyle20u.apply(color: Colors.green)),
                            Text20u(" / 4"),
                            Text20(")) % 7"),
                          ],
                        ),
                        Text(glyph.unicodeGlyphs.downArrow, style: TextStyle(fontSize: 15)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text20("("),
                            Text(yyString, style: TextStyles.textStyle20u.apply(color: Colors.green)),
                            Text20(" + "),
                            Text20u("floor(" + yyDiv4.toString() + ")"),
                            Text20(") % 7"),
                          ],
                        ),
                        Text(glyph.unicodeGlyphs.downArrow, style: TextStyle(fontSize: 15)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text20u("("),
                            Text(yyString, style: TextStyles.textStyle20u.apply(color: Colors.green)),
                            Text20u(" + " + yyDiv4Floored.toString() + ")"),
                            Text20u(" % 7"),
                          ],
                        ),
                        Text(glyph.unicodeGlyphs.downArrow, style: TextStyle(fontSize: 15)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text20u((yy + yyDiv4Floored).toString()),
                            Text20u(" % 7"),
                          ],
                        ),
                        Text(glyph.unicodeGlyphs.downArrow, style: TextStyle(fontSize: 15)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text20("So the year value of " + year.toString() + " is: "),
                            Text20u(yearValue.toString()),
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("1", style: TextStyles.textStyle20.apply(color: Colors.grey)),
                            Text(" - ", style: TextStyles.textStyle20.apply(color: Colors.grey)),
                            Text("2", style: TextStyles.textStyle20.apply(color: Colors.blue)),
                          ],
                        )
                      ]
                  )
              )
            ]
        )
    );
  }
}