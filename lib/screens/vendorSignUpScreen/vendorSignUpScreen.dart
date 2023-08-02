import 'package:bizi/screens/vendorSignUpScreen/components/signUpVendorFormWidget.dart';
import 'package:flutter/material.dart';
import 'package:bizi/configuration/constants.dart';

class vendorSignUpScreen extends StatelessWidget {
  const vendorSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorConstants.biziDark,
      body: Column(children: [
        Container(
          padding: EdgeInsets.only(top: height * 0.09),
          child: SizedBox(
            height: height * 0.14,
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
        const signUpVendorFormWidget(),
      ]),
    );
  }
}
