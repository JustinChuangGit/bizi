import 'package:bizi/widgets/actionButton.dart';
import 'package:bizi/widgets/bottomBar.dart';
import 'package:flutter/material.dart';

class storesScreen extends StatelessWidget {
  const storesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBar(),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const actionButton(),
      body: const Text('Stores'),
    );
  }
}
