import 'package:bizi/configuration/constants.dart';

import 'package:bizi/widgets/inputTextBoxPasswordSignUp.dart';
import 'package:bizi/utilities/controllers/signUpController.dart';
import 'package:bizi/utilities/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:bizi/widgets/inputTextBoxSignUp.dart';

class lastCardVendor extends StatelessWidget {
  lastCardVendor({
    super.key,
    required this.controller,
    required this.cardFontSize,
    required this.cardWidth,
    required this.cardPadding,
    required this.controllerScroll,
  });

  final _formKey = GlobalKey<FormState>();

  final signUpController controller;
  final cardFontSize;
  final cardWidth;
  final cardPadding;
  final ScrollController controllerScroll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: cardPadding),
      child: SizedBox(
        height: height * 0.3,
        width: cardWidth,
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(cornerRadius)),
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
                              controllerSignUp: controller.email,
                              label: 'Email'),
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
                Padding(
                  padding: EdgeInsets.all(cardPadding),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: width * 0.02),
                        child: SizedBox(
                          width: width * 0.1,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: colorConstants.biziGreen,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                              onPressed: () {
                                controllerScroll.animateTo(
                                  controllerScroll.position.minScrollExtent,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.fastOutSlowIn,
                                );
                              },
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: height * 0.015),
                                  child: Icon(Icons.arrow_back_ios))),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.65,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: colorConstants.biziGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final user = UserModel(
                                email: controller.email.text.trim(),
                                password: controller.password.text.trim(),
                                firstName: controller.firstName.text.trim(),
                                lastName: controller.lastName.text.trim(),
                                phoneNo: controller.phoneNo.text.trim(),
                                gender: gender,
                                age: dateOfBirth,
                                points: 0,
                              );
                              signUpController.instance.registerUser(
                                controller.email.text.trim(),
                                controller.password.text.trim(),
                                user,
                              );
                            }
                          },
                          child: Container(
                              padding:
                                  EdgeInsets.symmetric(vertical: height * 0.02),
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
