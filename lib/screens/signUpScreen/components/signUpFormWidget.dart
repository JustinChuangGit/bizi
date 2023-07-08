import 'package:bizi/screens/signInScreen/signInScreen.dart';
import 'package:bizi/screens/signUpScreen/components/signUpController.dart';
import 'package:bizi/utilities/models/userModel.dart';
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
              inputTextBox(
                  controllerSignUp: controller.firstName, label: 'First Name'),
              inputTextBox(
                  controllerSignUp: controller.lastName, label: 'Last Name'),
              inputTextBox(controllerSignUp: controller.email, label: 'Email'),
              inputTextBox(
                  controllerSignUp: controller.password, label: 'Password'),
              inputTextBox(
                  controllerSignUp: controller.gender, label: 'Gender'),
              inputTextBox(controllerSignUp: controller.age, label: 'Age'),
              inputTextBox(
                  controllerSignUp: controller.phoneNo, label: 'Phone Number'),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final user = UserModel(
                          email: controller.email.text.trim(),
                          password: controller.password.text.trim(),
                          firstName: controller.firstName.text.trim(),
                          lastName: controller.lastName.text.trim(),
                          phoneNo: controller.phoneNo.text.trim(),
                          gender: controller.gender.text.trim(),
                          age: int.parse(controller.age.text.trim()),
                        );
                        signUpController.instance.registerUser(
                          controller.email.text.trim(),
                          controller.password.text.trim(),
                          user,
                        );
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
