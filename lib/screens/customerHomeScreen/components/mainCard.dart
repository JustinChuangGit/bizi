import 'package:flutter/material.dart';
import 'package:bizi/configuration/constants.dart';

class mainCard extends StatelessWidget {
  const mainCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      // top: height * 0.35,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: const Column(
          children: [
            SizedBox(height: 50),
            Text('You have  '),
          ],
        ),
      ),
    );
  }
}
