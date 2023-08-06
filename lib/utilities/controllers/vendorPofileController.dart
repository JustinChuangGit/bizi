import 'package:bizi/utilities/authentication/authenticationRepository.dart';
import 'package:bizi/utilities/methods/errorSnackBar.dart';
import 'package:bizi/utilities/repository/userRepository.dart';
import 'package:bizi/utilities/repository/vendorRepository.dart';
import 'package:get/get.dart';

class VendorProfileController extends GetxController {
  static VendorProfileController get instance => Get.find();

  //In order to get the email of currently logged in user can get info from authRepo
  final _authRepo = Get.put(authenticationRepository());

  //To fetch data associated with user model
  final _vendorRepo = Get.put(VendorRepository());

  getVendorData() {
    return _vendorRepo.getVendorInfo();
  }
}
