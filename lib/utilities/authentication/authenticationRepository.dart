import 'package:bizi/screens/customerHomeScreen/customerHomeScreen.dart';
import 'package:bizi/screens/signInScreen/components/loginController.dart';
import 'package:bizi/screens/signInScreen/signInScreen.dart';
import 'package:bizi/screens/signUpScreen/components/signUpController.dart';
import 'package:bizi/screens/signUpScreen/signUpScreen.dart';
import 'package:bizi/utilities/authentication/exceptions/signUpEmailPasswordFailure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class authenticationRepository extends GetxController {
  static authenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth
        .userChanges()); //listens for user action ie signout and informs firebase user

    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const signInScreen())
        : Get.offAll(() => customerHomeScreen());
  } //Checks to see if user is already signed in

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    // try {
    //   await _auth.createUserWithEmailAndPassword(
    //       email: email, password: password);
    //   firebaseUser.value != null
    //       ? Get.offAll(() => customerHomeScreen())
    //       : Get.to(() => const signInScreen());
    // } on FirebaseAuthException catch (e) {
    //   final ex = signUpWithEmailAndPasswordFailure.code(e.code);
    //   print('FIREBASE AUTH EXCEPTION - ${ex.message}');
    //   throw ex;
    // } catch (_) {
    //   const ex = signUpWithEmailAndPasswordFailure();
    //   print('FIREBASE AUTH EXCEPTION - ${ex.message}');
    //   throw ex;
    // }
  }

  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    // try {
    //   UserCredential userCredential = await FirebaseAuth.instance
    //       .signInWithEmailAndPassword(email: email, password: password);
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'user-not-found') {
    //     print('No user found for that email.');
    //   } else if (e.code == 'wrong-password') {
    //     print('Wrong password provided for that user.');
    //   }
    // }

    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => customerHomeScreen())
          : Get.to(() => const signInScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (_) {}
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
