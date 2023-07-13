// Required for getting access to basic Flutter widgets

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// QR Flutter package
import 'package:qr_flutter/qr_flutter.dart';

class QRCode extends StatefulWidget {
  QRCode({
    Key? key,
    this.width,
    this.height,
    this.qrSize,
    this.gapLess,
    this.qrVersion,
    this.qrPadding,
    this.qrBorderRadius,
    this.semanticsLabel,
    this.qrBackgroundColor,
    this.qrForegroundColor,
  }) : super(key: key);

  // Required by FF (NOT USED IN WIDGET)
  final double? width;
  final double? height;
  // The (square) size of the image
  final double? qrSize;
  // Text data to the encoded
  // Adds an extra pixel in size to prevent gaps (default is true).
  final bool? gapLess;
  // `QrVersions.auto` or a value between 1 and 40.
  // See http://www.qrcode.com/en/about/version.html for limitations and details.
  final int? qrVersion;
  // Padding on all sides
  final double? qrPadding;
  // Circular border radius beside the QR code
  final double? qrBorderRadius;
  // Will be used by screen readers to describe the content of the QR code.
  final String? semanticsLabel;
  // 	The background color (default is transparent).
  final Color? qrBackgroundColor;
  //	The foreground color (default is black).
  final Color? qrForegroundColor;

  @override
  State<QRCode> createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCode> {
  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(UserProfileController());
    // late Future<UserModel>? _userData = controller.getUserData();
    //print(_userData.toString());

    // CollectionReference _userData =
    //     FirebaseFirestore.instance.collection('users');

    final String _uid = FirebaseAuth.instance.currentUser!.uid.toString();

    return ClipRRect(
        borderRadius: BorderRadius.circular(widget.qrBorderRadius ?? 0),
        child: QrImageView(
          size: widget.qrSize,
          data: _uid,
          gapless: widget.gapLess ?? true,
          version: widget.qrVersion ?? QrVersions.auto,
          padding: EdgeInsets.all(widget.qrPadding ?? 10),
          semanticsLabel: widget.semanticsLabel ?? '',
          backgroundColor: widget.qrBackgroundColor ?? Colors.transparent,
        ));

    // FutureBuilder<DocumentSnapshot>(
    //     future: _userData.doc(FirebaseAuth.instance.currentUser?.uid).get(),
    //     builder:
    //         (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
    //       if (snapshot.hasError) {
    //         return const Text('Error');
    //       }

    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return JumpingDots(
    //           color: Colors.white,
    //           radius: 8,
    //         );
    //       }
    //       //print(_userData.doc().get());

    //       // UserModel userData = snapshot.data!.data() as UserModel;
    //       // Map<String, dynamic> userData =
    //       //     snapshot.data!.data() as Map<String, dynamic>;
    //       //  print(userData);

    //       return ClipRRect(
    //         borderRadius: BorderRadius.circular(widget.qrBorderRadius ?? 0),
    //         child: QrImageView(
    //           size: widget.qrSize,
    //           data: FirebaseAuth.instance.currentUser!.uid.toString(),
    //           gapless: widget.gapLess ?? true,
    //           version: widget.qrVersion ?? QrVersions.auto,
    //           padding: EdgeInsets.all(widget.qrPadding ?? 10),
    //           semanticsLabel: widget.semanticsLabel ?? '',
    //           backgroundColor: widget.qrBackgroundColor ?? Colors.transparent,
    //         ),
    //       );
    //     });
  }
}
