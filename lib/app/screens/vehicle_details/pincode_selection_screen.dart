import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cars_and_alll/app/models/pincode_model.dart';
import 'package:cars_and_alll/app/screens/vehicle_details/controller/postNewAddController.dart';
import 'package:cars_and_alll/app/utils/customSnackBar.dart';
import 'package:cars_and_alll/app/utils/scale_utility.dart';
import 'package:cars_and_alll/app/widgets/decoratedContainer.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../shared/theme/custom_text_style.dart';
import '../../constants/assetConstant.dart';
import '../../routes/app_routes.dart';
import 'controller/pincodeController.dart';

class PinCodeSelectionScreen extends GetView<PostNewAddController> {
  const PinCodeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Container(
          margin: scale.getMargin(
            horizontal: 20,
            vertical: 5,
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
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(1162),
                      ),
                      child: TextFormField(
                        autofocus: true,
                        controller: controller.pinCode,
                        decoration: InputDecoration(
                          isDense: true,
                          labelStyle: TextStyle(fontWeight: FontWeight.w600),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintStyle: CustomTextStyle.txtPoppins12White300.copyWith(
                            color: Color(0xff9095A0),
                            fontSize: scale.getScaledFont(12),
                            fontWeight: FontWeight.w500,
                          ),
                          focusColor: AppColors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: AppColors.backgroundColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: AppColors.backgroundColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: AppColors.backgroundColor),
                          ),
                          contentPadding: EdgeInsets.zero,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset(
                              AssetConstant.searchBarIcon,
                              height: 2,
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.pinCode.clear();
                            },
                            icon: Icon(Icons.close,
                              size: scale.getScaledFont(15),
                            ),
                          ),
                          hintText: tr('enter_pincode'),
                        ),
                        onChanged: (val) {
                          if(val == ""){
                            controller.pinCode.clear();
                          }
                        },
                        onFieldSubmitted: (value) {
                          controller.getPinCode();
                        },
                        style: CustomTextStyle.txtPoppins12White300.copyWith(
                          color: AppColors.black,
                          fontSize: scale.getScaledFont(12),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: scale.getScaledWidth(15),
                  ),
                  Container(
                    margin: scale.getMargin(
                      bottom: 20,
                      top: 20,
                    ),
                    width: scale.getScaledWidth(70),
                    height: scale.getScaledHeight(40),
                    child: ElevatedButton(
                      onPressed: () {
                        controller.getPinCode();
                      },
                      child: Text(
                        tr('search'),
                        style: CustomTextStyle.txtPoppins16Black500.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                          fontSize: scale.getScaledFont(16),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: scale.getScaledHeight(10),
              ),
              Expanded(
                child: Obx(
                  () {
                    return ListView.builder(
                      itemBuilder: (context, index){
                        return DecoratedContainer(
                          margin: scale.getMargin(
                            vertical: 3
                          ),
                          padding: scale.getPadding(
                            vertical: 10,
                            horizontal: 10
                          ),
                          child: Row(
                            children: [
                              Obx(
                                () => Radio<PincodeModel>(
                                  value: controller.pinCodeList[index],
                                  groupValue: controller.selectedPinCode.value,
                                  splashRadius: 1,
                                  fillColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
                                    if (states.contains(MaterialState.selected)) {
                                      return AppColors.secondaryLight;
                                    }
                                    return Colors.grey.shade600;
                                  }),
                                  hoverColor: AppColors.black,
                                  onChanged: (value) {
                                    controller.selectedPinCode.value = value!;
                                  },
                                  toggleable: true,
                                ),
                              ),
                              SizedBox(
                                width: scale.getScaledWidth(10),
                              ),
                              Text(
                                '${controller.pinCodeList.value[index].name}, ${controller.pinCodeList.value[index].division}\n${controller.pinCodeList.value[index].district} - ${controller.pinCode.text}',
                                style: CustomTextStyle.txtPoppins14Black700.copyWith(
                                  fontSize: scale.getScaledFont(12),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: controller.pinCodeList.value.length,
                    );
                  }
                ),
              ),
              SizedBox(
                height: scale.getScaledHeight(20),
              ),
              SizedBox(
                width: scale.fw,
                height: scale.getScaledHeight(40),
                child: ElevatedButton(
                  onPressed: () {
                    if(controller.selectedPinCode.value.name != null){
                      Get.toNamed(
                        AppRoutes.uploadVehicleImage,
                      );
                    } else {
                      customSnackBar(
                        type: AnimatedSnackBarType.error,
                        message: 'Please select a pincode',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
