import 'package:bizi/configuration/constants.dart';
import 'package:bizi/screens/vendorAddOfferScreen/vendorAddOfferScreen.dart';
import 'package:bizi/screens/vendorHomeScreen/components/keyStatScroll.dart';
import 'package:bizi/screens/vendorHomeScreen/components/vendorHomeHeader.dart';
import 'package:bizi/widgets/actionButton.dart';
import 'package:bizi/widgets/bottomBar.dart';
import 'package:bizi/widgets/cardList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class venderHomeScreen extends StatelessWidget {
  venderHomeScreen({super.key});

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                color: colorConstants.biziDark,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: width * 0.2,
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
                        const cardList(heading: 'Current Offerings'),
                        ElevatedButton(
                          // style: ButtonStyle(
                          //     backgroundColor: MaterialStateProperty.all(
                          //         colorConstants.biziGreen)),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(cornerRadius),
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
          )),
      bottomNavigationBar: bottomBar(),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const actionButton(),
    );
  }
}
