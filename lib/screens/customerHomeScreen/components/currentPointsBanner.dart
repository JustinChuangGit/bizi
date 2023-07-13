import 'package:bizi/configuration/constants.dart';
import 'package:bizi/utilities/controllers/userProfileController.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    // final UserModel test = controller.getUserData();
    // print(test);
    final Stream<DocumentSnapshot> _userStream = FirebaseFirestore.instance
        .collection('users')
        .doc(_auth.currentUser?.uid)
        .snapshots();
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
                      child: StreamBuilder<DocumentSnapshot>(
                        stream: _userStream,
                        builder: (BuildContext context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return const Text('Error');
                          }

                          var user =
                              snapshot.data!.data() as Map<String, dynamic>;
                          //Convert Snapshot data to a map

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return JumpingDots(
                              color: Colors.white,
                              radius: 8,
                            );
                          }

                          return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  user['Points'].toString(),
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
                        },
                      )),
                )),
          ),
        ],
      ),
    );
  }
}
