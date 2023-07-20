import 'package:bizi/configuration/constants.dart';
import 'package:bizi/screens/signInScreen/components/loginFormWidget.dart';
import 'package:bizi/screens/signUpScreen/signUpScreen.dart';
import 'package:bizi/screens/vendorSignUpScreen/vendorSignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class signInScreen extends StatelessWidget {
  const signInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: colorConstants.biziDark,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: height * 0.1),
            child: SizedBox(
              height: height * 0.15,
              child: const Center(
                child: Image(
                    image: AssetImage('assets/images/logos/biziMockLogo.png')),
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: const Center(
                  child: Text(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                'Welcome!',
              ))),
          Container(
              padding: const EdgeInsets.only(bottom: 30),
              child: const Center(
                  child: Text(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                'Login With Your Email',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Get.to(
                            const signUpScreen(),
                            transition: Transition.downToUp,
                          );
                        },
                        child: Text(
                          style: TextStyle(
                            color: colorConstants.biziGreen,
                            fontWeight: FontWeight.bold,
                          ),
                          'Sign Up',
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(
                        const vendorSignUpScreen(),
                        transition: Transition.downToUp,
                      );
                    },
                    child: Text(
                      style: TextStyle(
                        color: colorConstants.biziGreen,
                        fontWeight: FontWeight.bold,
                      ),
                      'Sign Up As a Store',
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
