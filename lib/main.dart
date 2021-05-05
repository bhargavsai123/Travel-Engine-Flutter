import 'package:flutter/material.dart';
import 'app_screens/welcome.dart';
import 'constants.dart';
import "app_screens/login.dart";

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Travel Engine",
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        accentColor: kPrimaryLightColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    ),
  );
}
