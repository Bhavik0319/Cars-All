import 'package:cars_and_alll/app/controller/auth_controller.dart';
import 'package:cars_and_alll/app/screens/car_details/controller/carDetailController.dart';
import 'package:get/get.dart';

class CarDetailsBinding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => CarDetailController(), fenix: false);
  }

}