import 'package:cars_and_alll/app/controller/auth_controller.dart';
import 'package:cars_and_alll/app/screens/vehicle_details/controller/postNewAddController.dart';
import 'package:get/get.dart';

class PostNewAddBinding implements Bindings{

  @override
  void dependencies() {
    if(!Get.isPrepared<PostNewAddController>()) {
      Get.put(PostNewAddController());
    }
  }

}