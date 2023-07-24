import 'package:bizi/configuration/constants.dart';
import 'package:bizi/screens/vendorSignUpScreen/components/firstCardVendor.dart';
import 'package:bizi/screens/vendorSignUpScreen/components/lastCardVendor..dart';
import 'package:bizi/screens/vendorSignUpScreen/components/middleCardVendor.dart';
import 'package:bizi/utilities/controllers/signUpController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class signUpVendorFormWidget extends StatefulWidget {
  const signUpVendorFormWidget({Key? key}) : super(key: key);

  @override
  State<signUpVendorFormWidget> createState() => _signUpVendorFormWidgetState();
}

class _signUpVendorFormWidgetState extends State<signUpVendorFormWidget> {
  @override
  Widget build(BuildContext context) {
    const double cardPadding = 20;
    double cardWidth = width * 0.9;
    const double cardFontSize = 16;

    final controller = Get.put(signUpController());
    ScrollController _scrollController = ScrollController();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),

      child: SizedBox(
        height: height * 0.661,
        child: ListView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          //physics: const NeverScrollableScrollPhysics(),
          children: [
            firstCardVendor(
              controller: controller,
              cardFontSize: cardFontSize,
              cardWidth: cardWidth,
              cardPadding: cardPadding,
              controllerScroll: _scrollController,
            ),
            middleCardVendor(
                controller: controller,
                cardFontSize: cardFontSize,
                cardWidth: cardWidth,
                cardPadding: cardPadding,
                controllerScroll: _scrollController),
            lastCardVendor(
              controller: controller,
              cardFontSize: cardFontSize,
              cardWidth: cardWidth,
              cardPadding: cardPadding,
              controllerScroll: _scrollController,
            ),
          ],
        ),
      ),
      // child: Form(
      //     key: _formKey,
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         inputTextBox(controllerSignUp: controller.email, label: 'Email'),
      //         inputTextBox(
      //             controllerSignUp: controller.password, label: 'Password'),
      //         inputTextBox(
      //             controllerSignUp: controller.firstName, label: 'First Name'),
      //         inputTextBox(
      //             controllerSignUp: controller.lastName, label: 'Last Name'),
      //         inputTextBox(
      //             controllerSignUp: controller.phoneNo, label: 'Phone Number'),
      //         inputTextBox(
      //             controllerSignUp: controller.gender, label: 'Gender'),
      //         inputTextBox(controllerSignUp: controller.age, label: 'Age'),
      //         const SizedBox(
      //           height: 10,
      //         ),
      //         SizedBox(
      //           width: double.infinity,
      //           child: ElevatedButton(
      //               onPressed: () {
      //                 if (_formKey.currentState!.validate()) {
      //                   final user = UserModel(
      //                     email: controller.email.text.trim(),
      //                     password: controller.password.text.trim(),
      //                     firstName: controller.firstName.text.trim(),
      //                     lastName: controller.lastName.text.trim(),
      //                     phoneNo: controller.phoneNo.text.trim(),
      //                     gender: controller.gender.text.trim(),
      //                     age: int.parse(controller.age.text.trim()),
      //                   );
      //                   signUpController.instance.registerUser(
      //                     controller.email.text.trim(),
      //                     controller.password.text.trim(),
      //                     user,
      //                   );
      //                 }
      //               },
      //               child: Text('Sign Up')),
      //         ),
      //         SizedBox(
      //           width: double.infinity,
      //           child: ElevatedButton(
      //               onPressed: () {
      //                 Get.to(const signInScreen());
      //               },
      //               child: const Text('Sign In')),
      //         )
      //       ],
      //     )),
    );
  }
}
