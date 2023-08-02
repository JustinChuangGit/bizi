import 'package:bizi/configuration/constants.dart';
import 'package:bizi/screens/vendorSignUpScreen/components/firstCardVendor.dart';
import 'package:bizi/screens/vendorSignUpScreen/components/lastCardVendor.dart';
import 'package:bizi/screens/vendorSignUpScreen/components/middleCardVendor.dart';
import 'package:bizi/utilities/controllers/signUpController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class signUpVendorFormWidget extends StatefulWidget {
  const signUpVendorFormWidget({Key? key}) : super(key: key);

  @override
  State<signUpVendorFormWidget> createState() => _signUpVendorFormWidgetState();
}

class _signUpVendorFormWidgetState extends State<signUpVendorFormWidget> {
  @override
  Widget build(BuildContext context) {
    const double cardPadding = 20;
    double cardWidth = width * 0.9;
    const double cardFontSize = 16;

    final controller = Get.put(signUpController());
    ScrollController _scrollController = ScrollController();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: height * 0.661,
        child: ListView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          //physics: const NeverScrollableScrollPhysics(),
          children: [
            firstCardVendor(
              controller: controller,
              cardFontSize: cardFontSize,
              cardWidth: cardWidth,
              cardPadding: cardPadding,
              controllerScroll: _scrollController,
            ),
            middleCardVendor(
                controller: controller,
                cardFontSize: cardFontSize,
                cardWidth: cardWidth,
                cardPadding: cardPadding,
                controllerScroll: _scrollController),
            lastCardVendor(
              controller: controller,
              cardFontSize: cardFontSize,
              cardWidth: cardWidth,
              cardPadding: cardPadding,
              controllerScroll: _scrollController,
            ),
          ],
        ),
      ),
    );
  }
}
