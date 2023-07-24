import 'package:bizi/configuration/constants.dart';
import 'package:bizi/screens/signInScreen/signInScreen.dart';

import 'package:bizi/utilities/controllers/signUpController.dart';
import 'package:flutter/material.dart';
import 'package:bizi/widgets/inputTextBox.dart';
import 'package:get/get.dart';

class firstCardVendor extends StatefulWidget {
  const firstCardVendor({
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
  State<firstCardVendor> createState() => _firstCardState();
}

class _firstCardState extends State<firstCardVendor> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "coffee", child: Text("Coffee Shop")),
      const DropdownMenuItem(value: "foodTruck", child: Text("Food Truck")),
      const DropdownMenuItem(value: "resturant", child: Text("Resturant")),
      const DropdownMenuItem(value: "other", child: Text("Other")),
    ];
    return menuItems;
  }

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
                              'Business Name:',
                              style: TextStyle(
                                  fontSize: widget.cardFontSize,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          inputTextBox(
                              controller: widget.controller.vendorName,
                              label: 'Business Name'),
                          Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            width: double.infinity,
                            child: Text(
                              'Business Number',
                              style: TextStyle(
                                  fontSize: widget.cardFontSize,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          inputTextBox(
                              controller: widget.controller.businessNumber,
                              label: 'Business Number'),
                          Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            width: double.infinity,
                            child: Text(
                              'Business Address',
                              style: TextStyle(
                                  fontSize: widget.cardFontSize,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          inputTextBox(
                              controller: widget.controller.address,
                              label: 'Business Address'),
                          Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            width: double.infinity,
                            child: Text(
                              'Business Type:',
                              style: TextStyle(
                                  fontSize: widget.cardFontSize,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.1,
                            child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: colorConstants.biziDark),
                                    borderRadius:
                                        BorderRadius.circular(cornerRadius),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: colorConstants.biziDark),
                                    borderRadius:
                                        BorderRadius.circular(cornerRadius),
                                  ),
                                  //filled: true,
                                ),
                                validator: (value) => value == null
                                    ? "Please choose an option"
                                    : null,
                                value: selectedValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedValue = newValue!;
                                    vendorCategory = selectedValue;
                                  });
                                },
                                items: dropdownItems),
                          ),
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
