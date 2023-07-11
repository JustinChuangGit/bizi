import 'package:bizi/configuration/constants.dart';
import 'package:bizi/screens/signUpScreen/components/signUpController.dart';
import 'package:flutter/material.dart';
//Might Have to add controllers into this if there are more

class inputTextBoxPasswordSignUp extends StatefulWidget {
  const inputTextBoxPasswordSignUp({
    super.key,
    required this.controllerLogin,
    required this.label,
  });

  final signUpController controllerLogin;
  final String label;

  @override
  State<inputTextBoxPasswordSignUp> createState() =>
      _inputTextBoxPasswordState();
}

class _inputTextBoxPasswordState extends State<inputTextBoxPasswordSignUp> {
  bool _obscureText = false;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: colorConstants.biziDark,
      controller: widget.controllerLogin.password,
      obscureText: !_obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
          //labelText: widget.label,
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
