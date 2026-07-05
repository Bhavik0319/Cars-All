import 'dart:async';
import 'dart:developer';

import 'package:cars_and_alll/app/routes/app_routes.dart';
import 'package:cars_and_alll/app/screens/filter/filterScreen.dart';
import 'package:cars_and_alll/app/screens/home/controllers/home_controller.dart';
import 'package:cars_and_alll/app/screens/home/controllers/view_all_controller.dart';
import 'package:cars_and_alll/app/screens/home/widgets/vehicle_tile.dart';
import 'package:cars_and_alll/app/widgets/decoratedContainer.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:cars_and_alll/shared/theme/custom_text_style.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/assetConstant.dart';
import '../../../models/vehicle_model.dart';
import '../../../utils/scale_utility.dart';

class ViewAllVehicles extends GetView<ViewAllController> {
  const ViewAllVehicles({super.key});

  @override
  Widget build(BuildContext context) {

    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();
    Timer? _debounce;

    return Obx(
      () {
        return Scaffold(
          backgroundColor: controller.isLux.value ? AppColors.black : (controller.selectedSubCategory.value == 'premium' || controller.selectedSubCategory.value == 'luxury') ? AppColors.black : AppColors.backgroundColor,
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  padding: scale.getPadding(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  margin: scale.getMargin(
                    bottom: 10
                  ),
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        color: AppColors.black828282
                      )
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () {
                          return controller.isLux.value ? Container() : GestureDetector(
                            onTap: () async {
                              controller.loadInitial();
                              var isApplied = await Get.bottomSheet(
                                FilterScreen(),
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                enableDrag: true,
                                isScrollControlled: true,
                                isDismissible: false,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.vertical(
                                      top: Radius.circular(6),
                                    )
                                ),
                              );
                              if(isApplied != null && isApplied){
                                controller.applyFilter();
                              }
                            },
                            child: SvgPicture.asset(
                              AssetConstant.filterIcon,
                              color: controller.isLux.value ? AppColors.secondaryLight : (controller.selectedSubCategory.value == 'premium' || controller.selectedSubCategory.value == 'luxury') ? AppColors.secondaryLight : AppColors.black,
                            ),
                          );
                        }
                      ),
                      Expanded(
                        child: Container(
                          margin: scale.getMargin(
                            horizontal: 10,
                          ),
                          padding: scale.getPadding(
                            left: 10,
                            top: 4
                          ),
                          height: scale.getScaledHeight(40),
                          decoration: BoxDecoration(
                            color: controller.isLux.value ? Colors.transparent : (controller.selectedSubCategory.value == 'premium' || controller.selectedSubCategory.value == 'luxury') ? Colors.transparent : AppColors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: controller.isLux.value ? AppColors.secondaryLight : (controller.selectedSubCategory.value == 'premium' || controller.selectedSubCategory.value == 'luxury') ? AppColors.secondaryLight : Colors.transparent,
                            )
                          ),
                          child: TextFormField(
                            autofocus: false,
                            controller: controller.searchController,
                            decoration: InputDecoration(
                              isDense: true,
                              // labelStyle: TextStyle(fontWeight: FontWeight.w600),
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              hintStyle: CustomTextStyle.txtPoppins12White300.copyWith(
                                color: controller.isLux.value ? AppColors.secondaryLight : (controller.selectedSubCategory.value == 'premium' || controller.selectedSubCategory.value == 'luxury') ? AppColors.secondaryLight : AppColors.black,
                                fontSize: scale.getScaledFont(12),
                                fontWeight: FontWeight.w500,
                              ),
                              focusColor: AppColors.secondaryLight,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: Colors.red,

                                ),
                              ),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              contentPadding: scale.getPadding(
                                top: 6,
                              ),
                              // suffixIcon: IconButton(
                              //   onPressed: () {
                              //     controller.searchController.clear();
                              //     controller.applyFilter();
                              //   },
                              //   icon: Icon(Icons.close,
                              //     size: scale.getScaledFont(15),
                              //   ),
                              // ),
                              hintText: 'Search your vehicle',
                            ),
                            onChanged: (val) {
                              if (_debounce?.isActive ?? false) _debounce!.cancel();

                              _debounce = Timer(const Duration(milliseconds: 500), () {
                                if (val.isNotEmpty) {
                                  controller.applyFilter();
                                }
                              });
                            },
                            onFieldSubmitted: (value) {
                              controller.applyFilter();
                            },
                            style: CustomTextStyle.txtPoppins12White300.copyWith(
                              color: controller.isLux.value ?  AppColors.secondaryLight : (controller.selectedSubCategory.value == 'premium' || controller.selectedSubCategory.value == 'luxury') ? AppColors.secondaryLight : AppColors.black,
                              fontSize: scale.getScaledFont(12),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Obx(() {
                            return SizedBox(
                              width: scale.getScaledWidth(80),
                              child: Text(
                                '${controller.vehicles.length} ${tr('results')}',
                                style: CustomTextStyle.txtPoppins16Black500.copyWith(
                                  color: controller.isLux.value ? AppColors.secondaryLight : (controller.selectedSubCategory.value == 'premium' || controller.selectedSubCategory.value == 'luxury') ? AppColors.secondaryLight : AppColors.black,
                                ),
                              ),
                            );
                          }
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: scale.getPadding(
                    left: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  height: scale.getScaledHeight(40),
                  child: Obx(
                    () {
                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.initialSubCategory.value.length,
                        itemBuilder: (context, index){
                          return GestureDetector(
                            onTap: () {
                              if(index == 0){
                                controller.selectedSubCategory.value = controller.initialSubCategory[index];
                              }else {
                                controller.selectedSubCategory.value = controller.initialSubCategory[index];
                              }
                              controller.applyFilter();
                            },
                            child: Obx(
                              () => DecoratedContainer(
                                fillColor: index == 0
                                    ? controller.selectedSubCategory.value == ""
                                      ? AppColors.secondaryLight
                                      : controller.selectedSubCategory.value == controller.initialSubCategory[index]
                                        ? AppColors.secondaryLight
                                        : AppColors.white
                                    : controller.selectedSubCategory.value == controller.initialSubCategory[index]
                                      ? AppColors.secondaryLight
                                      : AppColors.white,
                                padding: scale.getPadding(
                                  horizontal: 15,
                                ),
                                margin: scale.getMargin(
                                  horizontal: 5,
                                ),
                                image: (controller.initialSubCategory[index] == 'premium' || controller.initialSubCategory[index] == 'luxury') && (controller.selectedSubCategory.value != controller.initialSubCategory[index])
                                    ? "assets/logo/lux_bg.jpg"
                                    : null,
                                borderRadius: 6,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '${controller.initialSubCategory[index].capitalizeFirst}',
                                    style: CustomTextStyle.txtPoppins14Black700.copyWith(
                                      fontSize: scale.getScaledFont(12),
                                      color: index == 0
                                          ? controller.selectedSubCategory.value == ""
                                            ? AppColors.black
                                            : controller.selectedSubCategory.value == controller.initialSubCategory[index]
                                              ? AppColors.black
                                              : AppColors.secondaryLight
                                          : controller.selectedSubCategory.value == controller.initialSubCategory[index]
                                            ? AppColors.black
                                            : AppColors.secondaryLight,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  ),
                ),
                Container(
                  margin: scale.getMargin(
                    vertical: 10,
                    horizontal: 10
                  ),
                  child: Obx(
                    () {
                      return DropdownButtonFormField2<String>(
                        isDense: true,
                        value: 'latest',
                        style: CustomTextStyle.txtPoppins14Black700.copyWith(
                          fontSize: scale.getScaledFont(12),
                          fontWeight: FontWeight.w500,
                          color: controller.isLux.value ? AppColors.secondaryLight : (controller.selectedSubCategory.value == 'premium' || controller.selectedSubCategory.value == 'luxury') ? AppColors.secondaryLight : AppColors.black,
                        ),
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(
                              color: controller.isLux.value ? AppColors.secondaryLight : (controller.selectedSubCategory.value == 'premium' || controller.selectedSubCategory.value == 'luxury') ? AppColors.secondaryLight : Color(0xffBDBDBD),
                              width: 1,
                            ),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(
                              color: controller.isLux.value ? AppColors.secondaryLight : (controller.selectedSubCategory.value == 'premium' || controller.selectedSubCategory.value == 'luxury') ? AppColors.secondaryLight : Color(0xffBDBDBD),
                              width: 1,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(
                              color: controller.isLux.value ? AppColors.secondaryLight : (controller.selectedSubCategory.value == 'premium' || controller.selectedSubCategory.value == 'luxury') ? AppColors.secondaryLight : Color(0xffBDBDBD),
                              width: 1,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(
                              color: controller.isLux.value ? AppColors.secondaryLight : (controller.selectedSubCategory.value == 'premium' || controller.selectedSubCategory.value == 'luxury') ? AppColors.secondaryLight : Color(0xffBDBDBD),
                              width: 1,
                            ),
                          ),
                        ),
                        items: [
                          DropdownMenuItem(
                            value: "nearme",
                            child: Text(
                              tr("Near Me"),
                              style: CustomTextStyle.txtPoppins10W400.copyWith(
                                color: controller.isLux.value ? AppColors.secondaryLight : (controller.selectedSubCategory.value == 'premium' || controller.selectedSubCategory.value == 'luxury') ? AppColors.secondaryLight : AppColors.black,
                                fontSize: scale.getScaledFont(12),
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "latest",
                            child: Text(
                              tr("Latest"),
                              style: CustomTextStyle.txtPoppins10W400.copyWith(
                                color: controller.isLux.value ? AppColors.secondaryLight : (controller.selectedSubCategory.value == 'premium' || controller.selectedSubCategory.value == 'luxury') ? AppColors.secondaryLight : AppColors.black,
                                fontSize: scale.getScaledFont(12),
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "popular",
                            child: Text(
                              tr("Popular"),
                              style: CustomTextStyle.txtPoppins10W400.copyWith(
                                color: controller.isLux.value ? AppColors.secondaryLight : (controller.selectedSubCategory.value == 'premium' || controller.selectedSubCategory.value == 'luxury') ? AppColors.secondaryLight : AppColors.black,
                                fontSize: scale.getScaledFont(12),
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "price-L-H",
                            child: Text(
                            tr("Price:Low to High"),
                              style: CustomTextStyle.txtPoppins10W400.copyWith(
                                color: controller.isLux.value ? AppColors.secondaryLight : (controller.selectedSubCategory.value == 'premium' || controller.selectedSubCategory.value == 'luxury') ? AppColors.secondaryLight : AppColors.black,
                                fontSize: scale.getScaledFont(12),
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "price-H-L",
                            child: Text(
                              tr("Price:High to Low"),
                              style: CustomTextStyle.txtPoppins10W400.copyWith(
                                color: controller.isLux.value ? AppColors.secondaryLight : (controller.selectedSubCategory.value == 'premium' || controller.selectedSubCategory.value == 'luxury') ? AppColors.secondaryLight : AppColors.black,
                                fontSize: scale.getScaledFont(12),
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "kms-L-H",
                            child: Text(
                              tr("Kms:Low to High"),
                              style: CustomTextStyle.txtPoppins10W400.copyWith(
                                color: controller.isLux.value ? AppColors.secondaryLight : (controller.selectedSubCategory.value == 'premium' || controller.selectedSubCategory.value == 'luxury') ? AppColors.secondaryLight : AppColors.black,
                                fontSize: scale.getScaledFont(12),
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "kms-H-L",
                            child: Text(
                              tr("Kms:High to Low"),
                              style: CustomTextStyle.txtPoppins10W400.copyWith(
                                color: controller.isLux.value ? AppColors.secondaryLight : (controller.selectedSubCategory.value == 'premium' || controller.selectedSubCategory.value == 'luxury') ? AppColors.secondaryLight : AppColors.black,
                                fontSize: scale.getScaledFont(12),
                              ),
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          controller.sortType = value!;
                          controller.applyFilter();
                        },
                        iconStyleData: IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: controller.isLux.value ? AppColors.secondaryLight : (controller.selectedSubCategory.value == 'premium' || controller.selectedSubCategory.value == 'luxury') ? AppColors.secondaryLight : AppColors.black45,
                          ),
                          iconSize: 24,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            color: controller.isLux.value ? Colors.black : (controller.selectedSubCategory.value == 'premium' || controller.selectedSubCategory.value == 'luxury') ? Colors.black : AppColors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        menuItemStyleData: MenuItemStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                      );
                    }
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: scale.getMargin(
                        horizontal: 2,
                      ),
                      child: Obx(
                        () {
                          return controller.isLoading.value ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.secondaryLight,
                            ),
                          ) : controller.vehicles.value.isNotEmpty ? Wrap(
                            runSpacing: 6,
                            children: List.generate(
                              controller.vehicles.value.length,
                              (index) => VehicleTile(
                                vehicleModel: controller.vehicles[index],
                              ),
                            ),
                          ) : SizedBox(
                            width: scale.fw,
                            child: Column(
                              children: [
                                Lottie.asset(
                                  "assets/no_data.json",
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.fill,
                                ),
                                Text(
                                  tr('no_data_found'),
                                  style: CustomTextStyle.txtPoppins14Black700,
                                )
                              ],
                            ),
                          );
                        }
                      )
                    ),
                  ),
                ),
                SizedBox(
                  height: scale.getScaledHeight(20),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
