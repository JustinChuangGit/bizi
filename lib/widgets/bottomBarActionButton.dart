import 'package:bizi/configuration/constants.dart';
import 'package:bizi/utilities/authentication/authenticationRepository.dart';
import 'package:flutter/material.dart';

class actionButton extends StatefulWidget {
  actionButton({
    Key? key,
    required this.scrollController,
  }) : super(key: key);
  late final ScrollController scrollController;

  @override
  State<actionButton> createState() => _actionButtonState();
}

class _actionButtonState extends State<actionButton> {
  late double _currentPossition;
  bool _visible = true;
  @override
  void initState() {
    widget.scrollController.addListener(() {
      _currentPossition < buttonDissapearLocation
          ? _visible = false
          : _visible = true;
      //listener

      setState(() {
        //update state
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    _currentPossition = widget.scrollController.offset;

    return Container(
      child: widget.scrollController.offset > buttonDissapearLocation
          ? AnimatedOpacity(
              opacity: _visible ? 0 : 1.0,
              duration: const Duration(milliseconds: 1000),
              child: FloatingActionButton(
                backgroundColor: colorConstants.biziGreen,
                onPressed: () {
                  //Temp
                  authenticationRepository.instance.logout();
                },
                child: Icon(Icons.qr_code_scanner),
              ),
            )
          : AnimatedOpacity(
              opacity: !_visible ? 0 : 1.0,
              duration: const Duration(milliseconds: 1000),
              child: SizedBox()),
    );
  }
}
