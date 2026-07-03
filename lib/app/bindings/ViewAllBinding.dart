import 'package:cars_and_alll/app/controller/auth_controller.dart';
import 'package:cars_and_alll/app/screens/filter/controller/filterController.dart';
import 'package:cars_and_alll/app/screens/home/controllers/category_controller.dart';
import 'package:cars_and_alll/app/screens/home/controllers/view_all_controller.dart';
import 'package:get/get.dart';

class ViewAllBinding implements Bindings{

  @override
  void dependencies() {
    if(Get.arguments["category"] != "luxury-vehicles"){
      if(!Get.isPrepared<FilterController>()){
        print("In filter controller");
        Get.put(FilterController(filterCategory: Get.arguments["category"]));
      }
    }
    if(!Get.isPrepared<ViewAllController>()) {
      Get.put(ViewAllController());
    }
  }

}