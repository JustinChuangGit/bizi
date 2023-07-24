import 'package:bizi/utilities/controllers/offerController.dart';
import 'package:bizi/widgets/inputTextBox.dart';

import 'package:flutter/material.dart';

class createNewRewardWidget extends StatelessWidget {
  createNewRewardWidget({
    super.key,
  });
  final _formKey = GlobalKey<FormState>();
  final OfferController offerController = OfferController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 5, top: 15),
                width: double.infinity,
                child: const Text(
                  'Offer Name:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              inputTextBox(
                  controller: offerController.offerName, label: 'Offer'),
              Container(
                padding: const EdgeInsets.only(bottom: 5, top: 15),
                width: double.infinity,
                child: const Text(
                  'Item Price:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              inputTextBox(
                  controller: offerController.normalPrice, label: 'Item Price'),
            ],
          ),
        ));
  }
}
