import 'package:bizi/utilities/authentication/authenticationRepository.dart';
import 'package:bizi/utilities/methods/errorSnackBar.dart';
import 'package:bizi/utilities/repository/userRepository.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController {
  static UserProfileController get instance => Get.find();

  //In order to get the email of currently logged in user can get info from authRepo
  final _authRepo = Get.put(authenticationRepository());

  //To fetch data associated with user model
  final _userRepo = Get.put(UserRepository());

  getUserData() {
    final email = _authRepo
        .firebaseUser.value?.email; //Fetches the current logged in email
    if (email != null) {
      _userRepo.getUserDetails(email);
    } else {
      errorSnackBar(errorMessage: 'Please login to continue');
    }
  }
}
