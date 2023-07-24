import 'package:bizi/utilities/controllers/offerController.dart';
import 'package:bizi/widgets/inputTextBox.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class createNewRewardWidget extends StatefulWidget {
  createNewRewardWidget({
    super.key,
  });

  @override
  State<createNewRewardWidget> createState() => _createNewRewardWidgetState();
}

class _createNewRewardWidgetState extends State<createNewRewardWidget> {
  final _formKey = GlobalKey<FormState>();

  final OfferController offerController = OfferController();

  ImagePicker picker = ImagePicker();

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
              ElevatedButton(
                  onPressed: () async {
                    XFile? image =
                        await picker.pickImage(source: ImageSource.gallery);
                    print(image!.path);
                  },
                  child: const Text('Pick Image'))
            ],
          ),
        ));
  }
}
