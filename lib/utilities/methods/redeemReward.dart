import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void redeemReward(String rewardId) {
  final _auth = FirebaseAuth.instance;
  final CollectionReference _userRewardList = FirebaseFirestore.instance
      .collection('users')
      .doc(_auth.currentUser!.uid)
      .collection('currentRewards');

  _userRewardList.doc(rewardId).set({'date': DateTime.now()});
}
