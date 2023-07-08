import 'package:bizi/screens/accountSettingsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomIcon extends StatelessWidget {
  final String _iconText;
  final IconData _icon;
  final EdgeInsetsGeometry _padding;

  BottomIcon({@required iconText, @required icon, padding})
      : this._iconText = iconText,
        this._icon = icon,
        this._padding = padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            onTap: () {
              if (_iconText == 'Account') {
                Get.to(const accountSettingsScreen());
              }

              print('object');
            },
            child: IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(
                _icon,
                size: 40,
                color: Colors.white,
              ),
              onPressed: () {
                if (_iconText == 'Account') {
                  Get.to(const accountSettingsScreen());
                }
              },
            ),
          ),
          Text(
            _iconText,
            style: TextStyle(fontSize: 10, color: Colors.white),
          )
        ],
      ),
    );
  }
}
