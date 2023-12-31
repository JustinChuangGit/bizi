import 'package:bizi/configuration/constants.dart';
import 'package:bizi/widgets/bottomIcon.dart';
import 'package:flutter/material.dart';

class bottomBar extends StatefulWidget {
  bottomBar({Key? key}) : super(key: key);

  @override
  State<bottomBar> createState() => _bottomBarState();
}

class _bottomBarState extends State<bottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        height: height * 0.1,
        color: colorConstants.biziDark,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Container(
          height: height * 0.13,
          child: Row(children: [
            BottomIcon(
              iconText: 'Home',
              icon: Icons.home_outlined,
              padding: EdgeInsets.only(left: width * 0.08, right: width * 0.08),
            ),
            BottomIcon(
              iconText: 'Stores',
              icon: Icons.storefront,
              padding: EdgeInsets.only(right: width * 0.08),
            ),
            BottomIcon(
              iconText: 'Favorites',
              icon: Icons.favorite_border,
              padding: EdgeInsets.only(left: width * 0.11),
            ),
            BottomIcon(
              iconText: 'Account',
              icon: Icons.person_outline,
              padding: EdgeInsets.only(left: width * 0.08),
            ),
          ]),
        ));
  }
}
