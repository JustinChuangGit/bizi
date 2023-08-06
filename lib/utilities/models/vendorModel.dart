import 'package:bizi/utilities/models/offerModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VendorModel {
  final String? id;
  final String? vendorName; //
  final String? businessNumber; //
  final String? email;
  final String? phoneNo;
  final String? password;
  final String? address; //
  final String? vendorCategory; //
  final String? primaryContactFirstName;
  final String? primaryContactLastName;
  final String? primaryContactEmail;
  final String? primaryContactPhoneNumber;
  List<OfferModel>? currentOffers;
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
    this.currentOffers,
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
      'currentOffers': currentOffers
    };
  }

  factory VendorModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return VendorModel(
      id: data?['id'],
      vendorName: data?['vendorName'],
      businessNumber: data?['businessNumber'],
      email: data?['email'],
      phoneNo: data?['phoneNo'],
      password: data?['password'],
      address: data?['address'],
      vendorCategory: data?['vendorCategory'],
      primaryContactFirstName: data?['primaryContactFirstName'],
      primaryContactLastName: data?['primaryContactLastName'],
      primaryContactEmail: data?['primaryContactEmail'],
      primaryContactPhoneNumber: data?['primaryContactPhoneNumber'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (vendorName != null) "vendorName": vendorName,
      if (businessNumber != null) "businessNumber": businessNumber,
      if (email != null) "email": email,
      if (phoneNo != null) "phoneNo": phoneNo,
      if (password != null) "password": password,
      if (address != null) "address": address,
      if (vendorCategory != null) "vendorCategory": vendorCategory,
      if (primaryContactFirstName != null)
        "primaryContactFirstName": primaryContactFirstName,
      if (primaryContactLastName != null)
        "primaryContactLastName": primaryContactLastName,
      if (primaryContactEmail != null)
        "primaryContactEmail": primaryContactEmail,
      if (primaryContactPhoneNumber != null)
        "primaryContactPhoneNumber": primaryContactPhoneNumber,
    };
  }

  factory VendorModel.fromJson(Map<String, dynamic> json) => VendorModel(
        id: json['id'],
        vendorName: json['vendorName'],
        businessNumber: json['businessNumber'],
        email: json['email'],
        phoneNo: json['phoneNo'],
        password: json['password'],
        address: json['address'],
        vendorCategory: json['vendorCategory'],
        primaryContactFirstName: json['primaryContactFirstName'],
        primaryContactLastName: json['primaryContactLastName'],
        primaryContactEmail: json['primaryContactEmail'],
        primaryContactPhoneNumber: json['primaryContactPhoneNumber'],
      );
}
