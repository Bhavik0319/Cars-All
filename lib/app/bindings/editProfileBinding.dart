import 'package:cars_and_alll/app/controller/auth_controller.dart';
import 'package:get/get.dart';

import '../screens/profile/controller/editProfileController.dart';

class EditProfileBinding implements Bindings{

  @override
  void dependencies() {
    if(!Get.isPrepared<EditProfileController>()) {
      Get.put(EditProfileController());
    }
  }

}