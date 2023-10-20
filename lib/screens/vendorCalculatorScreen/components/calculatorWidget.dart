import 'package:bizi/configuration/constants.dart';
import 'package:bizi/utilities/models/rewardModel.dart';
import 'package:flutter/material.dart';

class calculatorWidget extends StatefulWidget {
  const calculatorWidget({
    required this.appliedRewardList,
    super.key,
  });
  final List<RewardModel> appliedRewardList;

  @override
  State<calculatorWidget> createState() => _calculatorWidgetState();
}

class _calculatorWidgetState extends State<calculatorWidget> {
  final totalCostController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    totalCostController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double savings = 0;
    for (int i = 0; i < widget.appliedRewardList.length; i++) {
      //savings += widget.appliedRewardList[i].savings;
    }
    return Column(
      children: [
        Text('Enter Sub Total:'),
        TextField(
          controller: totalCostController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter Total',
          ),
        ),
        Text('Total: ' + (double.tryParse(totalCostController.text)).toString())
      ],
    );
  }
}
