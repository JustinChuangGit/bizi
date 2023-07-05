import 'package:bizi/configuration/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bizi/screens/signInScreen/components/loginController.dart';
import 'package:bizi/widgets/inputTextBox.dart';

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
            inputTextBox(controllerLogin: controllerLogin, label: 'Email'),
            const SizedBox(height: 30),
            inputTextBox(controllerLogin: controllerLogin, label: 'Password'),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: colorConstants.biziDark,
                    ),
                  )),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: colorConstants.biziGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(cornerRadius),
                    )),
                onPressed: () {
                  if (_formKeyLogin.currentState!.validate()) {
                    signInController.instance.signInUser(
                        controllerLogin.email.text.trim(),
                        controllerLogin.password.text.trim());
                    print(controllerLogin.email.text.trim());
                    print(controllerLogin.password.text.trim());
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
