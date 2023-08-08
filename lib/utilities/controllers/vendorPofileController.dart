import 'package:bizi/utilities/repository/vendorRepository.dart';
import 'package:get/get.dart';

class VendorProfileController extends GetxController {
  static VendorProfileController get instance => Get.find();

  //To fetch data associated with user model
  final _vendorRepo = Get.put(VendorRepository());

  getVendorData() {
    return _vendorRepo.getVendorInfo();
  }
}
