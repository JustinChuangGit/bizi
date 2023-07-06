import 'package:bizi/configuration/constants.dart';
import 'package:flutter/material.dart';

class cardList extends StatelessWidget {
  const cardList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.2,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Card(
            elevation: 10,
            child: SizedBox(
              width: width * 0.3,
            ),
          ),
          Card(
            elevation: 10,
            child: SizedBox(
              width: width * 0.3,
            ),
          ),
          Card(
            elevation: 10,
            child: SizedBox(
              width: width * 0.3,
            ),
          ),
          Card(
            elevation: 10,
            child: SizedBox(
              width: width * 0.3,
            ),
          ),
          Card(
            elevation: 10,
            child: SizedBox(
              width: width * 0.3,
            ),
          ),
        ],
      ),
    );
  }
}
