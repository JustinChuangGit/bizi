import 'package:bizi/utilities/authentication/authenticationRepository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bizi/screens/signInScreen/components/loginController.dart';

class loginForm extends StatelessWidget {
  const loginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(signInController());
    final _formKeyLogin = GlobalKey<FormState>();

    return Form(
      key: _formKeyLogin,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20), //CHANGE THIS
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
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
                    //   signInController.instance.signInUser(
                    //       controller.email.text.trim(),
                    //       controller.password.text.trim());
                    authenticationRepository.instance
                        .loginUserWithEmailAndPassword(
                            'jchuang6@uwo.ca', 'Justin9294');
                  }
                },
                child: const Text("LOGIN"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
