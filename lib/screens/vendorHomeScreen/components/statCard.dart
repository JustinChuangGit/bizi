import 'package:bizi/configuration/constants.dart';

import 'package:flutter/material.dart';

class statCard extends StatelessWidget {
  const statCard({
    super.key,
    this.statValue,
    this.statLabel,
    required this.statColor,
  });

  final String? statValue;
  final String? statLabel;
  final Color statColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 3,
        top: 20,
      ),
      child: Card(
        color: statColor.withOpacity(0.35),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: SizedBox(
            height: width * 0.3,
            width: width * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  statValue.toString(),
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                Text(
                  statLabel.toString(),
                  textAlign: TextAlign.center,
                ),
              ],
            )),
      ),
    );
  }
}
