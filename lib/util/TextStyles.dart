import 'package:flutter/cupertino.dart';

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

  Text20(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyles.textStyle20
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