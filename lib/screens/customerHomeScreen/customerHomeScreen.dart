import 'package:bizi/configuration/constants.dart';
import 'package:bizi/screens/customerHomeScreen/components/currentPointsBanner.dart';
import 'package:bizi/screens/customerHomeScreen/components/mainCard.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class customerHomeScreen extends StatelessWidget {
  customerHomeScreen({Key? key}) : super(key: key);
////////////////////////////////////////////////////////////////////////////////////////////////Delete this after
  final _auth = FirebaseAuth.instance;

  String getInfo() {
    String? temp = _auth.currentUser!.email;

    if (temp != null) {
      return temp;
    } else {
      return "No One Signed in";
    }
  }

////////////////////////////////////////////////////////////////4

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: colorConstants.biziDark,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              Stack(
                children: [
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          width: width * 0.68,
                          height: height * 0.4,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.08),
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: Colors.white.withOpacity(0.1),
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(125)),
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 0.07,
                            ),
                            Card(
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                              ),
                              elevation: 100,
                              child: SizedBox(
                                height: height * 0.25,
                                width: height * 0.25,
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Add QR Widget Here '),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.05,
                            ),
                            mainCard(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  currentPointsBanner()
                ],
              ),
            ],
          ),
        ),
      ),
    );
    // return Column(
    //   children: [
    //     const SizedBox(
    //       height: 100,
    //     ),
    //     SizedBox(
    //       width: double.infinity,
    //       child: ElevatedButton(
    //         onPressed: () {
    //           authenticationRepository.instance.logout();
    //         },
    //         child: const Text("Sign Out"),
    //       ),
    //     ),
    //     Text(getInfo())
    //   ],
    // );
  }
}
