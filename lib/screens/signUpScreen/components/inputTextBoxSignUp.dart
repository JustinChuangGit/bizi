import 'package:bizi/configuration/constants.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class inputTextBox extends StatelessWidget {
  const inputTextBox({
    super.key,
    required this.controllerSignUp,
    required this.label,
  });

  final TextEditingController controllerSignUp;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.1,
      child: TextFormField(
        cursorColor: colorConstants.biziDark,
        controller: controllerSignUp,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          } else if (label == 'Email') {
            final bool isValid = EmailValidator.validate(value);
            if (isValid == true) {
              return null;
            } else {
              return 'Please enter a valid email';
            }
          }
          return null;
        },
        decoration: InputDecoration(
            //labelText: label,
            floatingLabelStyle: TextStyle(
              color: colorConstants.biziDark,
            ),
            border: OutlineInputBorder(
                borderSide: BorderSide(
              color: colorConstants.biziDark,
            )),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: colorConstants.biziDark,
            ))),
      ),
    );
  }
}
