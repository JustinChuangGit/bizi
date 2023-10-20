import 'package:bizi/configuration/constants.dart';
import 'package:bizi/screens/qrScanScreen/qrScanScreen.dart';
import 'package:bizi/utilities/models/rewardModel.dart';
import 'package:bizi/widgets/cardListCheckout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class vendorCalculatorScreen extends StatefulWidget {
  vendorCalculatorScreen({super.key, required this.scannedUserId});
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
            cardListCheckout(
              heading: 'Users Rewards',
              scannedUserId: widget.scannedUserId,
              getRewardList: _getRewardList,
            ),
            calculatorWidget()
          ],
        ),
      ),
    );
  }
}

class calculatorWidget extends StatefulWidget {
  calculatorWidget({
    super.key,
  });

  @override
  State<calculatorWidget> createState() => _calculatorWidgetState();
}

class _calculatorWidgetState extends State<calculatorWidget> {
  final totalCostController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    totalCostController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: totalCostController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          focusNode: _focusNode,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter Total',
          ),
        ),
        Text(totalCostController.text)
      ],
    );
  }
}
