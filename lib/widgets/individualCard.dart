import 'package:bizi/utilities/methods/errorSnackBar.dart';
import 'package:bizi/utilities/models/rewardModel.dart';
import 'package:bizi/utilities/repository/vendorRepository.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:bizi/configuration/constants.dart';

class individualCard extends StatelessWidget {
  individualCard({
    super.key,
    required this.rewardData,
  });

  final RewardModel rewardData;

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
              child: Column(
                children: [
                  FutureBuilder(
                    future:
                        VendorRepository.instance.getRewardImage(rewardData.id),
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.hasError) {
                        errorSnackBar(errorMessage: 'Image failed to load');
                        return const Placeholder(
                          child: SizedBox(
                            width: 150,
                            height: 150,
                          ),
                        );
                      }

                      if (snapshot.hasData) {
                        return Image.network(
                          snapshot.data.toString(),
                          width: 150,
                          height: 150,
                        );
                      }

                      return Center(
                        child: LinearProgressIndicator(
                          color: colorConstants.biziGreen,
                        ),
                      );
                    },
                  ),
                  Text(rewardData.offerName),
                  ElevatedButton(
                      onPressed: () {},
                      child: const SizedBox(
                        child: Text('Redeem'),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
