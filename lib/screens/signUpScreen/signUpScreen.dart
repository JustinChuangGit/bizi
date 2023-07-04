import 'package:bizi/screens/signUpScreen/components/signUpFormWidget.dart';
import 'package:flutter/material.dart';

class signUpScreen extends StatelessWidget {
  const signUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: const Column(
            children: [
              // FormHeaderWidget(
              //   image: ,
              //   title: ,
              //   subtitle: ,
              //   imageHeight: ,
              // ),
              signUpFormWidget(),
              //signUpFooterWidget(),
            ],
          ),
        ),
      ),
    ));
  }
}
