import 'package:bizi/configuration/constants.dart';
import 'package:bizi/utilities/controllers/userProfileController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  final Stream<QuerySnapshot> _userStream = FirebaseFirestore.instance
      .collection('users')
      .where('Email', isEqualTo: email)
      .snapshots();

  // final Stream<QuerySnapshot> _userStream = FirebaseFirestore.instance
  //     .collection('users')
  //     .doc(userUid)
  //     .snapshots() as Stream<QuerySnapshot<Object?>>;
  @override
  Widget build(BuildContext context) {
    // print(userUid);

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
                            return const Text('Error');
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return JumpingDots(
                              color: Colors.white,
                              radius: 8,
                            );
                          }

                          String currentPoints =
                              snapshot.data!.docs[0].get('Points').toString();

                          return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  currentPoints,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  ' Points',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
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
