import 'package:bizi/configuration/constants.dart';
import 'package:bizi/utilities/controllers/userProfileController.dart';
import 'package:bizi/utilities/models/userModel.dart';
import 'package:bizi/utilities/repository/userRepository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bizi/utilities/authentication/authenticationRepository.dart';

final _authRepo = Get.put(authenticationRepository());

final email = _authRepo.firebaseUser.value?.email;

class currentPointsBanner extends StatefulWidget {
  currentPointsBanner({
    super.key,
  });

  @override
  State<currentPointsBanner> createState() => _currentPointsBannerState();
}

class _currentPointsBannerState extends State<currentPointsBanner> {
  final controller = Get.put(UserProfileController());

  Stream collectionStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  Stream documentStream = FirebaseFirestore.instance
      .collection('users')
      .where('Email', isEqualTo: email)
      .snapshots();

  final Stream<QuerySnapshot> _userStream = FirebaseFirestore.instance
      .collection('users')
      .where('Email', isEqualTo: email)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: height * 0.34),
            child: Card(
                color: colorConstants.biziGreen,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                elevation: 100,
                child: SizedBox(
                  height: height * 0.065,
                  width: height * 0.22,
                  child: Align(
                      alignment: Alignment.center,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: _userStream,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Error');
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return JumpingDots(
                              color: Colors.white,
                              radius: 8,
                            );
                          }

                          var docs = snapshot.data!.docs;
                          final user = docs[0].data();

                          //  UserModel userData = snapshot.data as UserModel;

                          return Row(children: [
                            //  Text(userData.points.toString()),
                            Text(' Points'),
                          ]);

                          // if (snapshot.connectionState ==
                          //     ConnectionState.done) {
                          //   if (snapshot.hasData) {
                          //     UserModel userData = snapshot.data as UserModel;
                          //     print(userData.points.toString());
                          //     return Row(children: [
                          //       Text(userData.points.toString()),
                          //       Text(' Points'),
                          //     ]);
                          //   } else if (snapshot.hasError) {
                          //     return Center(
                          //       child: Text(snapshot.error.toString()),
                          //     );
                          //   } else {
                          //     return Center(child: Text("Error"));
                          //   }
                          // } else {
                          //   return Center(
                          //       child: JumpingDots(
                          //     color: Colors.white,
                          //     radius: 8,
                          //   ));
                          // }
                        },
                      )),
                )),
          ),
        ],
      ),
    );
  }
}
