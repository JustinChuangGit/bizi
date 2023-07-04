//Double Check this page

import 'package:bizi/utilities/authentication/authenticationRepository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class signInController extends GetxController {
  static signInController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  void signInUser(String email, String password) {
    authenticationRepository.instance
        .loginUserWithEmailAndPassword(email, password);
  }
}
