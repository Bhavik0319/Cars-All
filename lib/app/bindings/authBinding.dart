import 'package:cars_and_alll/app/controller/auth_controller.dart';
import 'package:get/get.dart';

class AuthBinding implements Bindings{

  @override
  void dependencies() {
    if(!Get.isPrepared<AuthController>()) {
      Get.put(AuthController());
    }
  }

}