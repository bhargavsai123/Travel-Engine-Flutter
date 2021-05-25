import 'package:bruh_123/app_screens/trips.dart';
import 'package:bruh_123/components/gap.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '../constants.dart';

import 'package:bruh_123/components/buttons/icon_button.dart';
import 'package:bruh_123/components/buttons/rounded_button.dart';
import 'package:bruh_123/components/custom_input.dart';

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  var email = TextEditingController();

  var password = TextEditingController();

  var confirmPassword = TextEditingController();

  var number = TextEditingController();

  var name = TextEditingController();

  // ignore: unused_element
  void _hideKeyboard() {
    final focus = FocusScope.of(context);
    if (!focus.hasPrimaryFocus) focus.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnimatedContainer(
        alignment: Alignment.center,
        curve: Curves.fastLinearToSlowEaseIn,
        duration: const Duration(milliseconds: 1000),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Travel Engine",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: kPrimaryColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 40.0),
              child: Image.asset(
                "images/welcome.png",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 15.0),
              child: RoundedButton(
                text: "Login",
                color: kPrimaryLightColor,
                textColor: kPrimaryColor,
                splash: kPrimaryColor,
                press: () {
                  buildLoginModal(context, size);
                },
              ),
            ),
            RoundedButton(
              text: "Sign Up",
              color: kPrimaryColor,
              textColor: kPrimaryLightColor,
              splash: kPrimaryLightColor,
              press: () {
                buildSignUpModal(context, size);
              },
            )
          ],
        ),
      ),
    );
  }

  Future buildLoginModal(BuildContext context, Size size) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: kPrimaryLightColor,
      barrierColor: kPrimaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      elevation: 0.0,
      builder: (context) => SingleChildScrollView(
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: size.width * 0.1,
                  height: 5,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(29.0),
                  ),
                ),
              ),
              Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: kPrimaryColor,
                ),
              ),
              const Gap(),
              CustomInput(
                label: "Email Address",
                icon: Icons.mail_rounded,
                password: false,
                textColor: kPrimaryColor,
                keyboardType: TextInputType.emailAddress,
                controller: email,
              ),
              CustomInput(
                label: "Password",
                icon: Icons.lock_rounded,
                password: true,
                textColor: kPrimaryColor,
                keyboardType: TextInputType.visiblePassword,
                controller: password,
              ),
              const Gap(),
              RoundedButton(
                text: "Login",
                textColor: kPrimaryLightColor,
                color: kPrimaryColor,
                splash: kPrimaryLightColor,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TripsScreen(),
                    ),
                  );
                },
              ),
              const Gap(),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> buildSignUpModal(BuildContext context, Size size) {
    return showMaterialModalBottomSheet<dynamic>(
      context: context,
      backgroundColor: kPrimaryColor,
      barrierColor: kPrimaryLightColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: size.width * 0.1,
                height: 5,
                decoration: BoxDecoration(
                  color: kPrimaryLightColor,
                  borderRadius: BorderRadius.circular(29.0),
                ),
              ),
            ),
            Text(
              "Sign Up",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: kPrimaryLightColor,
              ),
            ),
            const Gap(),
            CustomInput(
              label: "Email Address",
              icon: Icons.mail_rounded,
              password: false,
              textColor: kPrimaryLightColor,
              keyboardType: TextInputType.emailAddress,
              controller: email,
            ),
            const Gap(),
            RoundedButton(
              text: "Create Account",
              color: kPrimaryLightColor,
              textColor: kPrimaryColor,
              splash: kPrimaryColor,
              press: () {
                buildUserDetailsModal(context, size);
              },
            ),
            const Gap(),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: size.width * 0.35,
                      height: 2,
                      decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.circular(29.0),
                      ),
                    ),
                  ),
                  Text(
                    "OR",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kPrimaryLightColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: size.width * 0.35,
                      height: 2,
                      decoration: BoxDecoration(
                        color: kPrimaryLightColor,
                        borderRadius: BorderRadius.circular(29.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Sign Up With",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kPrimaryLightColor,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIconButton(
                  color: Colors.red[100],
                  icon: FontAwesomeIcons.google,
                  iconColor: Colors.red[400],
                  splash: Colors.red[400],
                  press: () {},
                ),
                Padding(padding: EdgeInsets.all(size.width * 0.02)),
                CustomIconButton(
                  color: Colors.grey[300],
                  icon: FontAwesomeIcons.apple,
                  iconColor: Colors.black45,
                  splash: Colors.black45,
                  press: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIconButton(
                  color: Colors.white,
                  icon: FontAwesomeIcons.facebook,
                  iconColor: Colors.blueAccent,
                  splash: Colors.blueAccent,
                  press: () {},
                ),
                Padding(padding: EdgeInsets.all(size.width * 0.02)),
                CustomIconButton(
                  color: Colors.lightBlueAccent[200],
                  icon: Icons.mark_email_unread_rounded,
                  iconColor: Colors.white,
                  splash: Colors.white,
                  press: () {},
                ),
              ],
            ),
            const Gap(),
          ],
        ),
      ),
    );
  }

  Future<dynamic> buildUserDetailsModal(BuildContext context, Size size) {
    return showMaterialModalBottomSheet<dynamic>(
        animationCurve: Curves.fastLinearToSlowEaseIn,
        duration: const Duration(milliseconds: 500),
        context: context,
        backgroundColor: kPrimaryLightColor,
        barrierColor: kPrimaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: size.width * 0.1,
                      height: 6,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(29.0),
                      ),
                    ),
                  ),
                  Text(
                    "User Details",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 27.5,
                      color: kPrimaryColor,
                    ),
                  ),
                  const Gap(),
                  CustomInput(
                    label: "Name",
                    password: false,
                    icon: Icons.account_circle_rounded,
                    textColor: kPrimaryColor,
                    keyboardType: TextInputType.name,
                    controller: name,
                  ),
                  CustomInput(
                    label: "Contact Number",
                    icon: Icons.phone_rounded,
                    password: false,
                    textColor: kPrimaryColor,
                    keyboardType: TextInputType.number,
                    controller: number,
                  ),
                  CustomInput(
                    label: "Password",
                    icon: Icons.lock_outline_rounded,
                    password: true,
                    textColor: kPrimaryColor,
                    keyboardType: TextInputType.visiblePassword,
                    controller: password,
                  ),
                  CustomInput(
                    label: "Confirm Password",
                    icon: Icons.lock_rounded,
                    password: true,
                    textColor: kPrimaryColor,
                    keyboardType: TextInputType.visiblePassword,
                    controller: confirmPassword,
                  ),
                  const Gap(),
                  RoundedButton(
                    text: "Sign Up",
                    textColor: kPrimaryLightColor,
                    splash: kPrimaryLightColor,
                    color: kPrimaryColor,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TripsScreen(),
                        ),
                      );
                    },
                  ),
                  const Gap(),
                ],
              ),
            ),
          );
        });
  }
}
