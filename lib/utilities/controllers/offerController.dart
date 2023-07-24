import 'package:bizi/utilities/models/offerModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class offerController extends GetxController {
  static offerController get instance => Get.find();

  final offerName = TextEditingController();
  final offerType = TextEditingController();
  final normalPrice = TextEditingController();
  final newPrice = TextEditingController();
  final offerFilePath = TextEditingController();

  void createOffer(OfferModel offer) {}
}
