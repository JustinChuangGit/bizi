import 'package:bizi/configuration/constants.dart';
import 'package:bizi/screens/signInScreen/components/inputTextBox.dart';
import 'package:bizi/widgets/actionButton.dart';
import 'package:bizi/widgets/bottomBar.dart';
import 'package:flutter/material.dart';

class vendorAddOfferScreen extends StatelessWidget {
  vendorAddOfferScreen({super.key});
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBar(),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const actionButton(),
      body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                color: colorConstants.biziDark,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: width * 0.2,
                    ),
                  ],
                ),
              ),
              Container(
                  color: colorConstants.biziDark,
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(cornerRadius),
                          topRight: Radius.circular(cornerRadius),
                        ),
                        color: Colors.white.withOpacity(0.9)),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          width: double.infinity,
                          child: const Text(
                            'Create New Offer',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        createNewOfferWidget(),
                        const SizedBox(
                          height: 500,
                        )
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}

class createNewOfferWidget extends StatelessWidget {
  createNewOfferWidget({
    super.key,
  });
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(
              //       height: height * 0.1,
              //       // child: inputTextBox(
              //       //     controllerLogin: controllerLogin, label: 'Email')),
              SizedBox(height: width * 0.1),
            ],
          ),
        ));
  }
}
