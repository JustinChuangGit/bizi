import 'package:bizi/screens/signUpScreen/components/signUpController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';

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
              TextFormField(
                  controller: controller.fullName,
                  decoration: const InputDecoration(
                    label: Text('tFullName'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  }),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: controller.email,
                decoration: const InputDecoration(
                  label: Text('Email'),
                ),
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
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                  controller: controller.phoneNo,
                  decoration: const InputDecoration(
                    label: Text('Phone'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  }),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                  controller: controller.password,
                  decoration: const InputDecoration(
                    label: Text('Password'),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  }),
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
              )
            ],
          )),
    );
  }
}
