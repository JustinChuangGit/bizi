import 'dart:io';

import 'package:bizi/utilities/models/offerModel.dart';
import 'package:bizi/utilities/models/rewardModel.dart';
import 'package:bizi/utilities/models/vendorModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:bizi/utilities/methods/successSnakBar.dart';
import 'package:bizi/utilities/methods/errorSnackBar.dart';
import 'package:uuid/uuid.dart';

class VendorRepository extends GetxController {
  static VendorRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

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

  postReward(RewardModel reward, File file) async {
    // final String rewardId = _auth.currentUser!.uid + uuid.v4();

    // reward.id = rewardId;

    await _db
        .collection('vendors')
        .doc(_auth.currentUser?.uid)
        .collection('currentRewards')
        .doc(reward.id)
        .set(reward.toJson())
        .whenComplete(() => successSnackBar())
        .catchError((error, stackTrace) {
      errorSnackBar();
    });

    //Storage
    final storageRef = _storage.ref().child('rewards').child(reward.id);
    await storageRef.putFile(file).catchError((error, stackTrace) {
      errorSnackBar();
    });
  }

  getRewardImage(String rewardId) async {
    try {
      final _storageRef = _storage.ref().child('rewards').child(rewardId);
      return _storageRef.getDownloadURL();
    } catch (error) {
      return null;
    }
  }
}
