import 'package:bizi/configuration/constants.dart';
import 'package:bizi/screens/customerHomeScreen/components/currentPointsBanner.dart';
import 'package:bizi/screens/customerHomeScreen/components/mainCard.dart';
import 'package:bizi/widgets/bottomBar.dart';
import 'package:bizi/widgets/bottomIcon.dart';
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
                child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: colorConstants.biziDark),
              ),
              Stack(
                children: [
                  Container(
                      width: double.infinity,
                      height: 500,
                      color: colorConstants.biziDark),
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

      bottomNavigationBar: bottomBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorConstants.biziGreen,
        onPressed: () {},
        child: Icon(Icons.qr_code_scanner),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: BottomAppBar(
      //   color: Colors.blueGrey,
      //   shape: CircularNotchedRectangle(),
      //   child: Container(
      //     height: 70,
      //     child: Padding(
      //       padding: const EdgeInsets.only(top: 10),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         children: <Widget>[
      //           BottomIcon(
      //             iconText: 'Home',
      //             icon: Icons.home_outlined,
      //             padding: EdgeInsets.only(right: 30),
      //           ),
      //           BottomIcon(
      //             iconText: 'Home',
      //             icon: Icons.storefront,
      //             padding: EdgeInsets.only(right: 30),
      //           ),
      //           BottomIcon(
      //             iconText: 'Home',
      //             icon: Icons.favorite_border,
      //             padding: EdgeInsets.only(right: 30),
      //           ),
      //           BottomIcon(
      //             iconText: 'Home',
      //             icon: Icons.person_outline,
      //             padding: EdgeInsets.only(right: 30),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.blueGrey,
      //   onPressed: () {},
      //   child: Icon(
      //     Icons.account_circle,
      //     size: 35,
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
