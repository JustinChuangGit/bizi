import 'package:bizi/configuration/constants.dart';
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
        shape: CircularNotchedRectangle(),
        child: Row(children: [
          IconButton(
            icon: Column(
              children: [
                Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                  size: 50,
                ),
                Text(
                  'data',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Column(
              children: [
                Icon(
                  Icons.storefront,
                  color: Colors.white,
                  size: 50,
                ),
                Text(
                  'data',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Column(
              children: [
                Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: 50,
                ),
                Text(
                  'data',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Column(
              children: [
                Icon(
                  Icons.person_outline,
                  color: Colors.white,
                  size: 50,
                ),
                Text(
                  'data',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
        ]));
  }
}
