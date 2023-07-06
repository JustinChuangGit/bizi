import 'package:bizi/screens/signInScreen/signInScreen.dart';
import 'package:bizi/screens/signUpScreen/components/signUpController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bizi/screens/signUpScreen/components/inputTextBoxSignUp.dart';

class signUpFormWidget extends StatelessWidget {
  const signUpFormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(signUpController());
    final _formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              inputTextBox(controllerSignUp: controller, label: 'Full Name'),
              inputTextBox(controllerSignUp: controller, label: 'Email'),
              inputTextBox(controllerSignUp: controller, label: 'Password'),
              inputTextBox(controllerSignUp: controller, label: 'Gender'),
              inputTextBox(controllerSignUp: controller, label: 'Age'),
              inputTextBox(controllerSignUp: controller, label: 'Phone Number'),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        signUpController.instance.registerUser(
                            controller.email.text.trim(),
                            controller.password.text.trim());
                      }
                    },
                    child: Text('Sign Up')),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(const signInScreen());
                    },
                    child: const Text('Sign In')),
              )
            ],
          )),
    );
  }
}
