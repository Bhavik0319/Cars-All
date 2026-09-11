
import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cars_and_alll/app/models/vehicle_model.dart';
import 'package:cars_and_alll/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/api/api_client.dart';
import '../models/user_model.dart';
import '../utils/customSnackBar.dart';
import '../widgets/markAsSoldPopup.dart';

class MyListingController extends GetxController{

  RxBool isLoading = true.obs;
  RxList<VehicleModel> getAllListingActive = <VehicleModel>[].obs;
  RxList<VehicleModel> getAllListingSold = <VehicleModel>[].obs;


  List<UserModel> allUsers = <UserModel>[];
  UserModel currentSelection = UserModel();
  TextEditingController currentUser = TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();
    isLoading.value = true;
    await getAllListingByUser();
  }

  Future<void> getAllListingByUser() async {
    getAllListingActive.clear();
    getAllListingSold.clear();
    await ApiClient.to.getAllListingByUser(
      onSuccess: (res) {
        for(var vehicle in res.body['vehicles']){
          if(vehicle['vehicleStatus'] == 'ACTIVE') {
            getAllListingActive.add(VehicleModel.fromJson(vehicle));
          }else{
            getAllListingSold.add(VehicleModel.fromJson(vehicle));
          }
        }
        isLoading.value = false;
      },
      onError: (res) {
        isLoading.value = false;
        if(res.body['message'].toString().startsWith("Invalid Authentication")){
          Get.toNamed(AppRoutes.loginWithPhone);
        }else {
          customSnackBar(
            type: AnimatedSnackBarType.error,
            message: res.body["message"],
          );
        }
      },
    );
  }


  getAllUsers() async {
    allUsers.clear();
    await ApiClient.to.getAllUsers(
      onSuccess: (res) {
        for(var user in res.body["data"]){
          allUsers.add(UserModel.fromJson(user));
        }
      },
      onError: (res) {
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: res.body["message"],
        );
      },
    );
  }

  Future<void> showSoldPopup(vehicleId) async {
    await getAllUsers();
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return MarkAsSoldPopup(
          controller: this,
          vehicleId: vehicleId,
        );
      },
    );
  }

  markAsSold(vehicleId, userId) async {
    await ApiClient.to.addRating(
      body: {
        "userId": userId,
        "vehicleId": vehicleId,
      },
      onSuccess: (res) {
        updateVehicleStatus(vehicleId);
        Get.back();
      },
      onError: (res) {
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: res.body["message"],
        );
      },
    );
  }

  updateVehicleStatus(vehicleId) async {
    ApiClient.to.updateVehicleStatus(
      vehicleId: vehicleId,
      body: {"vehicleStatus":"SOLD"},
      onSuccess: (res) {
        onInit();
        customSnackBar(
          type: AnimatedSnackBarType.success,
          message: res.body["message"],
        );
      },
      onError: (res) {
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: res.body["message"],
        );
      },
    );
  }

  deleteVehicleStatus(vehicleId) async {
    ApiClient.to.updateVehicleStatus(
      vehicleId: vehicleId,
      body: {"vehicleStatus":"DELETED"},
      onSuccess: (res) {
        onInit();
        customSnackBar(
          type: AnimatedSnackBarType.success,
          message: res.body["message"],
        );
      },
      onError: (res) {
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: res.body["message"],
        );
      },
    );
  }
}