import 'package:bizi/utilities/methods/errorSnackBar.dart';
import 'package:bizi/utilities/models/rewardModel.dart';
import 'package:bizi/utilities/repository/userRepository.dart';
import 'package:bizi/utilities/repository/vendorRepository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bizi/configuration/constants.dart';
import 'package:get/get.dart';

class individualCardCheckout extends StatefulWidget {
  individualCardCheckout({
    super.key,
    required this.rewardData,
  });

  final RewardModel rewardData;

  @override
  State<individualCardCheckout> createState() => _individualCardCheckoutState();
}

class _individualCardCheckoutState extends State<individualCardCheckout> {
  final _vendorRepo = Get.put(VendorRepository());
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _userRepo = Get.put(UserRepository());

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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: 150,
                      height: 125,
                      child: FutureBuilder(
                        future:
                            _vendorRepo.getRewardImage(widget.rewardData.id),
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
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
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
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 20, top: 7),
                    child: Text(
                      widget.rewardData.offerName,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 20, top: 3),
                    child: Text(
                      'From ${widget.rewardData.vendorName}',
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: FutureBuilder(
                      future: _userRepo
                          .getRedeemedRewardList(_auth.currentUser!.uid),
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.data!.contains(widget.rewardData.id)) {
                          return Container(
                            padding: const EdgeInsets.only(top: 5),
                            margin: const EdgeInsets.only(top: 7),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(cornerRadius),
                              color: const Color.fromARGB(110, 68, 201, 139),
                            ),
                            child: SizedBox(
                                width: width * 0.32,
                                height: width * 0.08,
                                child: const Align(
                                  child: Icon(Icons.check),
                                )),
                          );
                        } else {
                          return ElevatedButton(
                            onPressed: () {
                              _userRepo.redeemReward(widget.rewardData.id);
                              setState(() {});
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(cornerRadius),
                              ),
                              backgroundColor: colorConstants.biziGreen,
                            ),
                            child: const SizedBox(
                              width: 90,
                              child: Text(
                                'Apply',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
