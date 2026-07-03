import 'package:cars_and_alll/app/controller/auth_controller.dart';
import 'package:cars_and_alll/app/screens/profile/controller/savedVehicleController.dart';
import 'package:get/get.dart';

import '../screens/profile/controller/recentlyViewController.dart';

class SavedVehicleBinding implements Bindings{

  @override
  void dependencies() {
    if(!Get.isPrepared<SavedVehicleController>()) {
      Get.put(SavedVehicleController());
    }
  }

}