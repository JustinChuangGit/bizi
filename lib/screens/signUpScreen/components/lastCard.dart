import 'package:bizi/configuration/constants.dart';

import 'package:bizi/screens/signUpScreen/components/inputTextBoxPasswordSignUp.dart';
import 'package:bizi/screens/signUpScreen/components/signUpController.dart';
import 'package:bizi/utilities/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:bizi/screens/signUpScreen/components/inputTextBoxSignUp.dart';
import 'package:bizi/screens/signUpScreen/components/inputTextBoxSignUp.dart';

class lastCard extends StatelessWidget {
  lastCard(
      {super.key,
      required this.controller,
      required this.cardFontSize,
      required this.cardWidth,
      required this.cardPadding});

  final _formKey = GlobalKey<FormState>();

  final signUpController controller;
  final cardFontSize;
  final cardWidth;
  final cardPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: cardPadding),
      child: SizedBox(
        height: height * 0.3,
        width: cardWidth,
        child: Card(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 5),
                        width: double.infinity,
                        child: Text(
                          'Email:',
                          style: TextStyle(
                              fontSize: cardFontSize,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      inputTextBox(
                          controllerSignUp: controller.email, label: 'Email'),
                      Container(
                        padding: const EdgeInsets.only(bottom: 5),
                        width: double.infinity,
                        child: Text(
                          'Phone Number:',
                          style: TextStyle(
                              fontSize: cardFontSize,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      inputTextBox(
                          controllerSignUp: controller.phoneNo,
                          label: 'Phone Number'),
                      Container(
                        padding: const EdgeInsets.only(bottom: 5),
                        width: double.infinity,
                        child: Text(
                          'Password:',
                          style: TextStyle(
                              fontSize: cardFontSize,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      inputTextBoxPasswordSignUp(
                          controllerLogin: controller, label: 'Password')
                    ],
                  ),
                )),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final user = UserModel(
                    email: controller.email.text.trim(),
                    password: controller.password.text.trim(),
                    firstName: controller.firstName.text.trim(),
                    lastName: controller.lastName.text.trim(),
                    phoneNo: controller.phoneNo.text.trim(),
                    gender: controller.gender.text.trim(),
                    age: controller.age.text.trim(),
                  );
                  signUpController.instance.registerUser(
                    controller.email.text.trim(),
                    controller.password.text.trim(),
                    user,
                  );
                }
              },
              child: Text('Sign up'),
            ),
          ],
        )),
      ),
    );
  }
}
