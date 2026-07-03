import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cars_and_alll/app/data/api/api_client.dart';
import 'package:cars_and_alll/app/models/vehicle_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/customSnackBar.dart';

class SearchController extends GetxController{

  TextEditingController searchField = TextEditingController();
  RxList<VehicleModel> searchedVehicles = <VehicleModel>[].obs;
  RxList<String> recentSearch = [
    'McLaren',
    'Mustang',
    'Bugatti',
    'Lamborgini',
    'Porsche',
    'BMW',
  ].obs;

  RxBool isSearched = false.obs;
  RxBool isLoading = false.obs;

  Future<void> search() async {
    isSearched.value = true;
    isLoading.value = true;
    searchedVehicles.clear();
    recentSearch.insert(0, searchField.text);
    ApiClient.to.searchVehicle(
      filter: {
        "keyword": searchField.text,
        "sort": "latest"
      },
      onSuccess: (res){
        for(var element in res.body["data"]){
          VehicleModel vehicle = VehicleModel.fromJson(element);
          searchedVehicles.add(vehicle);
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

  void removeRecentItem(int index) {
    recentSearch.removeAt(index);
  }

}