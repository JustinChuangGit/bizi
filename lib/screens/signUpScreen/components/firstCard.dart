import 'package:bizi/configuration/constants.dart';
import 'package:bizi/screens/signInScreen/signInScreen.dart';

import 'package:bizi/screens/signUpScreen/components/signUpController.dart';
import 'package:flutter/material.dart';
import 'package:bizi/screens/signUpScreen/components/inputTextBoxSignUp.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class firstCard extends StatefulWidget {
  const firstCard({
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
  State<firstCard> createState() => _firstCardState();
}

class _firstCardState extends State<firstCard> {
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "Male", child: Text("Male")),
      const DropdownMenuItem(value: "Female", child: Text("Female")),
      const DropdownMenuItem(value: "Other", child: Text("Other")),
      const DropdownMenuItem(
          value: "Prefer Not To Say", child: Text("Prefer Not To Say")),
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
                              'First Name:',
                              style: TextStyle(
                                  fontSize: widget.cardFontSize,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          inputTextBox(
                              controllerSignUp: widget.controller.firstName,
                              label: 'First Name'),
                          Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            width: double.infinity,
                            child: Text(
                              'Last Name:',
                              style: TextStyle(
                                  fontSize: widget.cardFontSize,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          inputTextBox(
                              controllerSignUp: widget.controller.lastName,
                              label: 'Last Name'),
                          Container(
                            padding: const EdgeInsets.only(bottom: 5),
                            width: double.infinity,
                            child: Text(
                              'Gender:',
                              style: TextStyle(
                                  fontSize: widget.cardFontSize,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          DropdownButtonFormField(
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
                                  gender = selectedValue;
                                });
                              },
                              items: dropdownItems),
                          Container(
                            padding: const EdgeInsets.only(bottom: 5, top: 10),
                            width: double.infinity,
                            child: Text(
                              'Date of Birth:',
                              style: TextStyle(
                                  fontSize: widget.cardFontSize,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextField(
                            controller: widget.controller.age,
                            //editing controller of this TextField
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: colorConstants.biziDark),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: colorConstants.biziDark,
                              )),
                              iconColor: colorConstants.biziDark,
                              fillColor: colorConstants.biziGreen,
                              icon: const Icon(
                                  Icons.calendar_today), //icon of text field
                              hintText: dateInput.text != ''
                                  ? dateInput.text
                                  : "Enter Date", //label text of field
                            ),
                            readOnly: true,
                            //set it true, so that user will not able to edit text
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.light(
                                          primary: colorConstants
                                              .biziGreen, // <-- SEE HERE
                                          onPrimary:
                                              Colors.white, // <-- SEE HERE
                                          onSurface: colorConstants
                                              .biziDark, // <-- SEE HERE
                                        ),
                                        textButtonTheme: TextButtonThemeData(
                                          style: TextButton.styleFrom(
                                            backgroundColor: Colors
                                                .white, // button text color
                                          ),
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2100));

                              if (pickedDate != null) {
                                print(
                                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(
                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                setState(() {
                                  dateInput.text =
                                      formattedDate; //set output date to TextField value.
                                  dateOfBirth = formattedDate;
                                });
                              } else {}
                            },
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
