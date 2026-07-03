import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cars_and_alll/app/data/api/api_client.dart';
import 'package:get/get.dart';

import '../../../models/vehicle_model.dart';
import '../../../models/wishlist_model.dart';
import '../../../utils/customSnackBar.dart';

class SavedVehicleController extends GetxController{

  RxBool isLoading = true.obs;
  RxList<WishlistModel> wishlistVehicle = <WishlistModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllSavedVehicles();
  }

  getAllSavedVehicles() {
    ApiClient.to.getWishlist(
      onSuccess: (res){
        for(var element in res.body["data"]){
          WishlistModel vehicle = WishlistModel.fromJson(element);
          wishlistVehicle.add(vehicle);
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