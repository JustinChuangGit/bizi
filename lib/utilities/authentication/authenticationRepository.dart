import 'package:bizi/screens/customerHomeScreen/customerHomeScreen.dart';
import 'package:bizi/screens/signInScreen/signInScreen.dart';
import 'package:bizi/screens/signUpScreen/components/signUpController.dart';
import 'package:bizi/utilities/authentication/models/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      String email, String password, UserModel user) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      signUpController.instance
          .createUser(user); //Populate database with user Information
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.defaultDialog(
          title: 'Error:',
          middleText: 'The password provided is too weak.',
        );
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.defaultDialog(
          title: 'Error:',
          middleText: 'The account already exists for that email.',
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> loginUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      firebaseUser.value != null
          ? Get.offAll(() => customerHomeScreen())
          : Get.to(() => const signInScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.defaultDialog(
          title: 'Error:',
          middleText: 'No user found for that email.',
        );
      } else if (e.code == 'wrong-password') {
        Get.defaultDialog(
          title: 'Error:',
          middleText: 'Incorrect Password',
        );
        print('Wrong password provided for that user.');
      }
    } catch (_) {}
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
