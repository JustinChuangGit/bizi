import 'dart:io';
import 'package:bizi/configuration/constants.dart';
import 'package:bizi/screens/vendorHomeScreen/vendorHomeScreen.dart';
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
import 'package:bizi/utilities/repository/userRepository.dart';

class VendorRepository extends GetxController {
  static VendorRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final _userRepo = Get.put(UserRepository());

  var uuid = const Uuid();

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

  getVendorInfo() async {
    final vendorDocRef = FirebaseFirestore.instance
        .collection('vendors')
        .doc(_auth.currentUser?.uid)
        .withConverter(
            fromFirestore: VendorModel.fromFirestore,
            toFirestore: (VendorModel vendorModel, _) =>
                vendorModel.toFirestore());

    final docSnap = await vendorDocRef.get();
    final data = docSnap.data();
    currentVendor = data!.vendorName!;
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

    Get.to(venderHomeScreen());
  }

  getRewardImage(String rewardId) async {
    try {
      final _storageRef = _storage.ref().child('rewards').child(rewardId);
      return _storageRef.getDownloadURL();
    } catch (error) {
      return null;
    }
  }

  Future<List<String>> getVendorRewardList() async {
    List<String> rewardList = [];
    final querySnapshot = await _db
        .collection('vendors')
        .doc(_auth.currentUser!.uid)
        .collection('currentRewards')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        rewardList.add(doc.id.toString());
      });
    });

    return rewardList;
  }

  Future<List<String>> checkUserStack(String userId) async {
    final userRewardStack = await _userRepo.getRedeemedRewardList(userId);
    final vendorRewardOfferings = await getVendorRewardList();
    List<String> matching = [];

    for (int i = 0; i < userRewardStack.length; i++) {
      if (vendorRewardOfferings.contains(userRewardStack[i])) {
        matching.add(userRewardStack[i]);
      }
    }

    return matching;
  }
}
