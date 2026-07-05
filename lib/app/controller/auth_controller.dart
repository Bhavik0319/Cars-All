import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cars_and_alll/app/constants/text_data.dart';
import 'package:cars_and_alll/app/controller/home_nav_controller.dart';
import 'package:cars_and_alll/app/data/api/api_client.dart';
import 'package:cars_and_alll/app/routes/app_routes.dart';
import 'package:cars_and_alll/app/screens/home/controllers/home_controller.dart';
import 'package:cars_and_alll/app/services/storage.dart';
import 'package:cars_and_alll/app/services/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../interfaces/auth_interface.dart';
import '../models/enum/user_type.dart';
import '../screens/auth/OtpDialog.dart';
import '../utils/customSnackBar.dart';

class AuthController extends GetxController {

  Rx<UserType> userType = UserType.INDIVIDUAL.obs;
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();

  ///Login Variables
  String verId = "";
  RxBool agreeToTermsLoginPage = false.obs;
  var showCheckboxError = false.obs;
  var showCheckboxErrorRegister = false.obs;

  ///Register Variables

  RxBool obscurePassword = true.obs;
  RxBool obscureConfirmPassword = true.obs;
  RxBool agreeToTermsRegisterPage = false.obs;
  RxBool showPhoneNumber = false.obs;

  var emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");


  void updateUserSelection(UserType userSelection){
    userType.value = userSelection;
    log("updating the value $userType");
  }

  loginUserByPhone() async {
    await ApiClient.to.otpSendToPhone(
      {"userPhone": phone.text},
      onSuccess: (res) {
        verId = res.body["otp"];
        customSnackBar(
          type: AnimatedSnackBarType.success,
          message: res.body["message"],
        );
        showDialog(
          context: Get.context!,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return PopScope(
              canPop: false,
              child: OtpVerificationDialog(
                onVerify: (otp) async {
                  await ApiClient.to.loginWithPhone(
                    {
                      "ver_id": verId,
                      "otp_code": otp,
                      "userPhone": phone.text,
                    },
                    onSuccess: (res) async {
                      customSnackBar(
                        type: AnimatedSnackBarType.success,
                        message: res.body["message"],
                      );
                      StorageService.to.setString(ConstantData.userBearerToken, res.body["token"]);
                      log("token is ${StorageService.to.getString(ConstantData.userBearerToken)}");
                      // log('${res.body["data"]}');
                      await ApiClient.to.getProfile(
                          onSuccess: (res){
                            UserStore.to.saveProfile(res.body["data"]);
                          },
                          onError: (res){

                          }
                      );
                      UserStore.to.saveProfile(res.body["data"]);
                      log("user is ${UserStore.to.profile}");
                      if(Get.isRegistered<BottomNavController>()){
                        Get.find<BottomNavController>().getUnseenChat();
                      }
                      Get.offAllNamed(AppRoutes.homeNav);
                    },
                    onError: (res) {
                      customSnackBar(
                        type: AnimatedSnackBarType.error,
                        message: res.body["message"],
                      );
                    },
                  );
                },
              ),
            );
          },
        );
      },
      onError: (res){
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: res.body["message"],
        );
      },
    );
  }


  Future<void> registerUser() async {
    if(!agreeToTermsRegisterPage.value){
      customSnackBar(
        type: AnimatedSnackBarType.error,
        message: 'Please agree to the terms and conditions',
      );
    } else if(phone.text.length != 10 || int.tryParse(phone.text) == null){
      customSnackBar(
        type: AnimatedSnackBarType.error,
        message: 'Invalid phone number',
      );
    } else if(!emailRegex.hasMatch(email.text)){
      customSnackBar(
        type: AnimatedSnackBarType.error,
        message: 'Please enter a valid email',
      );
    } else if(name.text.isEmpty){
      customSnackBar(
        type: AnimatedSnackBarType.error,
        message: 'Please enter a name',
      );
    } else {
      await ApiClient.to.otpSendToPhone(
        {"userPhone": phone.text},
        onSuccess: (res) {
          verId = res.body["otp"];
          customSnackBar(
            type: AnimatedSnackBarType.success,
            message: res.body["message"],
          );
          showDialog(
            context: Get.context!,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return PopScope(
                canPop: false,
                child: OtpVerificationDialog(
                  onVerify: (otp) async {
                    await ApiClient.to.verifyOtpPhone(
                      {
                        "ver_id": verId,
                        "otp_code": otp,
                        "userPhone": phone.text,
                      },
                      onSuccess: (res) {
                        customSnackBar(
                          type: AnimatedSnackBarType.success,
                          message: res.body["message"],
                        );
                        ApiClient.to.registerUser(
                          {
                            "userName": name.text,
                            "userEmail": email.text,
                            "userPhone": phone.text,
                            "userType": userTypeFromEnum(userType.value),
                          },
                          onSuccess: (res) {
                            customSnackBar(
                              type: AnimatedSnackBarType.success,
                              message: res.body["message"],
                            );
                            Get.offAllNamed(AppRoutes.loginWithPhone);
                          },
                          onError: (res) {
                            customSnackBar(
                              type: AnimatedSnackBarType.error,
                              message: res.body["message"],
                            );
                            Get.back();
                          },
                        );
                      },
                      onError: (res) {
                        customSnackBar(
                          type: AnimatedSnackBarType.error,
                          message: res.body["message"],
                        );
                      },
                    );
                  },
                ),
              );
            },
          );
        },
        onError: (res){
          customSnackBar(
            type: AnimatedSnackBarType.error,
            message: res.body["message"],
          );
        },
      );
    }
  }

}
