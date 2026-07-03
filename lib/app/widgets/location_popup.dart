import 'dart:async';

import 'package:cars_and_alll/app/extensions/spacing_extension.dart';
import 'package:cars_and_alll/app/routes/app_routes.dart';
import 'package:cars_and_alll/app/screens/home/controllers/home_controller.dart';
import 'package:cars_and_alll/app/services/user.dart';
import 'package:cars_and_alll/shared/theme/custom_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

import '../../shared/color/app_color.dart';
import '../constants/assetConstant.dart';
import '../models/pincode_model.dart';
import '../utils/scale_utility.dart';
import 'decoratedContainer.dart';

class LocationPopup extends GetView<HomeController> {
  const LocationPopup({super.key});

  @override
  Widget build(BuildContext context) {

    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();
    Timer? _debounce;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.only(
            bottom: 10,
            left: 10,
            right: 10
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            10.space,
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 20
              ),
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryLight,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      minimumSize: Size(double.infinity, 65),
                    ),
                    onPressed: () async{
                      controller.getCurrentLocation();
                    },
                    child: Text(
                      tr("Use Current Location"),
                      style: CustomTextStyle.txtPoppins16Black500.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(10),
                  ),
                  Text(
                    tr("Or"),
                    style: CustomTextStyle.txtPoppins16Black500.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: scale.getScaledFont(14),
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(10),
                  ),
                  TextFormField(
                    controller: controller.pinCode,
                    decoration: InputDecoration(
                      hintText: tr("Enter your Pincode"),
                      hintStyle: CustomTextStyle.txtPoppins14Black700.copyWith(
                        fontSize: scale.getScaledFont(12),
                      ),
                    ),
                    onChanged: (pattern) {
                      if (_debounce?.isActive ?? false) _debounce!.cancel();
                      _debounce = Timer(const Duration(milliseconds: 500), () {
                        if (pattern.isNotEmpty) {
                          controller.getPinCode();
                        }
                      });
                    },
                    style: CustomTextStyle.txtPoppins14Black700,
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(20),
                  ),
                  Obx(
                    () {
                      return controller.pinCodeList.value.isNotEmpty ? Text(
                        tr("Searched Pincode"),
                        style: CustomTextStyle.txtPoppins16Black500.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: scale.getScaledFont(14),
                        ),
                      ) : Container();
                    }
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(10),
                  ),
                  Obx(() {
                        return controller.pinCodeList.value.isNotEmpty ? SizedBox(
                          height: scale.getScaledHeight(200),
                          child: ListView.builder(
                            itemBuilder: (context, index){
                              return GestureDetector(
                                onTap: () {
                                  controller.setUserLocation(index);
                                },
                                child: DecoratedContainer(
                                  margin: scale.getMargin(
                                      vertical: 3
                                  ),
                                  padding: scale.getPadding(
                                      vertical: 10,
                                      horizontal: 10
                                  ),
                                  child: SizedBox(
                                    width: scale.getScaledWidth(250),
                                    child: Text(
                                      '${controller.pinCodeList.value[index].name}, ${controller.pinCodeList.value[index].division}\n${controller.pinCodeList.value[index].district} - ${controller.pinCode.text}',
                                      style: CustomTextStyle.txtPoppins14Black700.copyWith(
                                        fontSize: scale.getScaledFont(12),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: controller.pinCodeList.value.length,
                          ),
                        ) : Container();
                      }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
