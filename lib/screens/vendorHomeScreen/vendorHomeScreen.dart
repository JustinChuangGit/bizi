import 'package:bizi/configuration/constants.dart';
import 'package:bizi/screens/vendorHomeScreen/components/vendorHomeHeader.dart';
import 'package:bizi/widgets/actionButton.dart';
import 'package:bizi/widgets/actionButtonHome.dart';
import 'package:bizi/widgets/bottomBar.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

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
                    vendorHomeHeader()
                  ],
                ),
              ),
              Container(
                  color: colorConstants.biziDark,
                  width: double.infinity,
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(cornerRadius),
                          topRight: Radius.circular(cornerRadius),
                        ),
                        color: Colors.white),
                    child: const Column(
                      children: [
                        SizedBox(
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
      floatingActionButton: actionButton(),
    );
  }
}
