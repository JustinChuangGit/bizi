import 'package:bizi/configuration/constants.dart';
import 'package:bizi/utilities/authentication/authenticationRepository.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class currentPointsBanner extends StatelessWidget {
  const currentPointsBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      //Green Card
      top: height * 0.30,
      child: Align(
        alignment: Alignment.center,
        child: Card(
            color: colorConstants.biziGreen,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            elevation: 100,
            child: SizedBox(
              height: height * 0.065,
              width: height * 0.22,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('600 Pts '),
                ],
              ),
            )),
      ),
    );
  }
}
