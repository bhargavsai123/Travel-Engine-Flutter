import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String label;
  // ignore: prefer_typing_uninitialized_variables
  final icon;
  final bool password;
  final Color textColor;
  final TextInputType keyboardType;
  final TextEditingController controller;
  const CustomInput({
    Key? key,
    required this.label,
    required this.icon,
    required this.password,
    required this.textColor,
    required this.keyboardType,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.8,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(29.0),
            ),
            child: TextFormField(
              controller: controller,
              autocorrect: false,
              obscureText: password,
              keyboardType: keyboardType,
              style: TextStyle(
                color: textColor,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  icon,
                  color: textColor,
                ),
                labelText: label,
                labelStyle: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  borderSide: BorderSide(
                    width: 2,
                    color: textColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  borderSide: BorderSide(
                    width: 2,
                    color: textColor,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
