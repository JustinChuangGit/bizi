import 'package:bizi/utilities/authentication/authenticationRepository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bizi/screens/signInScreen/components/loginController.dart';

class loginForm extends StatelessWidget {
  const loginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controllerLogin = Get.put(signInController());
    final _formKeyLogin = GlobalKey<FormState>();

    return Form(
      key: _formKeyLogin,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20), //CHANGE THIS
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controllerLogin.email,
              decoration: const InputDecoration(
                labelText: 'email',
                hintText: 'email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: controllerLogin.password,
              decoration: const InputDecoration(
                labelText: 'password',
                hintText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {}, child: const Text('Forgot Password?')),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKeyLogin.currentState!.validate()) {
                    signInController.instance.signInUser(
                        controllerLogin.email.text.trim(),
                        controllerLogin.password.text.trim());
                    print(controllerLogin.email.text.trim());
                    print(controllerLogin.password.text.trim());
                  }
                },
                child: const Text("LOGIN"),
              ),
            ),
            // Text(getInfo()),
          ],
        ),
      ),
    );
  }
}
