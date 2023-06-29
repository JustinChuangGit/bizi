import 'package:bizi/utilities/authentication/authenticationRepository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class signUpController extends GetxController {
  static signUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  void registerUser(String email, String password) {
    authenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }
}
