import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cars_and_alll/app/utils/customSnackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api/api_client.dart';
import '../../../services/user.dart';

class ProfileController extends GetxController with GetSingleTickerProviderStateMixin{

  RxInt totalListedVehicle = 0.obs;
  RxInt vehicleSold = 0.obs;
  RxInt totalViews = 0.obs;
  RxDouble averageRating = 0.0.obs;

  RxBool shareMyNumber = false.obs;

  RxInt currentIndex = 0.obs;

  late TabController tabController;


  RxString subjectTopic = "".obs;
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController message = TextEditingController();


  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);

    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        currentIndex.value = tabController.index;
        log("Selected Tab: ${tabController.index}");
      }
    });
    performanceOverview();
  }

  performanceOverview() {
    ApiClient.to.performanceOverview(
      onSuccess: (res) {
        totalListedVehicle.value = res.body["data"]["totalListedVehicle"];
        vehicleSold.value = res.body["data"]["vehicleSold"];
        totalViews.value = res.body["data"]["totalViews"];
        averageRating.value = res.body["data"]["averageRating"];
      },
      onError: (res) {
        // customSnackBar(
        //   type: AnimatedSnackBarType.error,
        //   message: 'Failed to fetch performance overview due to: ${res.body}',
        // );
      }
    );
  }

  void updateProfile(Map<String, bool> map) {
    ApiClient.to.updateProfile(
      body: map,
      onSuccess: (res){
        UserStore.to.saveProfile(res.body["data"]);
        customSnackBar(
          type: AnimatedSnackBarType.success,
          message: 'Profile updated successfully',
        );
      },
      onError: (res){
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: 'Failed to update profile due to: ${res.body}',
        );
      },
    );
  }

  contactSupport(){
    ApiClient.to.postContactSupport(
      body: {
        "contactCategory": subjectTopic.value,
        "contactName": name.text,
        "contactEmail": email.text,
        "contactPhone": phone.text,
        "comment": message.text,
      },
      onSuccess: (res){
        customSnackBar(
          type: AnimatedSnackBarType.success,
          message: 'Support raised successfully',
        );
        Get.back();
      },
      onError: (res) {
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: 'Failed to update profile due to: ${res.body['message']}',
        );
      }
    );
  }

}