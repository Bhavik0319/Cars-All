import 'package:cars_and_alll/app/controller/auth_controller.dart';
import 'package:cars_and_alll/app/screens/home/controllers/category_controller.dart';
import 'package:get/get.dart';

class CategoryBinding implements Bindings{

  @override
  void dependencies() {
    if(!Get.isPrepared<CategoryController>()) {
      Get.put(CategoryController());
    } else {
      Get.find<CategoryController>().onInit();
    }
  }

}