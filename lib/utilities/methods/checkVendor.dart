import 'package:bizi/screens/customerHomeScreen/customerHomeScreen.dart';
import 'package:bizi/screens/vendorHomeScreen/vendorHomeScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

Future<void> vendorCheck() async {
  final CollectionReference _vendors =
      FirebaseFirestore.instance.collection('vendors');
  final _auth = FirebaseAuth.instance;

  List<String> vendorList = [];

  QuerySnapshot querySnapshot = await _vendors.get();

  for (var docSnapshot in querySnapshot.docs) {
    vendorList.add(docSnapshot.id.toString());
  }

  if (vendorList.contains(_auth.currentUser!.uid)) {
    Get.offAll(venderHomeScreen());
  } else {
    Get.offAll(customerHomeScreen());
  }
}
