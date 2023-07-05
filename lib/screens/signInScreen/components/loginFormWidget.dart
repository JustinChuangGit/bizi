import 'package:bizi/configuration/constants.dart';
import 'package:bizi/screens/signInScreen/components/inputTextBoxPassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bizi/screens/signInScreen/components/loginController.dart';
import 'package:bizi/screens/signInScreen/components/inputTextBox.dart';

class loginForm extends StatelessWidget {
  const loginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controllerLogin = Get.put(signInController());
    final _formKeyLogin = GlobalKey<FormState>();

    return Form(
      key: _formKeyLogin,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: height * 0.03), //CHANGE THIS
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: height * 0.1,
                child: inputTextBox(
                    controllerLogin: controllerLogin, label: 'Email')),
            SizedBox(height: height * 0.01),
            SizedBox(
              height: height * 0.1,
              child: inputTextBoxPassword(
                  controllerLogin: controllerLogin, label: 'Password'),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: colorConstants.biziDark.withOpacity(0.8),
                    ),
                  )),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: colorConstants.biziGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
                onPressed: () {
                  if (_formKeyLogin.currentState!.validate()) {
                    signInController.instance.signInUser(
                        controllerLogin.email.text.trim(),
                        controllerLogin.password.text.trim());
                  }
                },
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: height * 0.02),
                    child: const Text("LOGIN")),
              ),
            ),
            // Text(getInfo()),
          ],
        ),
      ),
    );
  }
}
