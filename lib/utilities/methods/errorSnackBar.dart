import 'package:get/get.dart';
import 'package:flutter/material.dart';

void errorSnackBar(
    {String errorMessage = "Something went wrong! Please try again"}) {
  Get.snackbar(
    'Error',
    errorMessage,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.redAccent.withOpacity(0.9),
    colorText: Colors.white,
  );
}
