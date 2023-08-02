import 'package:bizi/utilities/methods/errorSnackBar.dart';
import 'package:bizi/utilities/models/rewardModel.dart';
import 'package:bizi/utilities/repository/vendorRepository.dart';
import 'package:flutter/material.dart';
import 'package:bizi/configuration/constants.dart';
import 'package:get/get.dart';

class individualCard extends StatelessWidget {
  individualCard({
    super.key,
    required this.rewardData,
  });

  final RewardModel rewardData;
  final _vendorRepo = Get.put(VendorRepository());

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
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: SizedBox(
                      width: 125,
                      height: 125,
                      child: FutureBuilder(
                        future: _vendorRepo.getRewardImage(rewardData.id),
                        builder: (BuildContext context, snapshot) {
                          if (snapshot.hasError) {
                            errorSnackBar(errorMessage: 'Image failed to load');
                            return const FittedBox(
                              child: Placeholder(
                                child: SizedBox(
                                  width: 150,
                                  height: 150,
                                ),
                              ),
                            );
                          }

                          if (snapshot.hasData) {
                            return FittedBox(
                              fit: BoxFit.fill,
                              child: Image.network(
                                snapshot.data.toString(),
                                fit: BoxFit.fill,
                              ),
                            );
                          }

                          return Center(
                            child: LinearProgressIndicator(
                              color: colorConstants.biziGreen,
                            ),
                          );
                        },
                      ),
                    ),
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
