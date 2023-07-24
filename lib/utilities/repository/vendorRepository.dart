import 'package:bizi/utilities/models/offerModel.dart';
import 'package:bizi/utilities/models/vendorModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:bizi/utilities/methods/successSnakBar.dart';
import 'package:bizi/utilities/methods/errorSnackBar.dart';
import 'package:uuid/uuid.dart';

class VendorRepository extends GetxController {
  static VendorRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var uuid = Uuid();

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

  postOffer(OfferModel offer) async {
    await _db
        .collection('vendors')
        .doc(_auth.currentUser?.uid)
        .collection('currentOffers')
        .doc(_auth.currentUser!.uid + uuid.v4())
        .set(offer.toJson())
        .whenComplete(() => successSnackBar())
        .catchError((error, stackTrace) {
      errorSnackBar();
    });
  }

  postReward(OfferModel offer) async {
    await _db
        .collection('vendors')
        .doc(_auth.currentUser?.uid)
        .collection('currentRewards')
        .doc(_auth.currentUser!.uid + uuid.v4())
        .set(offer.toJson())
        .whenComplete(() => successSnackBar())
        .catchError((error, stackTrace) {
      errorSnackBar();
    });
  }
}
