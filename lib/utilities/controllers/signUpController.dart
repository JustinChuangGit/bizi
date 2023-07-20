import 'package:bizi/utilities/authentication/authenticationRepository.dart';
import 'package:bizi/utilities/models/userModel.dart';
import 'package:bizi/utilities/repository/userRepository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class signUpController extends GetxController {
  static signUpController get instance => Get.find();
  final userRepo = Get.put(UserRepository());

  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNo = TextEditingController();
  final gender = TextEditingController();
  final age = TextEditingController();

  void registerUser(String email, String password, UserModel user) {
    authenticationRepository.instance.createUserWithEmailAndPassword(
      email,
      password,
      user,
    );
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
  }
}