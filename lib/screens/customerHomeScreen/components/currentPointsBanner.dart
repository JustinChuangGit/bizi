import 'package:bizi/configuration/constants.dart';
import 'package:flutter/material.dart';

class currentPointsBanner extends StatelessWidget {
  const currentPointsBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: height * 0.34),
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
        ],
      ),
    );
  }
}
