import 'package:cars_and_alll/app/controller/auth_controller.dart';
import 'package:cars_and_alll/app/screens/profile/controller/ratedSellerController.dart';
import 'package:get/get.dart';

class RatedSellerBinding implements Bindings{

  @override
  void dependencies() {
    if(!Get.isPrepared<RatedSellerController>()) {
      Get.put(RatedSellerController());
    }
  }

}