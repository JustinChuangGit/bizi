import 'package:bizi/utilities/repository/vendorRepository.dart';
import 'package:bizi/widgets/actionButton.dart';
import 'package:bizi/widgets/bottomBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class vendorCalculatorScreen extends StatelessWidget {
  vendorCalculatorScreen({super.key, required this.scannedUserId});
  final scannedUserId;

  final _vendorRepo = Get.put(VendorRepository());

  @override
  Widget build(BuildContext context) {
    final userRewardStack = _vendorRepo.checkUserStack(scannedUserId);
    _vendorRepo.checkUserStack(scannedUserId);
    return Scaffold(
      bottomNavigationBar: bottomBar(),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const actionButton(),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Text(
            'Vendor Calculator Screen UserId = ' + scannedUserId.toString()),
      ),
    );
  }
}
