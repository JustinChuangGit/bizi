import 'package:bizi/utilities/models/rewardModel.dart';
import 'package:flutter/material.dart';
import 'package:bizi/configuration/constants.dart';

class individualCard extends StatelessWidget {
  individualCard({
    super.key,
    required this.rewardData,
    // required this.reward,
  });

  final RewardModel rewardData;

  //final Object reward;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.01,
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(cornerRadius)),
            elevation: 10,
            child: SizedBox(
              width: width * 0.5,
              height: height * 0.29,
              child: Text(rewardData.offerName),
            ),
          ),
        ],
      ),
    );
  }
}
