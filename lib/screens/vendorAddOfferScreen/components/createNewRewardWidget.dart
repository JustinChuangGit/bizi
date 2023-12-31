import 'package:bizi/configuration/constants.dart';
import 'package:bizi/utilities/controllers/rewardController.dart';
import 'package:bizi/utilities/controllers/vendorPofileController.dart';
import 'package:bizi/utilities/models/rewardModel.dart';
import 'package:bizi/widgets/inputTextBox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class createNewRewardWidget extends StatefulWidget {
  createNewRewardWidget({
    super.key,
  });

  @override
  State<createNewRewardWidget> createState() => _createNewRewardWidgetState();
}

class _createNewRewardWidgetState extends State<createNewRewardWidget> {
  final _formKey = GlobalKey<FormState>();

  final rewardController = Get.put(RewardController());
  final vendorController = Get.put(VendorProfileController());
  final storage = FirebaseStorage.instance;
  ImagePicker picker = ImagePicker();
  XFile? image;

  @override
  Widget build(BuildContext context) {
    vendorController.getVendorData();
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
                  controller: rewardController.rewardName, label: 'Offer'),
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
                  controller: rewardController.normalPrice,
                  label: 'Item Price'),
              Container(
                padding: const EdgeInsets.only(bottom: 5, top: 15),
                width: double.infinity,
                child: const Text(
                  'New Price:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              inputTextBox(
                  controller: rewardController.newPrice, label: 'New Price'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(cornerRadius),
                    ),
                    backgroundColor: colorConstants.biziGreen,
                  ),
                  onPressed: () async {
                    image = await picker.pickImage(source: ImageSource.gallery);
                    setState(() {});
                  },
                  child: SizedBox(
                    width: width * 0.7,
                    height: width * 0.15,
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Pick Image',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              image == null ? Container() : Image.file(File(image!.path)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(cornerRadius),
                    ),
                    backgroundColor: colorConstants.biziGreen,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final File file = File(image!.path);
                      var uuid = const Uuid();
                      var data = vendorController.getVendorData();
                      print(data);

                      final reward = RewardModel(
                        id: FirebaseAuth.instance.currentUser!.uid + uuid.v4(),
                        normalPrice: rewardController.normalPrice.text.trim(),
                        vendorName: currentVendor,
                        newPrice: rewardController.newPrice.text.trim(),
                        // newPrice: '0',
                        offerName: rewardController.rewardName.text.trim(),
                        offerFilePath: image!.path.toString(),
                      );
                      RewardController.instance.createReward(reward, file);
                    }
                  },
                  child: SizedBox(
                    width: width * 0.7,
                    height: width * 0.15,
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Create Reward',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
