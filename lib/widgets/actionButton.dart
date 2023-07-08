import 'package:bizi/configuration/constants.dart';
import 'package:bizi/screens/customerHomeScreen/customerHomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class actionButton extends StatelessWidget {
  const actionButton({
    Key? key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      child: FloatingActionButton(
        backgroundColor: colorConstants.biziGreen,
        onPressed: () {
          //Temp
          Get.to(customerHomeScreen());
        },
        child: const Icon(Icons.qr_code_scanner),
      ),
    );
  }
}
