import 'dart:core';
import 'dart:async';
import 'package:bizi/configuration/constants.dart';
import 'package:bizi/utilities/models/rewardModel.dart';
import 'package:bizi/utilities/repository/vendorRepository.dart';
import 'package:bizi/widgets/individualCardCheckout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class cardListCheckout extends StatefulWidget {
  const cardListCheckout({
    super.key,
    required this.heading,
    required this.scannedUserId,
  });

  final String heading;
  final scannedUserId;

  @override
  State<cardListCheckout> createState() => _cardListCheckoutState();
}

class _cardListCheckoutState extends State<cardListCheckout> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;
  final _vendorRepo = Get.put(VendorRepository());

  @override
  void initState() {
    super.initState();
  }

//Was having an issue when sending straight as <Future<List<Object>>> accessing fields. Solved by just sending Json data and decoding later.
  Future<List<RewardModel>> _getApplicableRewards() async {
    final userRewardStack =
        await _vendorRepo.checkUserStack(widget.scannedUserId);

    CollectionReference collectionRef = _db
        .collection('vendors')
        .doc(_auth.currentUser!.uid)
        .collection('currentRewards');

    QuerySnapshot querySnapshot = await collectionRef.get();
    var rewardList = querySnapshot.docs
        .map((doc) => RewardModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();

    List<RewardModel> applicableRewards = [];
    for (int i = 0; i < rewardList.length; i++) {
      if (userRewardStack.contains(rewardList[i].id)) {
        applicableRewards.add(rewardList[i]);
      }
    }
    return applicableRewards;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.heading,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'View All',
                    style: TextStyle(color: colorConstants.biziGreen),
                  ))
            ],
          ),
        ),
        SizedBox(
          height: height * 0.32,
          child: FutureBuilder<List<RewardModel>>(
              future: _getApplicableRewards(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<RewardModel>> snapshot) {
                if (snapshot.hasError) {
                } else if (snapshot.hasData) {
                  //This decodes the Json data and creates instances of RewardModel

                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return individualCardCheckout(
                          rewardData: snapshot.data![index]);
                    },
                  );
                }

                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ),
      ],
    );
  }
}
