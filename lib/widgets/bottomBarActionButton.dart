import 'package:bizi/configuration/constants.dart';
import 'package:bizi/widgets/bottomIcon.dart';
import 'package:flutter/material.dart';

class actionButton extends StatefulWidget {
  actionButton({
    Key? key,
    required this.scrollController,
  }) : super(key: key);
  late ScrollController scrollController;

  @override
  State<actionButton> createState() => _actionButtonState();
}

class _actionButtonState extends State<actionButton> {
  @override
  late double currentPossition;
  void initState() {
    widget.scrollController.addListener(() {
      //listener

      setState(() {
        //update state
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    currentPossition = widget.scrollController.offset;

    return Container(
      child: widget.scrollController.offset < 180
          ? FloatingActionButton(
              backgroundColor: colorConstants.biziGreen,
              onPressed: () {},
              child: Icon(Icons.qr_code_scanner),
            )
          : null,
    );
  }
}
