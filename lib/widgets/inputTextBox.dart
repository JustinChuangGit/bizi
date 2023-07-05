import 'package:bizi/configuration/constants.dart';
import 'package:flutter/material.dart';
import 'package:bizi/screens/signInScreen/components/loginController.dart';
import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';
//Might Have to add controllers into this if there are more

class inputTextBox extends StatelessWidget {
  const inputTextBox({
    super.key,
    required this.controllerLogin,
    required this.label,
  });

  final signInController controllerLogin;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: colorConstants.biziDark,
      controller: controllerLogin.email,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        } else if (value != null) {
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
          labelText: label,
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
    );
  }
}
