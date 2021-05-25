import 'package:bruh_123/components/custom_input.dart';
import 'package:bruh_123/components/gap.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ProfileScreen extends StatelessWidget {
  var email = TextEditingController();

  var name = TextEditingController();

  var number = TextEditingController();

  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: kPrimaryLightColor,
        appBar: AppBar(
          toolbarHeight: 121,
          automaticallyImplyLeading: false,
          centerTitle: false,
          leadingWidth: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          primary: true,
          title: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
            ),
            child: Text(
              "Profile",
              style: TextStyle(
                color: kPrimaryDarkColor,
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Hero(
                  tag: "User",
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: kAccentColor,
                    backgroundImage: const NetworkImage(
                        "https://cdn.dribbble.com/users/29574/screenshots/4826855/avatar_-_og_-_dribbble.png?compress=1&resize=400x300"),
                  ),
                  transitionOnUserGestures: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Gap(),
                    CustomInput(
                      label: "Email",
                      icon: Icons.mail_rounded,
                      password: false,
                      textColor: kPrimaryDarkColor,
                      keyboardType: TextInputType.emailAddress,
                      controller: email,
                    ),
                    CustomInput(
                      label: "Password",
                      icon: Icons.lock_outline_rounded,
                      password: true,
                      textColor: kPrimaryDarkColor,
                      keyboardType: TextInputType.visiblePassword,
                      controller: password,
                    ),
                    CustomInput(
                      label: "Name",
                      password: false,
                      icon: Icons.account_circle_rounded,
                      textColor: kPrimaryDarkColor,
                      keyboardType: TextInputType.name,
                      controller: name,
                    ),
                    CustomInput(
                      label: "Contact Number",
                      icon: Icons.phone_rounded,
                      password: false,
                      textColor: kPrimaryDarkColor,
                      keyboardType: TextInputType.number,
                      controller: number,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.mode_edit_rounded,
            color: Colors.white,
          ),
          elevation: 0.0,
          focusElevation: 1.0,
          hoverElevation: 1.0,
          highlightElevation: 1.0,
          splashColor: Colors.white,
          backgroundColor: kAccentColor,
          onPressed: () {},
        ),
      ),
    );
  }
}
