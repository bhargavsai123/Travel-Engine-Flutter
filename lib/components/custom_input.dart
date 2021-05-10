import 'package:flutter/material.dart';
import 'package:travel_engine/constants.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final icon;
  final bool password;
  const CustomInput({
    Key key,
    this.label,
    this.icon,
    this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
      child: Container(
        width: size.width * 0.84,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(29.0),
          color: kPrimaryLightColor,
        ),
        child: TextFormField(
          obscureText: password,
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            labelText: label,
            labelStyle: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
            // ignore: deprecated_member_use
            hasFloatingPlaceholder: true,
            disabledBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
