import 'package:bizi/widgets/cardList.dart';
import 'package:flutter/material.dart';
import 'package:bizi/configuration/constants.dart';

class mainCard extends StatelessWidget {
  const mainCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(cornerRadius),
          topRight: Radius.circular(cornerRadius),
        ),
      ),
      child: const Column(
        children: [
          SizedBox(height: 50),
          Text('You have  '),
          cardList(),
          cardList(),
          cardList(),
          cardList(),
        ],
      ),
    );
  }
}
