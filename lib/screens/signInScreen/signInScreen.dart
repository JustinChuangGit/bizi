import 'package:bizi/screens/signInScreen/components/loginFormWidget.dart';
import 'package:bizi/screens/signUpScreen/signUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class signInScreen extends StatelessWidget {
  const signInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text('Login Page'),
              const loginForm(),
              const Text('OR'),
              ElevatedButton(
                onPressed: () {
                  Get.to(
                    const signUpScreen(),
                  );
                },
                child: const Text('Sign Up'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
