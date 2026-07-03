import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cars_and_alll/app/models/reelsModel.dart';
import 'package:get/get.dart';

import '../../../data/api/api_client.dart';
import '../../../models/vehicle_model.dart';
import '../../../utils/customSnackBar.dart';

class RecentlyViewController extends GetxController{
  RxBool isLoading = true.obs;
  RxList<VehicleModel> vehicles = <VehicleModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllRecentlyViewed();
  }

  getAllRecentlyViewed() {
    ApiClient.to.getRecentViewVehicle(
      onSuccess: (res){
        for(var element in res.body["data"]){
          VehicleModel vehicle = VehicleModel.fromJson(element);
          vehicles.add(vehicle);
        }
        isLoading.value = false;
      },
      onError: (res) {
        isLoading.value = false;
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: res.body["message"],
        );
      },
    );
  }
}