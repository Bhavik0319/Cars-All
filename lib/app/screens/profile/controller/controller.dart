import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cars_and_alll/app/services/storage.dart';
import 'package:cars_and_alll/app/utils/customSnackBar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../data/api/api_client.dart';
import '../../../services/user.dart';

class ProfileController extends GetxController with GetSingleTickerProviderStateMixin{

  RxInt totalListedVehicle = 0.obs;
  RxInt vehicleSold = 0.obs;
  RxInt totalViews = 0.obs;
  RxDouble averageRating = 0.0.obs;

  RxBool shareMyNumber = false.obs;
  RxBool isSwitched = false.obs;

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
    checkNotificationPermission();
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

  Future<void> checkNotificationPermission() async {
    // 1. Check current status
    // PermissionStatus status = await Permission.notification.status;
    // log("Current status: $status");
    //
    // if(isSwitched.value){
    //   isSwitched.value = false;
    // } else {
    //   if (status.isGranted) {
    //     log("Permission already granted");
    //     isSwitched.value = true;
    //   } else if (status.isDenied) {
    //     log("Permission is denied. Requesting now...");
    //
    //     // 2. This actually prompts the user OS dialog
    //     PermissionStatus newStatus = await Permission.notification.request();
    //
    //     if (newStatus.isGranted) {
    //       log("Permission granted by user");
    //       isSwitched.value = true;
    //     } else {
    //       log("Permission denied by user");
    //       isSwitched.value = false;
    //     }
    //   } else if (status.isPermanentlyDenied) {
    //     log("Permission permanently denied. Opening settings...");
    //     isSwitched.value = false;
    //     await openAppSettings();
    //   }
    // }
    if (isSwitched.value) {
      isSwitched.value = false;
      // Note: iOS has no API to revoke permission from app-side; this just
      // stops your app from acting on notifications (unsubscribe from topics, etc.)
      return;
    }

    final settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional) {
      isSwitched.value = true;
    } else {
      isSwitched.value = false;
      if (settings.authorizationStatus == AuthorizationStatus.denied) {
        // Already decided before — iOS won't re-prompt, send to Settings
        await openAppSettings();
      }
    }
  }

}