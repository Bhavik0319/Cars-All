import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cars_and_alll/app/routes/app_routes.dart';
import 'package:cars_and_alll/app/utils/customSnackBar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/color/app_color.dart';
import '../../../shared/theme/custom_text_style.dart';
import '../../utils/scale_utility.dart';
import 'controller/postNewAddController.dart';

class GetVehicleDetails extends GetView<PostNewAddController> {
  const GetVehicleDetails({super.key});

  @override
  Widget build(BuildContext context) {

    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Container(
          margin: scale.getMargin(
            horizontal: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: CircleAvatar(
                  backgroundColor: AppColors.white,
                  child: Icon(
                    Icons.arrow_back_outlined,
                  ),
                ),
              ),
              SizedBox(
                height: scale.getScaledHeight(10),
              ),
              Container(
                margin: scale.getMargin(
                  vertical: 5,
                ),
                child: Text(
                  tr('get_vehicle_details'),
                  style: CustomTextStyle.txtPoppins20W700.copyWith(
                    fontSize: scale.getScaledFont(22),
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
              ),
              Container(
                margin: scale.getMargin(
                  bottom: 20,
                ),
                child: Text(
                  tr('info_safe_encrypted'),
                  style: CustomTextStyle.txtPoppins14Black700.copyWith(
                    fontSize: scale.getScaledFont(13),
                    fontWeight: FontWeight.w400,
                    color: Color(0xff828282),
                  ),
                ),
              ),
              Text(
                tr('vehicle_number'),
                style: CustomTextStyle.txtPoppins12Black500.copyWith(
                  fontSize: scale.getScaledFont(12),
                  color: AppColors.black828282,
                ),
              ),
              SizedBox(
                height: scale.getScaledHeight(5),
              ),
              Padding(
                padding: scale.getPadding(horizontal: 3),
                child: TextFormField(
                  controller: controller.vehicleNumber,
                  style: CustomTextStyle.txtPoppins14Black700.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.black828282,
                  ),
                  decoration: InputDecoration(
                    hintText: tr('enter_vehicle_number'),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffBDBDBD),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffBDBDBD),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xffBDBDBD),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xffBDBDBD),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              Container(
                margin: scale.getMargin(
                  bottom: 20,
                  top: 20,
                ),
                width: scale.fw,
                height: scale.getScaledHeight(40),
                child: ElevatedButton(
                  onPressed: () {
                    if(controller.verifyVehicleNumber()){
                      controller.searchVehicleNumber();
                    } else {
                      customSnackBar(
                        type: AnimatedSnackBarType.error,
                        message: 'Please enter valid vehicle number',
                      );
                    }
                  },
                  child: Text(
                    tr('next'),
                    style: CustomTextStyle.txtPoppins16Black500.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                      fontSize: scale.getScaledFont(16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
