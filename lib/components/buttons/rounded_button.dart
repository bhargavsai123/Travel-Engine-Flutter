import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function() press;
  final Color color, textColor, splash;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    required this.color,
    required this.textColor,
    required this.splash,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: Theme(
        data: ThemeData(
          splashColor: splash,
          textTheme: GoogleFonts.montserratTextTheme(),
        ),
        child: Container(
          height: size.height * 0.07,
          child: FlatButton(
            // padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            onPressed: press,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
            ),
            color: color,
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
