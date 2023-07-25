import 'package:bizi/utilities/models/offerModel.dart';
import 'package:bizi/utilities/repository/vendorRepository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferController extends GetxController {
  static OfferController get instance => Get.find();
  final vendorRepo = Get.put(VendorRepository());

  final offerName = TextEditingController();
  final offerType = TextEditingController();
  final normalPrice = TextEditingController();
  final newPrice = TextEditingController();
  final offerFilePath = TextEditingController();

  void createOffer(OfferModel offer) async {
    await vendorRepo.postOffer(offer);
  }
}
