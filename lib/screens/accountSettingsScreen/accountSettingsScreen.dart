import 'package:bizi/screens/vendorHomeScreen/vendorHomeScreen.dart';
import 'package:bizi/utilities/authentication/authenticationRepository.dart';
import 'package:bizi/widgets/actionButton.dart';
import 'package:flutter/material.dart';
import 'package:bizi/widgets/bottomBar.dart';
import 'package:get/get.dart';

class accountSettingsScreen extends StatelessWidget {
  const accountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBar(),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const actionButton(),
      body: ListView(
        children: [
          ElevatedButton(
              onPressed: () {
                authenticationRepository.instance.logout();
              },
              child: Text('Logout')),
          ElevatedButton(
              onPressed: () {
                Get.to(venderHomeScreen());
              },
              child: Text('Vendor Home Screen'))
        ],
      ),
    );
  }
}
