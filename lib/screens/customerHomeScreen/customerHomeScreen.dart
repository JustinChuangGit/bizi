import 'package:bizi/utilities/authentication/authenticationRepository.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class customerHomeScreen extends StatelessWidget {
  customerHomeScreen({Key? key}) : super(key: key);
////////////////////////////////////////////////////////////////////////////////////////////////Delete this after
  final _auth = FirebaseAuth.instance;

  String getInfo() {
    String? temp = _auth.currentUser!.email;

    if (temp != null) {
      return temp;
    } else {
      return "No One Signed in";
    }
  }

////////////////////////////////////////////////////////////////4
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              authenticationRepository.instance.logout();
            },
            child: const Text("Sign Out"),
          ),
        ),
        Text(getInfo())
      ],
    );
  }
}
