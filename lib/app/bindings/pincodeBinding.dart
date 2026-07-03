import 'package:cars_and_alll/app/screens/vehicle_details/controller/pincodeController.dart';
import 'package:get/get.dart';

class PincodeBinding implements Bindings{

  @override
  void dependencies() {
    Get.put(PinCodeController());
  }

}