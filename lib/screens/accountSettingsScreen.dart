import 'package:bizi/utilities/authentication/authenticationRepository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class accountSettingsScreen extends StatelessWidget {
  const accountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ElevatedButton(
              onPressed: () {
                authenticationRepository.instance.logout();
              },
              child: Text('Logout'))
        ],
      ),
    );
  }
}
