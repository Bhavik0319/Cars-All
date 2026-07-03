import 'package:cars_and_alll/app/controller/auth_controller.dart';
import 'package:cars_and_alll/app/screens/search/controller/search_controller.dart';
import 'package:get/get.dart';

class SearchBinding implements Bindings{

  @override
  void dependencies() {
    if(!Get.isPrepared<SearchController>()) {
      Get.put(SearchController());
    } else {
      Get.find<SearchController>().onInit();
    }
  }
}