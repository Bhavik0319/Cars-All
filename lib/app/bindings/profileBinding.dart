import 'package:cars_and_alll/app/controller/auth_controller.dart';
import 'package:cars_and_alll/app/screens/profile/controller/controller.dart';
import 'package:get/get.dart';

class ProfileBinding implements Bindings{

  @override
  void dependencies() {
    if(!Get.isPrepared<ProfileController>()) {
      Get.put(ProfileController());
    }
  }

}