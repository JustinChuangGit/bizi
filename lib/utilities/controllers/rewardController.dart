import 'package:bizi/utilities/models/offerModel.dart';
import 'package:bizi/utilities/repository/vendorRepository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RewardController extends GetxController {
  static RewardController get instance => Get.find();

  final offerName = TextEditingController();
  final offerType = TextEditingController();
  final normalPrice = TextEditingController();
  final newPrice = TextEditingController();
  final offerFilePath = TextEditingController();

  void createOffer(OfferModel offer) {
    VendorRepository.instance.postReward(offer);
  }
}
