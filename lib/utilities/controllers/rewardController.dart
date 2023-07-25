import 'dart:io';

import 'package:bizi/utilities/models/rewardModel.dart';
import 'package:bizi/utilities/repository/vendorRepository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RewardController extends GetxController {
  static RewardController get instance => Get.find();
  final vendorRepo = Get.put(VendorRepository());

  final rewardName = TextEditingController();
  final rewardType = TextEditingController();
  final normalPrice = TextEditingController();
  final newPrice = TextEditingController();
  final offerFilePath = TextEditingController();

  void createReward(RewardModel reward, File file) async {
    await vendorRepo.postReward(reward, file);
  }
}
