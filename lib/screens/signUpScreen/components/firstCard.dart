import 'package:bizi/configuration/constants.dart';

import 'package:bizi/screens/signUpScreen/components/inputTextBoxPasswordSignUp.dart';
import 'package:bizi/screens/signUpScreen/components/signUpController.dart';
import 'package:bizi/utilities/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:bizi/screens/signUpScreen/components/inputTextBoxSignUp.dart';
import 'package:bizi/screens/signUpScreen/components/inputTextBoxSignUp.dart';
import 'package:intl/intl.dart';

class firstCard extends StatefulWidget {
  firstCard({
    super.key,
    required this.controller,
    required this.cardFontSize,
    required this.cardWidth,
    required this.cardPadding,
    required this.controllerScroll,
  });

  final signUpController controller;
  final cardFontSize;
  final cardWidth;
  final cardPadding;
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
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.cardPadding),
      child: SizedBox(
        height: height * 0.3,
        width: widget.cardWidth,
        child: Card(
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
                              borderSide:
                                  BorderSide(color: colorConstants.biziDark),
                              borderRadius: BorderRadius.circular(cornerRadius),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: colorConstants.biziDark),
                              borderRadius: BorderRadius.circular(cornerRadius),
                            ),
                            //filled: true,
                          ),
                          validator: (value) =>
                              value == null ? "Please choose an option" : null,
                          value: selectedValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue = newValue!;
                            });
                          },
                          items: dropdownItems),
                      Container(
                        padding: const EdgeInsets.only(bottom: 5, top: 5),
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
                          icon: Icon(Icons.calendar_today), //icon of text field
                          hintText: "Enter Date", //label text of field
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
                                      onPrimary: Colors.white, // <-- SEE HERE
                                      onSurface: colorConstants
                                          .biziDark, // <-- SEE HERE
                                    ),
                                    textButtonTheme: TextButtonThemeData(
                                      style: TextButton.styleFrom(
                                        backgroundColor:
                                            Colors.white, // button text color
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
                            });
                          } else {}
                        },
                      )
                    ],
                  ),
                )),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  widget.controllerScroll.animateTo(
                    widget.controllerScroll.position.maxScrollExtent,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                  );
                }
              },
              child: const Text('Sign up'),
            ),
          ],
        )),
      ),
    );
  }
}
