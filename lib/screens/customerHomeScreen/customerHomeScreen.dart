import 'package:bizi/configuration/constants.dart';
import 'package:bizi/screens/customerHomeScreen/components/currentPointsBanner.dart';
import 'package:bizi/screens/customerHomeScreen/components/mainCard.dart';
import 'package:bizi/widgets/bottomBar.dart';
import 'package:bizi/widgets/qrCode.dart';
import 'package:flutter/material.dart';
import 'package:bizi/widgets/actionButtonHome.dart';

class customerHomeScreen extends StatefulWidget {
  customerHomeScreen({Key? key}) : super(key: key);

  @override
  State<customerHomeScreen> createState() => _customerHomeScreenState();
}

class _customerHomeScreenState extends State<customerHomeScreen> {
  //Scroll Controller must be added to all pages
  final ScrollController scrollController = ScrollController();

  Future<void> _refresh() async {
    setState(() {});
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: colorConstants.biziDark,
      body: RefreshIndicator(
        color: colorConstants.biziGreen,
        onRefresh: _refresh,
        child: ListView(controller: scrollController, children: [
          Center(
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
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // SizedBox(
                                      //     height: width * 0.05,
                                      //     child: Text('Scan To Collect Rewards')),
                                      QRCode(
                                        qrSize: width * 0.4,
                                      ),
                                      // SizedBox(
                                      //   height: width * 0.05,
                                      // )
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
        ]),
      ),
      bottomNavigationBar: bottomBar(),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: actionButtonHome(
        scrollController: scrollController,
      ),
    );
  }
}
