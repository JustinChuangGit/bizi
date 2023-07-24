import 'package:bizi/configuration/constants.dart';
import 'package:bizi/screens/signInScreen/signInScreen.dart';

import 'package:bizi/utilities/controllers/signUpController.dart';
import 'package:flutter/material.dart';
import 'package:bizi/widgets/inputTextBox.dart';
import 'package:get/get.dart';

class middleCardVendor extends StatefulWidget {
  const middleCardVendor({
    super.key,
    required this.controller,
    required this.cardFontSize,
    required this.cardWidth,
    required this.cardPadding,
    required this.controllerScroll,
  });

  final signUpController controller;
  final double cardFontSize;
  final double cardWidth;
  final double cardPadding;
  final ScrollController controllerScroll;

  @override
  State<middleCardVendor> createState() => _firstCardState();
}

class _firstCardState extends State<middleCardVendor> {
  final _formKey = GlobalKey<FormState>();
  String? selectedValue = null;
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = ''; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.cardPadding),
      child: SizedBox(
        height: height * 0.7,
        width: widget.cardWidth,
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(cornerRadius)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Form(
                    key: _formKey,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            width: double.infinity,
                            child: Text(
                              'Primary Contact First Name:',
                              style: TextStyle(
                                  fontSize: widget.cardFontSize,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          inputTextBox(
                              controller:
                                  widget.controller.primaryContactFirstName,
                              label: 'Primary Contact First Name'),
                          Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            width: double.infinity,
                            child: Text(
                              'Primary Contact Last Name:',
                              style: TextStyle(
                                  fontSize: widget.cardFontSize,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          inputTextBox(
                              controller:
                                  widget.controller.primaryContactLastName,
                              label: 'Primary Contact Last Name'),
                          Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            width: double.infinity,
                            child: Text(
                              'Primary Contact Email:',
                              style: TextStyle(
                                  fontSize: widget.cardFontSize,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          inputTextBox(
                              controller: widget.controller.primaryContactEmail,
                              label: 'Primary Contact Email'),
                          Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            width: double.infinity,
                            child: Text(
                              'Primary Contact Phone Number:',
                              style: TextStyle(
                                  fontSize: widget.cardFontSize,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          inputTextBox(
                              controller:
                                  widget.controller.primaryContactPhoneNumber,
                              label: 'Primary Contact Phone Number'),
                        ],
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(bottom: widget.cardPadding),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: width * 0.02),
                          child: SizedBox(
                            width: width * 0.1,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: colorConstants.biziGreen,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    )),
                                onPressed: () {
                                  Get.to(const signInScreen());
                                },
                                child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: height * 0.015),
                                    child: const Icon(Icons.arrow_back_ios))),
                          ),
                        ),
                        Container(
                          width: width * 0.65,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: colorConstants.biziGreen,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  )),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  widget.controllerScroll.animateTo(
                                    widget.controllerScroll.position
                                        .maxScrollExtent,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.fastOutSlowIn,
                                  );
                                }
                              },
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: height * 0.02),
                                  child: const Text(
                                    "Next",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ))),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
