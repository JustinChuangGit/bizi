import 'package:bizi/configuration/constants.dart';
import 'package:bizi/widgets/individualCard.dart';
import 'package:flutter/material.dart';

class cardList extends StatelessWidget {
  const cardList({
    super.key,
    required this.heading,
  });

  final String heading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                heading,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'View All',
                    style: TextStyle(color: colorConstants.biziGreen),
                  ))
            ],
          ),
        ),
        SizedBox(
          height: height * 0.32,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              individualCard(),
              individualCard(),
              individualCard(),
              individualCard(),
              individualCard(),
              individualCard(),
            ],
          ),
        ),
      ],
    );
  }
}
