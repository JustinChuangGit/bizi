import 'package:bizi/configuration/constants.dart';
import 'package:bizi/screens/vendorHomeScreen/components/statCard.dart';
import 'package:flutter/material.dart';

class keyStatScroll extends StatelessWidget {
  const keyStatScroll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width * 0.35,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          statCard(
            statColor: Color.fromARGB(255, 255, 217, 0),
            statValue: '65',
            statLabel: 'Coupons Used',
          ),
          statCard(
            statColor: Color.fromARGB(255, 120, 253, 118),
            statValue: '34',
            statLabel: 'New Customers',
          ),
          statCard(
            statColor: Color.fromARGB(255, 127, 118, 253),
            statValue: '23',
            statLabel: 'Returning Customers',
          ),
          statCard(
            statColor: Color.fromARGB(255, 118, 145, 253),
            statValue: '8%',
            statLabel: 'Conversion Rate',
          ),
          statCard(
            statColor: Color.fromARGB(255, 253, 118, 118),
            statValue: '123',
            statLabel: 'Impressions',
          ),
        ],
      ),
    );
  }
}
