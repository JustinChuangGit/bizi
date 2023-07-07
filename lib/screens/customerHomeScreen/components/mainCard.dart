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
      child: const Column(
        children: [
          SizedBox(height: 50),
          Text('You have  '),
          cardList(heading: 'Test 1'),
          cardList(heading: 'Test 2'),
          cardList(heading: 'Test 3'),
          cardList(heading: 'Test 4'),
          cardList(heading: 'Test 5'),
        ],
      ),
    );
  }
}
