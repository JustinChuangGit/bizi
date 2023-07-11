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
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 235, 235, 235),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(cornerRadius),
          topRight: Radius.circular(cornerRadius),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: height * 0.05),
          const cardList(heading: 'Featured Offerings'),
          const cardList(heading: 'Based On Your Location'),
          const cardList(heading: 'Coffee'),
          const cardList(heading: 'ABC Pizza'),
          const cardList(heading: 'Try Something New'),
          const cardList(heading: 'Try Something New'),
          const cardList(heading: 'Try Something New'),
          const cardList(heading: 'Try Something New'),
          const cardList(heading: 'Try Something New'),
          const cardList(heading: 'Try Something New'),
          const cardList(heading: 'Try Something New'),
        ],
      ),
    );
  }
}
