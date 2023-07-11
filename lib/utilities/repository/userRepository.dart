//This file contains all code for user queries

import 'package:bizi/utilities/methods/errorSnackBar.dart';
import 'package:bizi/utilities/models/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:bizi/utilities/methods/successSnakBar.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  //Point application to firestore database
  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db
        .collection("users")
        .add(user.toJson())
        .whenComplete(() => successSnackBar())
        .catchError((error, stackTrace) {
      errorSnackBar();
      print(error.toString());
    });
  }

  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection('users').where('Email', isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;

    return userData;
  }

  Future<List<UserModel>> allUserDetails(String email) async {
    final snapshot = await _db.collection('users').get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }
}
