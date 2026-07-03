import 'package:cars_and_alll/app/controller/auth_controller.dart';
import 'package:cars_and_alll/app/screens/home/controllers/reels_controller.dart';
import 'package:get/get.dart';

class ReelsBinding implements Bindings{

  @override
  void dependencies() {
    if(!Get.isPrepared<ReelsController>()) {
      Get.put(ReelsController());
    }
  }

}