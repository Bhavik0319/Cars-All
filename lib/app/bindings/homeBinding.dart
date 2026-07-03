import 'package:cars_and_alll/app/controller/auth_controller.dart';
import 'package:cars_and_alll/app/controller/home_nav_controller.dart';
import 'package:get/get.dart';

import '../screens/home/controllers/home_controller.dart';

class HomeBinding implements Bindings{

  @override
  void dependencies() {

    if(!Get.isPrepared<BottomNavController>()) {
      Get.put(BottomNavController());
    }

    if(!Get.isPrepared<HomeController>()) {
      Get.put(HomeController());
    }
  }

}