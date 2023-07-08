import 'package:get/get.dart';
import 'package:flutter/material.dart';

void successSnackBar({String errorMessage = "Horray! It worked."}) {
  Get.snackbar('Success', errorMessage,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green.withOpacity(0.1),
      colorText: Colors.green);
}
