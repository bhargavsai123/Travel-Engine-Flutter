import 'package:flutter/material.dart';
import "../constants.dart";

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor, splash;
  const RoundedButton(
      {Key key, this.text, this.press, this.color, this.textColor, this.splash})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Theme(
      data: ThemeData(splashColor: splash),
      child: Container(
        width: size.width * 0.84,
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          onPressed: press,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(29.0)),
          color: color,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
