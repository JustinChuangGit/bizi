import 'package:bizi/configuration/constants.dart';
import 'package:bizi/screens/accountSettingsScreen/accountSettingsScreen.dart';
import 'package:bizi/screens/qrScanScreen/qrScanScreen.dart';
import 'package:bizi/screens/vendorAddOfferScreen/vendorAddOfferScreen.dart';
import 'package:bizi/screens/vendorHomeScreen/components/keyStatScroll.dart';
import 'package:bizi/screens/vendorHomeScreen/components/vendorHomeHeader.dart';
import 'package:bizi/widgets/cardList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class venderHomeScreen extends StatefulWidget {
  venderHomeScreen({super.key});

  @override
  State<venderHomeScreen> createState() => _venderHomeScreenState();
}

class _venderHomeScreenState extends State<venderHomeScreen> {
  final ScrollController scrollController = ScrollController();
  Future<void> _refresh() async {
    setState(() {});
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorConstants.biziDark,

      body: RefreshIndicator(
        color: colorConstants.biziGreen,
        onRefresh: _refresh,
        child: ListView(
          controller: scrollController,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  color: colorConstants.biziDark,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                          height: width * 0.25,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 45),
                            child: TextButton(
                              onPressed: () {
                                Get.to(const accountSettingsScreen());
                              },
                              child: const Icon(
                                size: 40,
                                Icons.settings,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const vendorHomeHeader()
                    ],
                  ),
                ),
                Container(
                    color: colorConstants.biziDark,
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(cornerRadius),
                            topRight: Radius.circular(cornerRadius),
                          ),
                          color: Colors.white.withOpacity(0.9)),
                      child: Column(
                        children: [
                          keyStatScroll(),

                          ////////////////////////////////
                          cardList(
                            heading: 'Current Offerings',
                            collectionRef: FirebaseFirestore.instance
                                .collection('vendors')
                                .doc('arGdYqX4XxaUnaQilOEsjuRLn4T2')
                                .collection('currentRewards'),
                          ),

                          ////////////////////////////////
                          ///
                          ///
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(cornerRadius),
                              ),
                              backgroundColor: colorConstants.biziGreen,
                            ),
                            onPressed: () {
                              Get.to(vendorAddOfferScreen());
                            },
                            child: SizedBox(
                                width: width * 0.7,
                                height: width * 0.15,
                                child: const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Create New Offering',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ))),
                          ),
                          const SizedBox(
                            height: 500,
                          )
                        ],
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
      // bottomNavigationBar: bottomBar(),
      // floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Container(
          child: FloatingActionButton(
        backgroundColor: colorConstants.biziGreen,
        onPressed: () {
          Get.to(const qrScanScreen());
        },
        child: const Icon(Icons.qr_code_scanner),
      )),
    );
  }
}
