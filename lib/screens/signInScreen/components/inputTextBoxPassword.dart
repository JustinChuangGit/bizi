import 'package:bizi/configuration/constants.dart';
import 'package:flutter/material.dart';
import 'package:bizi/screens/signInScreen/components/loginController.dart';
//Might Have to add controllers into this if there are more

class inputTextBoxPassword extends StatefulWidget {
  const inputTextBoxPassword({
    super.key,
    required this.controllerLogin,
    required this.label,
  });

  final signInController controllerLogin;
  final String label;

  @override
  State<inputTextBoxPassword> createState() => _inputTextBoxPasswordState();
}

class _inputTextBoxPasswordState extends State<inputTextBoxPassword> {
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
          labelText: widget.label,
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
