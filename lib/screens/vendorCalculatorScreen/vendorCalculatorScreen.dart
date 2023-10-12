import 'package:bizi/widgets/actionButton.dart';
import 'package:bizi/widgets/bottomBar.dart';
import 'package:flutter/material.dart';

class vendorCalculatorScreen extends StatelessWidget {
  const vendorCalculatorScreen({super.key, required this.scannedUserId});
  final scannedUserId;

  @override
  Widget build(BuildContext context) {
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
