import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Color? color;
  final icon;
  final Color? iconColor;
  final Color? splash;
  final Function() press;
  const CustomIconButton({
    Key? key,
    required this.color,
    this.icon,
    required this.iconColor,
    required this.splash,
    required this.press,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Theme(
      data: ThemeData(
        splashColor: splash,
      ),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: FlatButton(
          minWidth: size.width * 0.35,
          height: 50,
          color: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(29.0)),
          child: Icon(
            icon,
            color: iconColor,
          ),
          onPressed: press,
        ),
      ),
    );
  }
}
