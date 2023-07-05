import 'package:bizi/configuration/constants.dart';
import 'package:bizi/screens/signInScreen/components/loginFormWidget.dart';
import 'package:bizi/screens/signUpScreen/signUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:bizi/configuration/constants.dart';

class signInScreen extends StatelessWidget {
  const signInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: biziDark,
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.15,
                child: const Center(
                  child: Image(
                      image:
                          AssetImage('assets/images/logos/biziMockLogo.png')),
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: const Center(
                      child: Text(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    'Welcome!',
                  ))),
              Container(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: const Center(
                      child: Text(
                    style: TextStyle(color: Colors.white),
                    'Login With Your Email!',
                  ))),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(cornerRadius),
                        topRight: Radius.circular(cornerRadius)),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(
                    top: height * 0.02,
                    left: width * 0.05,
                    right: height * 0.05,
                  ),
                  child: Column(
                    children: [
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
