import 'package:bizi/screens/signUpScreen/components/signUpFormWidget.dart';
import 'package:flutter/material.dart';
import 'package:bizi/configuration/constants.dart';

class signUpScreen extends StatelessWidget {
  const signUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorConstants.biziDark,
      body: Column(children: [
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

        SizedBox(
          height: height * 0.04,
          child: Padding(
            padding: EdgeInsets.only(top: height * 0.01),
            child: const Text(
              'Please enter your information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        signUpFormWidget()
        // Expanded(
        //   child: Container(
        //     decoration: BoxDecoration(
        //       borderRadius: const BorderRadius.only(
        //           topLeft: Radius.circular(cornerRadius),
        //           topRight: Radius.circular(cornerRadius)),
        //       color: Colors.white.withOpacity(0.8),
        //     ),
        //     child: AnimatedOpacity(
        //       opacity: 1,
        //       duration: const Duration(milliseconds: 100),
        //       child: Container(
        //         padding: EdgeInsets.all(20),
        //         child: signUpFormWidget(),
        //       ),
        //     ),

        //     // FormHeaderWidget(
        //     //   image: ,
        //     //   title: ,
        //     //   subtitle: ,
        //     //   imageHeight: ,
        //     // ),
        //     //signUpFormWidget(),
        //     //signUpFooterWidget(),
        //   ),
        // ),
      ]),
    );
  }
}
