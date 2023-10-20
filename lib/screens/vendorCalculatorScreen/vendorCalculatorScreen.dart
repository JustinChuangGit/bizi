import 'package:bizi/configuration/constants.dart';
import 'package:bizi/screens/qrScanScreen/qrScanScreen.dart';
import 'package:bizi/screens/vendorCalculatorScreen/components/calculatorWidget.dart';
import 'package:bizi/utilities/models/rewardModel.dart';
import 'package:bizi/widgets/cardListCheckout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class vendorCalculatorScreen extends StatefulWidget {
  const vendorCalculatorScreen({super.key, required this.scannedUserId});
  final scannedUserId;

  @override
  State<vendorCalculatorScreen> createState() => _vendorCalculatorScreenState();
}

class _vendorCalculatorScreenState extends State<vendorCalculatorScreen> {
  List<RewardModel> appliedRewardList = [];

  void _getRewardList(RewardModel appliedReward) {
    setState(
      () {
        if (appliedRewardList
            .map((reward) => reward.id)
            .contains(appliedReward.id)) {
          appliedRewardList
              .removeWhere((element) => element.id == appliedReward.id);
        } else {
          appliedRewardList.add(appliedReward);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        setState(() {});
      },
      child: Scaffold(
        backgroundColor: colorConstants.biziGreen,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: Container(
            child: FloatingActionButton(
          backgroundColor: colorConstants.biziGreen,
          onPressed: () {
            Get.to(const qrScanScreen());
          },
          child: const Icon(Icons.qr_code_scanner),
        )),
        body: Column(
          children: [
            SizedBox(
              height: width * 0.1,
            ),
            cardListCheckout(
              heading: 'Users Rewards',
              scannedUserId: widget.scannedUserId,
              getRewardList: _getRewardList,
            ),
            calculatorWidget(
              appliedRewardList: appliedRewardList,
            )
          ],
        ),
      ),
    );
  }
}
