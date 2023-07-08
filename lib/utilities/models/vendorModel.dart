import 'package:flutter/material.dart';

class VendorModel {
  final String? id;
  final String? vendorName;
  final String? businessNumber;
  final String? email;
  final String? phoneNo;
  final String? password;
  final String? address;
  final String? vendorCategory;
  final String? primaryContactFirstName;
  final String? primaryContactLastName;
  final String? primaryContactEmail;
  final String? primaryContactPhoneNumber;
  //class with offerings
  //class redeem products

  VendorModel({
    this.id,
    required this.vendorName,
    required this.businessNumber,
    required this.email,
    required this.phoneNo,
    required this.password,
    required this.address,
    required this.vendorCategory,
    required this.primaryContactFirstName,
    required this.primaryContactLastName,
    required this.primaryContactEmail,
    required this.primaryContactPhoneNumber,
  });

  toJson() {
    return {
      'vendorName': vendorName,
      'businessNumber': businessNumber,
      'email': email,
      'phoneNo': phoneNo,
      'password': password,
      'address': address,
      "vendorCategory": vendorCategory,
      'primaryContactFirstName': primaryContactFirstName,
      'primaryContactLastName': primaryContactLastName,
      'primaryContactEmail': primaryContactEmail,
      'primaryContactPhoneNumber': primaryContactPhoneNumber,
    };
  }
}
