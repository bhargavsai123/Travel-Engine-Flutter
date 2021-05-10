import 'package:flutter/material.dart';
import 'package:travel_engine/app_screens/welcome.dart';
import 'package:travel_engine/constants.dart';

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
