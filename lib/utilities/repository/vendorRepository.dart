import 'package:bizi/utilities/models/vendorModel.dart';
import 'package:bizi/utilities/repository/userRepository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:bizi/utilities/methods/successSnakBar.dart';
import 'package:bizi/utilities/methods/errorSnackBar.dart';

class VendorRepository extends GetxController {
  static VendorRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  createVendor(VendorModel vendor) async {
    await _db
        .collection('vendors')
        .add(vendor.toJson())
        .whenComplete(() => successSnackBar())
        .catchError((error, stackTrace) {
      errorSnackBar();
      print(error.toString());
    });
  }
}
