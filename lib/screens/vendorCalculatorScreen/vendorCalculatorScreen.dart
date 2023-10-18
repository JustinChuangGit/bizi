import 'package:bizi/configuration/constants.dart';
import 'package:bizi/screens/qrScanScreen/qrScanScreen.dart';

import 'package:bizi/widgets/cardListCheckout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class vendorCalculatorScreen extends StatelessWidget {
  vendorCalculatorScreen({super.key, required this.scannedUserId});
  final scannedUserId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorConstants.biziGreen,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Container(
          child: FloatingActionButton(
        backgroundColor: colorConstants.biziGreen,
        onPressed: () {
          Get.to(const qrScanScreen());
        },
        child: const Icon(Icons.qr_code_scanner),
      )),
      body: Column(
        children: [
          cardListCheckout(
            heading: 'Users Rewards',
            scannedUserId: scannedUserId,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Text('Vendor Calculator Screen UserId = ' +
                scannedUserId.toString()),
          ),
        ],
      ),
    );
  }
}