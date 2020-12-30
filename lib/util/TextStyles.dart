import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static const TextStyle textStyle15 = TextStyle(fontSize: 15);

  static const TextStyle textStyle20 = TextStyle(fontSize: 20);
  static const TextStyle textStyle20u = TextStyle(fontSize: 20, decoration: TextDecoration.underline);
}

class Text15 extends StatelessWidget {
  final String text;

  Text15(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        this.text,
        style: TextStyles.textStyle15
    );
  }
}


class Text20 extends StatelessWidget {
  final String text;
  final TextDecoration decor;
  final Color color;

  Text20(
      this.text, {
        this.decor = TextDecoration.none,
        this.color = Colors.black,
        Key key
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(
        fontSize: 20,
        color: color,
        decoration: decor,
      ),
    );
  }
}

class Text20u extends StatelessWidget {
  final String text;

  Text20u(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        this.text,
        style: TextStyles.textStyle20u
    );
  }
}