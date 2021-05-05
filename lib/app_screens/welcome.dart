import 'package:flutter/material.dart';
import 'package:travel_engine/constants.dart';
import "package:travel_engine/components/rounded_button.dart";

const primaryColor = Color(0xFF7499F1);
const primaryLightColor = Color(0xFFB1CAFF);

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Travel Engine",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40.0, bottom: 30.0),
                child: Image.asset(
                  "images/welcome.jpg",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.0, bottom: 15.0),
                child: RoundedButton(
                  text: "Login",
                  press: () {},
                  color: kPrimaryColor,
                  textColor: kPrimaryLightColor,
                  splash: kPrimaryLightColor,
                ),
              ),
              RoundedButton(
                text: "Sign Up",
                press: () {},
                color: kPrimaryLightColor,
                textColor: kPrimaryColor,
                splash: kAccentColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
