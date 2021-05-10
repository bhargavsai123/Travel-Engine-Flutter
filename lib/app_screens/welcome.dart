import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_engine/components/buttons/icon_button.dart';
import 'package:travel_engine/constants.dart';
import 'package:travel_engine/components/buttons/rounded_button.dart';
import 'package:travel_engine/components/custom_input.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _pageState = 0;

  var _bg = Colors.white;
  var _tc = kPrimaryColor;

  double _loginYOffset = 0;
  double _signupYOffset = 0;
  bool _keyboardVisible = false;

  @override
  void initState() {
    super.initState();
    // Checking for Keyboard Visibility
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        setState(() {
          _keyboardVisible = visible;
          print("$visible");
        });
      },
    );
  }

  // Function used to Hide the Keyboard
  void _hideKeyboard() {
    final focus = FocusScope.of(context);
    if (!focus.hasPrimaryFocus) focus.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // Switch case used to make changes to the Welcome Screen based on its State
    switch (_pageState) {
      case 0:
        _bg = Colors.white;
        _tc = kPrimaryColor;
        _loginYOffset = size.height;
        _signupYOffset = size.height;
        _hideKeyboard();
        break;
      case 1:
        _bg = kPrimaryColor;
        _tc = Colors.white70;
        // Changing the height of the Modal based on Keyboard Visibility
        _loginYOffset =
            _keyboardVisible ? size.height * 0.17 : size.height * 0.57;
        break;
      case 2:
        _bg = kPrimaryColor;
        _tc = Colors.white70;
        // Changing the height of the Modal based on Keyboard Visibility
        _signupYOffset =
            _keyboardVisible ? size.height * 0.17 : size.height * 0.27;
        break;
    }

    return GestureDetector(
      // Hide Keyboard on Tapping away from a TextField
      onTap: () {
        setState(() {
          _pageState = 0;
        });
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            AnimatedContainer(
              // Animation & Duration
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 1000),
              color: _bg,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Title
                    Text(
                      "Travel Engine",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          color: _tc),
                    ),
                    // Image
                    Padding(
                      padding: EdgeInsets.only(top: 40.0, bottom: 40.0),
                      child: Image.asset(
                        "images/welcome.png",
                      ),
                    ),
                    // Login Button
                    Padding(
                      padding: EdgeInsets.only(top: 30.0, bottom: 15.0),
                      child: RoundedButton(
                        text: "Login",
                        press: () {
                          // Changing the State of the Welcome Screen
                          setState(() {
                            if (_pageState != 0) {
                              _pageState = 0;
                            } else {
                              _pageState = 1;
                            }
                          });
                        },
                        color: kPrimaryColor,
                        textColor: kPrimaryLightColor,
                        splash: kPrimaryLightColor,
                      ),
                    ),
                    // Sign Up Button
                    RoundedButton(
                      text: "Sign Up",
                      press: () {
                        setState(() {
                          if (_pageState != 0) {
                            _pageState = 0;
                          } else {
                            _pageState = 2;
                          }
                        });
                      },
                      color: kPrimaryLightColor,
                      textColor: kPrimaryColor,
                      splash: kAccentColor,
                    )
                  ],
                ),
              ),
            ),
            // Login Modal
            loginPage(size),
            // Sign Up Modal
            signupPage(size),
          ],
        ),
      ),
    );
  }

  loginPage(Size size) {
    return GestureDetector(
      // Changing the height of the Modal on Vertical Drag Update
      onVerticalDragUpdate: (DragUpdateDetails dd) {
        _loginYOffset = dd.localPosition.dy;
        if (_loginYOffset < size.height * 0.57) {
          _loginYOffset = size.height * 0.57;
        } else if (_loginYOffset > size.height * 0.8) {
          setState(() {
            _pageState = 0;
          });
        }
        print(_loginYOffset);
      },
      onTap: () {
        _hideKeyboard();
      },
      child: AnimatedContainer(
        // Animation & Duration
        curve: Curves.fastLinearToSlowEaseIn,
        duration: Duration(
          milliseconds: 1000,
        ),
        transform: Matrix4.translationValues(0, _loginYOffset, 10),
        decoration: BoxDecoration(
          color: kAccentColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(29.0),
            topRight: Radius.circular(29.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
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
              "Login",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: kPrimaryLightColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: CustomInput(
                label: "Email Address",
                icon: Icons.email_rounded,
                password: false,
              ),
            ),
            CustomInput(
              label: "Password",
              icon: Icons.lock,
              password: true,
            ),
            Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: RoundedButton(
                text: "Login",
                textColor: kPrimaryLightColor,
                color: kPrimaryColor,
                splash: kPrimaryLightColor,
                press: () {},
              ),
            )
          ],
        ),
      ),
    );
  }

  signupPage(Size size) {
    return GestureDetector(
      // Changing the height of the Modal on Vertical Drag Update

      onVerticalDragUpdate: (DragUpdateDetails dd) {
        _signupYOffset = dd.localPosition.dy;
        if (_signupYOffset < size.height * 0.27) {
          _signupYOffset = size.height * 0.27;
        } else if (dd.localPosition.dy > size.height * 0.8) {
          setState(() {
            _pageState = 0;
          });
        }
        print(_signupYOffset);
      },

      onTap: () {
        _hideKeyboard();
      },

      child: AnimatedContainer(
        // Animation & Duration
        curve: Curves.fastLinearToSlowEaseIn,
        duration: Duration(
          milliseconds: 1000,
        ),
        transform: Matrix4.translationValues(0, _signupYOffset, 10),
        decoration: BoxDecoration(
          color: kAccentColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(29.0),
            topRight: Radius.circular(29.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
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
              "Sign Up",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: kPrimaryLightColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: CustomInput(
                label: "Email Address",
                icon: Icons.email_rounded,
                password: false,
              ),
            ),
            CustomInput(
              label: "Password",
              icon: Icons.lock,
              password: true,
            ),
            Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: RoundedButton(
                text: "Sign up",
                textColor: kPrimaryLightColor,
                color: kPrimaryColor,
                splash: kPrimaryLightColor,
                press: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Container(
                      width: size.width * 0.35,
                      height: 2,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(29.0),
                      ),
                    ),
                  ),
                  Text("OR"),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Container(
                      width: size.width * 0.35,
                      height: 2,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(29.0),
                      ),
                    ),
                  ),
                ],
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
                  color: Colors.grey[100],
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
                  color: Colors.blueAccent[100],
                  icon: FontAwesomeIcons.facebook,
                  iconColor: Colors.blueAccent,
                  splash: Colors.blueAccent,
                  press: () {},
                ),
                Padding(padding: EdgeInsets.all(size.width * 0.02)),
                CustomIconButton(
                  color: Colors.lightBlueAccent[200],
                  icon: Icons.mail,
                  iconColor: Colors.white,
                  splash: Colors.white,
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
