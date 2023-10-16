import 'package:bizi/utilities/repository/vendorRepository.dart';
import 'package:bizi/widgets/actionButton.dart';
import 'package:bizi/widgets/bottomBar.dart';
import 'package:bizi/widgets/cardListCheckout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class vendorCalculatorScreen extends StatelessWidget {
  vendorCalculatorScreen({super.key, required this.scannedUserId});
  final scannedUserId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBar(),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const actionButton(),
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
