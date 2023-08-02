import 'package:bizi/widgets/cardList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
          cardList(
            heading: 'Featured Rewards',
            collectionRef: FirebaseFirestore.instance
                .collection('vendors')
                .doc('arGdYqX4XxaUnaQilOEsjuRLn4T2')
                .collection('currentRewards'),
          ),
          cardList(
            heading: 'Based On Your Location',
            collectionRef: FirebaseFirestore.instance
                .collection('vendors')
                .doc('arGdYqX4XxaUnaQilOEsjuRLn4T2')
                .collection('currentRewards'),
          ),
          cardList(
            heading: 'ABC Cafe',
            collectionRef: FirebaseFirestore.instance
                .collection('vendors')
                .doc('arGdYqX4XxaUnaQilOEsjuRLn4T2')
                .collection('currentRewards'),
          ),
          cardList(
            heading: 'Pizza Joes',
            collectionRef: FirebaseFirestore.instance
                .collection('vendors')
                .doc('arGdYqX4XxaUnaQilOEsjuRLn4T2')
                .collection('currentRewards'),
          )
          // const cardList(heading: 'Featured Offerings'),
          // const cardList(heading: 'Based On Your Location'),
          // const cardList(heading: 'Coffee'),
          // const cardList(heading: 'ABC Pizza'),
          // const cardList(heading: 'Try Something New'),
          // const cardList(heading: 'Try Something New'),
          // const cardList(heading: 'Try Something New'),
          // const cardList(heading: 'Try Something New'),
          // const cardList(heading: 'Try Something New'),
          // const cardList(heading: 'Try Something New'),
          // const cardList(heading: 'Try Something New'),
        ],
      ),
    );
  }
}
