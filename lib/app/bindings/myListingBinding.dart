import 'package:cars_and_alll/app/controller/MyListingController.dart';
import 'package:get/get.dart';

class MyListingBinding implements Bindings{

  @override
  void dependencies() {
    if(!Get.isPrepared<MyListingController>()){
      Get.put(MyListingController());
    }
  }

}