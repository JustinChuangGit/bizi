import 'package:bizi/configuration/constants.dart';
import 'package:bizi/screens/customerHomeScreen/components/currentPointsBanner.dart';
import 'package:bizi/screens/customerHomeScreen/components/mainCard.dart';
import 'package:bizi/widgets/bottomBar.dart';
import 'package:flutter/material.dart';
import 'package:bizi/widgets/actionButtonHome.dart';

class customerHomeScreen extends StatelessWidget {
  customerHomeScreen({Key? key}) : super(key: key);

  //Scroll Controller must be added to all pages
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        controller: scrollController,
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
      // floatingActionButtonLocation:
      //     scrollController.offset < buttonDissapearLocation
      //         ? FloatingActionButtonLocation.centerDocked
      //         : null,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: actionButtonHome(
        scrollController: scrollController,
      ),
    );
  }
}
