import 'dart:developer';

import 'package:cars_and_alll/app/screens/filter/controller/filterController.dart';
import 'package:cars_and_alll/app/screens/filter/enum/driveType.dart';
import 'package:cars_and_alll/app/screens/filter/widget/filterTile.dart';
import 'package:cars_and_alll/app/utils/numberFormat.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:cars_and_alll/shared/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../constants/assetConstant.dart';
import '../../utils/scale_utility.dart';
import 'enum/transmissionType.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    FilterController controller = Get.find<FilterController>();
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Container(
      color: AppColors.white,
      padding: scale.getPadding(
        left: 15,
        right: 15,
        top: 40,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filters',
                style: CustomTextStyle.txtPoppins16Black500,
              ),
              GestureDetector(
                onTap: () {
                  controller.clearAllFilter();
                  Get.back(result: true);
                },
                child: Text(
                  'Clear all',
                  style: CustomTextStyle.txtPoppins14Black700.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondaryLight,
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              margin: scale.getMargin(
                top: 18,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      child: Container(
                        color: AppColors.backgroundColor,
                        child: Column(
                          children: [
                            Container(
                              padding: scale.getPadding(
                                bottom: 20,
                              ),
                              child: Obx(
                                      () {
                                    return FilterTile(
                                      text: 'Brands',
                                      onTap: () {
                                        controller.changeFilterTab(0);
                                      },
                                      scale: scale,
                                      isActive: controller.currentTab.value == 0,
                                    );
                                  }
                              ),
                            ),
                            Container(
                              margin: scale.getMargin(
                                bottom: 20,
                              ),
                              child: Obx(
                                      () {
                                    return FilterTile(
                                      text: 'Model',
                                      onTap: () {
                                        controller.changeFilterTab(1);
                                      },
                                      scale: scale,
                                      isActive: controller.currentTab.value == 1,
                                    );
                                  }
                              ),
                            ),
                            Container(
                              margin: scale.getMargin(
                                bottom: 20,
                              ),
                              child: Obx(
                                      () {
                                    return FilterTile(
                                      text: 'Body Type',
                                      onTap: () {
                                        controller.changeFilterTab(2);
                                      },
                                      scale: scale,
                                      isActive: controller.currentTab.value == 2,
                                    );
                                  }
                              ),
                            ),
                            Container(
                              margin: scale.getMargin(
                                bottom: 20,
                              ),
                              child: Obx(
                                      () {
                                    return FilterTile(
                                      text: 'Manufacturer',
                                      onTap: () {
                                        controller.changeFilterTab(3);
                                      },
                                      scale: scale,
                                      isActive: controller.currentTab.value == 3,
                                    );
                                  }
                              ),
                            ),
                            Container(
                              margin: scale.getMargin(
                                bottom: 20,
                              ),
                              child: Obx(
                                      () {
                                    return FilterTile(
                                      text: 'Fuel Type',
                                      onTap: () {
                                        controller.changeFilterTab(4);
                                      },
                                      scale: scale,
                                      isActive: controller.currentTab.value == 4,
                                    );
                                  }
                              ),
                            ),
                            Container(
                              margin: scale.getMargin(
                                bottom: 20,
                              ),
                              child: Obx(
                                      () {
                                    return FilterTile(
                                      text: 'Km Driven',
                                      onTap: () {
                                        controller.changeFilterTab(5);
                                      },
                                      scale: scale,
                                      isActive: controller.currentTab.value == 5,
                                    );
                                  }
                              ),
                            ),
                            Container(
                              margin: scale.getMargin(
                                bottom: 20,
                              ),
                              child: Obx(
                                      () {
                                    return FilterTile(
                                      text: 'Transmission',
                                      onTap: () {
                                        controller.changeFilterTab(6);
                                      },
                                      scale: scale,
                                      isActive: controller.currentTab.value == 6,
                                    );
                                  }
                              ),
                            ),
                            Container(
                              margin: scale.getMargin(
                                bottom: 20,
                              ),
                              child: Obx(
                                      () {
                                    return FilterTile(
                                      text: 'Search RTO Code',
                                      onTap: () {
                                        controller.changeFilterTab(7);
                                      },
                                      scale: scale,
                                      isActive: controller.currentTab.value == 7,
                                    );
                                  }
                              ),
                            ),
                            Container(
                              margin: scale.getMargin(
                                bottom: 20,
                              ),
                              child: Obx(
                                      () {
                                    return FilterTile(
                                      text: 'No of Owner',
                                      onTap: () {
                                        controller.changeFilterTab(8);
                                      },
                                      scale: scale,
                                      isActive: controller.currentTab.value == 8,
                                    );
                                  }
                              ),
                            ),
                            Container(
                              margin: scale.getMargin(
                                bottom: 20,
                              ),
                              child: Obx(
                                      () {
                                    return FilterTile(
                                      text: 'Price Range',
                                      onTap: () {
                                        controller.changeFilterTab(9);
                                      },
                                      scale: scale,
                                      isActive: controller.currentTab.value == 9,
                                    );
                                  }
                              ),
                            ),
                            controller.filterCategory != 'bikes' ? Obx(
                                    () {
                                  return FilterTile(
                                    text: 'Seating Capacity',
                                    onTap: () {
                                      controller.changeFilterTab(10);
                                    },
                                    scale: scale,
                                    isActive: controller.currentTab.value == 10,
                                  );
                                }
                            ): SizedBox(
                              height: scale.getScaledHeight(20),
                            ),
                            controller.filterCategory == 'machinery' ? Container(
                              margin: scale.getMargin(
                                bottom: 20,
                                top: 20,
                              ),
                              child: Obx(
                                      () {
                                    return FilterTile(
                                      text: 'Hours Operator',
                                      onTap: () {
                                        controller.changeFilterTab(11);
                                      },
                                      scale: scale,
                                      isActive: controller.currentTab.value == 11,
                                    );
                                  }
                              ),
                            ) : SizedBox(
                              height: scale.getScaledHeight(20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                        margin: scale.getMargin(
                            left: 10,
                            bottom: 15
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Obx(
                                    () {
                                  return Column(
                                    children: [
                                      if (controller.currentTab.value == 7 ) Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.backgroundColor,
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                            color: AppColors.secondaryLight,
                                            width: 1,
                                          ),
                                        ),
                                        child: TextFormField(
                                          controller: controller.rtoTextField,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelStyle: TextStyle(fontWeight: FontWeight.w600),
                                            floatingLabelBehavior: FloatingLabelBehavior.always,
                                            hintStyle: CustomTextStyle.txtPoppins12White300.copyWith(
                                              color: Color(0xff9095A0),
                                              fontSize: scale.getScaledFont(10),
                                              fontWeight: FontWeight.w500,
                                            ),
                                            focusColor: AppColors.white,
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: BorderSide(color: AppColors.secondaryLight),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: BorderSide(color: AppColors.secondaryLight),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: BorderSide(color: AppColors.secondaryLight),
                                            ),
                                            contentPadding: EdgeInsets.zero,
                                            prefixIcon: Padding(
                                              padding: const EdgeInsets.all(12.0),
                                              child: SvgPicture.asset(
                                                AssetConstant.searchBarIcon,
                                                height: 2,
                                                color: Color(0xff9095A0),
                                              ),
                                            ),
                                            hintText: controller.getHintText(),
                                          ),
                                          onChanged: (val){
                                            controller.rtoSearch();
                                          },
                                          style: CustomTextStyle.txtPoppins12White300.copyWith(
                                            color: AppColors.black,
                                            fontSize: scale.getScaledFont(10),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      (controller.currentTab.value == 0 || controller.currentTab.value == 1
                                          || controller.currentTab.value == 2
                                          || controller.currentTab.value == 4
                                          || controller.currentTab.value == 8) ? controller.currentTab.value != 1 ? Container(
                                        alignment: Alignment.topRight,
                                        margin: scale.getMargin(
                                          vertical: 13,
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: Checkbox(
                                                value: controller.isSelectAll.value,
                                                onChanged: (value) {
                                                  controller.selectAllTrigger();
                                                },
                                                fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                                                  if (states.contains(WidgetState.selected)) {
                                                    return AppColors.secondaryLight;
                                                  }
                                                  return Colors.transparent;
                                                }),
                                                checkColor: AppColors.white,
                                                activeColor: AppColors.secondaryLight,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(4),
                                                ),
                                                side: BorderSide(color: AppColors.secondaryLight, width: 1.5),
                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              'Select All',
                                              style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                                color: AppColors.primaryLight,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                          : controller.currentTab.value == 1 && controller.selectedBrandName.isEmpty ? SizedBox()
                                          : Container(
                                        alignment: Alignment.topRight,
                                        margin: scale.getMargin(
                                          vertical: 13,
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: Checkbox(
                                                value: controller.isSelectAll.value,
                                                onChanged: (value) {
                                                  controller.selectAllTrigger();
                                                },
                                                fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                                                  if (states.contains(WidgetState.selected)) {
                                                    return AppColors.secondaryLight;
                                                  }
                                                  return Colors.transparent;
                                                }),
                                                checkColor: AppColors.white,
                                                activeColor: AppColors.secondaryLight,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(4),
                                                ),
                                                side: BorderSide(color: AppColors.secondaryLight, width: 1.5),
                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              'Select All',
                                              style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                                color: AppColors.primaryLight,
                                              ),
                                            )
                                          ],
                                        ),
                                      ) : SizedBox(),
                                    ],
                                  );
                                }
                            ),
                            SizedBox(
                              height: scale.getScaledHeight(10),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Obx(
                                        () {
                                      return Column(
                                        children: [
                                          if(controller.currentTab.value == 7 )
                                            ...List.generate(controller.searchFields.value.length, (index) {
                                              List options = controller.searchFields.value;
                                              return Container(
                                                margin: scale.getMargin(
                                                    all: 3.5
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 24,
                                                      height: 24,
                                                      child: Obx(
                                                              () {
                                                            return Checkbox(
                                                              value: controller.checkPresentOrNot(options[index]),
                                                              onChanged: (value) {
                                                                if(controller.checkPresentOrNot(options[index])){
                                                                  controller.unSelectCheckBoxOption(options[index]);
                                                                }else {
                                                                  controller.selectCheckBoxOption(options[index]);
                                                                }
                                                              },
                                                              fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                                                                if (states.contains(WidgetState.selected)) {
                                                                  return AppColors.secondaryLight;
                                                                }
                                                                return Colors.transparent;
                                                              }),
                                                              checkColor: AppColors.white,
                                                              activeColor: AppColors.secondaryLight,
                                                              shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(4),
                                                              ),
                                                              side: BorderSide(color: AppColors.secondaryLight, width: 1.5),
                                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                            );
                                                          }
                                                      ),
                                                    ),
                                                    const SizedBox(width: 8),
                                                    SizedBox(
                                                      width: scale.getScaledWidth(140),
                                                      child: Text(
                                                        '${options[index]}',
                                                        style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                                          fontSize: scale.getScaledFont(12),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              );
                                            }),

                                          (controller.currentTab.value == 0 || controller.currentTab.value == 1
                                              || controller.currentTab.value == 2
                                              || controller.currentTab.value == 4
                                              || controller.currentTab.value == 8
                                              || controller.currentTab.value == 10)
                                              ? controller.currentTab.value != 1 ? Column(
                                            children: List.generate(controller.getCurrentTabOptions().length, (index) {
                                              List options = controller.getCurrentTabOptions();
                                              return Container(
                                                margin: scale.getMargin(
                                                    all: 3.5
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 24,
                                                      height: 24,
                                                      child: Obx(
                                                              () {
                                                            return Checkbox(
                                                              value: controller.checkPresentOrNot(options[index]),
                                                              onChanged: (value) {
                                                                if(controller.checkPresentOrNot(options[index])){
                                                                  controller.unSelectCheckBoxOption(options[index]);
                                                                  if(controller.currentTab.value == 0){
                                                                    controller.removeEligibleModelChoice(options[index]);
                                                                  }
                                                                }else {
                                                                  controller.selectCheckBoxOption(options[index]);
                                                                  if(controller.currentTab.value == 0){
                                                                    controller.addEligibleModelChoice();
                                                                  }
                                                                }
                                                              },
                                                              fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                                                                if (states.contains(WidgetState.selected)) {
                                                                  return AppColors.secondaryLight;
                                                                }
                                                                return Colors.transparent;
                                                              }),
                                                              checkColor: AppColors.white,
                                                              activeColor: AppColors.secondaryLight,
                                                              shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(4),
                                                              ),
                                                              side: BorderSide(color: AppColors.secondaryLight, width: 1.5),
                                                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                            );
                                                          }
                                                      ),
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Text(
                                                      '${options[index]}',
                                                      style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                                        fontSize: scale.getScaledFont(14),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              );
                                            }),
                                          ) : (controller.currentTab.value == 1 && controller.selectedBrandName.isEmpty) ? Text(
                                            'Model (Select a Brand First)',
                                            style: CustomTextStyle.txtPoppins14Black700.copyWith(
                                              fontWeight: FontWeight.w600,
                                              fontSize: scale.getScaledFont(12),
                                              color: AppColors.black45,
                                            ),
                                          ) : Column(
                                              children: List.generate(controller.getCurrentTabOptions().length, (index) {
                                                List options = controller.getCurrentTabOptions();
                                                return Container(
                                                  margin: scale.getMargin(
                                                      all: 3.5
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      SizedBox(
                                                        width: 24,
                                                        height: 24,
                                                        child: Obx(
                                                                () {
                                                              return Checkbox(
                                                                value: controller.checkPresentOrNot(options[index]),
                                                                onChanged: (value) {
                                                                  if(controller.checkPresentOrNot(options[index])){
                                                                    controller.unSelectCheckBoxOption(options[index]);
                                                                  }else {
                                                                    controller.selectCheckBoxOption(options[index]);
                                                                  }
                                                                },
                                                                fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                                                                  if (states.contains(WidgetState.selected)) {
                                                                    return AppColors.secondaryLight;
                                                                  }
                                                                  return Colors.transparent;
                                                                }),
                                                                checkColor: AppColors.white,
                                                                activeColor: AppColors.secondaryLight,
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(4),
                                                                ),
                                                                side: BorderSide(color: AppColors.secondaryLight, width: 1.5),
                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                              );
                                                            }
                                                        ),
                                                      ),
                                                      const SizedBox(width: 8),
                                                      Text(
                                                        '${options[index]}',
                                                        style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                                          fontSize: scale.getScaledFont(14),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                );
                                              })) : SizedBox(),
                                          controller.currentTab.value == 3 || controller.currentTab.value == 5 || controller.currentTab.value == 9 || controller.currentTab.value == 11 ? Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Container(
                                                    width: scale.getScaledWidth(70),
                                                    alignment: Alignment.center,
                                                    padding: scale.getPadding(
                                                      // horizontal: 5,
                                                      vertical: 5,
                                                    ),
                                                    decoration: BoxDecoration(
                                                        color: Color(0xffF3F4F6),
                                                        borderRadius: BorderRadius.circular(10)
                                                    ),
                                                    child: Text(
                                                      controller.currentTab.value == 3
                                                          ? '${controller.manufacturer.value.start.toStringAsFixed(0)}'
                                                          : controller.currentTab.value == 5
                                                          ? '${formatWithCommas(int.tryParse(controller.kmDriven.value.start.toStringAsFixed(0))).substring(1)} km'
                                                          : controller.currentTab.value == 9
                                                          ? formatWithCommas(int.tryParse(controller.priceRange.value.start.toStringAsFixed(0)))
                                                          : controller.currentTab.value == 11
                                                          ? formatWithCommas(int.tryParse(controller.hoursOperator.value.start.toStringAsFixed(0))).substring(1)
                                                          : '',
                                                      style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: scale.getScaledFont(10),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    'to',
                                                    style: CustomTextStyle.txtPoppins14Black700.copyWith(
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: scale.getScaledWidth(80),
                                                    alignment: Alignment.center,
                                                    padding: scale.getPadding(
                                                      vertical: 5,
                                                    ),
                                                    decoration: BoxDecoration(
                                                        color: Color(0xffF3F4F6),
                                                        borderRadius: BorderRadius.circular(10)
                                                    ),
                                                    child: Text(
                                                      controller.currentTab.value == 3
                                                          ? '${controller.manufacturer.value.end.toStringAsFixed(0)}'
                                                          : controller.currentTab.value == 5
                                                          ? '${formatWithCommas(int.tryParse(controller.kmDriven.value.end.toStringAsFixed(0))).substring(1)}${controller.kmDriven.value.end == controller.rangeKmDriven[1] ? "+" : ""} km'
                                                          : controller.currentTab.value == 9
                                                          ? formatWithCommas(int.tryParse(controller.priceRange.value.end.toStringAsFixed(0)))
                                                          : controller.currentTab.value == 11
                                                          ? formatWithCommas(int.tryParse(controller.hoursOperator.value.end.toStringAsFixed(0))).substring(1)
                                                          : '',
                                                      style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: scale.getScaledFont(10),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: scale.getScaledHeight(15),
                                              ),
                                              SfRangeSlider(
                                                min: controller.currentTab.value == 3
                                                    ? controller.rangeManufacturer[0]
                                                    : controller.currentTab.value == 5
                                                    ? controller.rangeKmDriven[0]
                                                    : controller.currentTab.value == 9
                                                    ? controller.availablePriceRange[0]
                                                    : controller.currentTab.value == 11
                                                    ? controller.hoursOperatorRange[0]
                                                    : 0,
                                                max: controller.currentTab.value == 3
                                                    ? controller.rangeManufacturer[1]
                                                    : controller.currentTab.value == 5
                                                    ? controller.rangeKmDriven[1]
                                                    : controller.currentTab.value == 9
                                                    ? controller.availablePriceRange[1]
                                                    : controller.currentTab.value == 11
                                                    ? controller.hoursOperatorRange[1]
                                                    : 0,
                                                values: controller.currentTab.value == 3
                                                    ? controller.manufacturer.value
                                                    : controller.currentTab.value == 5
                                                    ? controller.kmDriven.value
                                                    : controller.currentTab.value == 9
                                                    ? controller.priceRange.value
                                                    : controller.hoursOperator.value,
                                                interval: controller.currentTab.value == 3
                                                    ? 100
                                                    : controller.currentTab.value == 5
                                                    ? 1000000
                                                    : controller.currentTab.value == 9
                                                    ? 1000000
                                                    : controller.currentTab.value == 11
                                                    ? 1000000
                                                    : 0,
                                                stepSize: 1,
                                                showTicks: false,
                                                showLabels: false,
                                                enableTooltip: false,
                                                showDividers: true,
                                                activeColor: AppColors.secondaryLight,
                                                inactiveColor: Color(0xffF1EFE7),
                                                startThumbIcon: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: AppColors.secondaryLight,
                                                      width: 1,
                                                    ),
                                                  ),
                                                ),
                                                endThumbIcon: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: AppColors.secondaryLight,
                                                      width: 1,
                                                    ),
                                                  ),
                                                ),
                                                minorTicksPerInterval: 0,
                                                onChanged: (SfRangeValues values){
                                                  if(controller.currentTab.value == 3) {
                                                    controller.updateManufacturerRange(values);
                                                  }else if(controller.currentTab.value == 5){
                                                    controller.updateKmDrivenRange(values);
                                                  }else if(controller.currentTab.value == 9){
                                                    controller.updatePriceRange(values);
                                                  } else if(controller.currentTab.value == 11){
                                                    controller.updateHoursOperatorRange(values);
                                                  }
                                                },
                                              ),
                                            ],
                                          ) : SizedBox(),
                                          controller.currentTab.value == 6 ? Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Radio<TransmissionType>(
                                                    value: TransmissionType.MANUAL,
                                                    groupValue: controller.transmissionType.value,
                                                    activeColor: AppColors.secondaryLight,
                                                    focusColor: AppColors.primaryLight,
                                                    onChanged: (value) {
                                                      log('$value');
                                                      controller.updateTransmissionSelection(value!);
                                                    },
                                                    fillColor: WidgetStateColor.resolveWith((state) {
                                                      if(state.contains(WidgetState.selected)){
                                                        return AppColors.secondaryLight;
                                                      }else {
                                                        return AppColors.secondaryLight;
                                                      }
                                                    }),
                                                    toggleable: true,
                                                    hoverColor: AppColors.primaryLight,
                                                  ),
                                                  SizedBox(
                                                    width: scale.getScaledWidth(4),
                                                  ),
                                                  Text(
                                                    'Manual',
                                                    style: CustomTextStyle.txtPoppins14Black700.copyWith(
                                                      fontWeight: FontWeight.w500,
                                                      color: AppColors.black2020,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: scale.getScaledHeight(4),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Radio<TransmissionType>(
                                                    value: TransmissionType.AUTOMATIC,
                                                    groupValue: controller.transmissionType.value,
                                                    activeColor: AppColors.secondaryLight,
                                                    focusColor: AppColors.secondaryLight,
                                                    onChanged: (value) {
                                                      log('$value');
                                                      controller.updateTransmissionSelection(value!);
                                                    },
                                                    fillColor: WidgetStateColor.resolveWith((state) {
                                                      if(state.contains(WidgetState.selected)){
                                                        return AppColors.secondaryLight;
                                                      }else {
                                                        return AppColors.secondaryLight;
                                                      }
                                                    }),
                                                    toggleable: true,
                                                  ),
                                                  SizedBox(
                                                    width: scale.getScaledWidth(4),
                                                  ),
                                                  Text(
                                                    'Automatic',
                                                    style: CustomTextStyle.txtPoppins14Black700.copyWith(
                                                      fontWeight: FontWeight.w500,
                                                      color: AppColors.black2020,
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: scale.getScaledHeight(4),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Radio<TransmissionType>(
                                                    value: TransmissionType.IMT,
                                                    groupValue: controller.transmissionType.value,
                                                    activeColor: AppColors.secondaryLight,
                                                    focusColor: AppColors.secondaryLight,
                                                    fillColor: WidgetStateColor.resolveWith((state) {
                                                      if(state.contains(WidgetState.selected)){
                                                        return AppColors.secondaryLight;
                                                      }else {
                                                        return AppColors.secondaryLight;
                                                      }
                                                    }),
                                                    onChanged: (value) {
                                                      log('$value');
                                                      controller.updateTransmissionSelection(value!);
                                                    },
                                                    toggleable: true,
                                                  ),
                                                  SizedBox(
                                                    width: scale.getScaledWidth(4),
                                                  ),
                                                  SizedBox(
                                                    width: scale.getScaledWidth(120),
                                                    child: Text(
                                                      'iMT (Intelligent Manual Transmission)',
                                                      style: CustomTextStyle.txtPoppins14Black700.copyWith(
                                                        fontWeight: FontWeight.w500,
                                                        color: AppColors.black2020,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ) : SizedBox(),
                                        ],
                                      );
                                    }
                                ),
                              ),
                            ),
                            SizedBox(
                              height: scale.getScaledHeight(10),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          color: AppColors.secondaryLight,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: scale.getPadding(
                                          horizontal: 20,
                                          vertical: 20
                                      )
                                  ),
                                  onPressed: () async{
                                    Get.back(result: false);
                                  },
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(color: AppColors.secondaryLight, fontSize: 16),
                                  ),
                                ),
                                SizedBox(
                                  width: scale.getScaledWidth(10),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.secondaryLight,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: scale.getPadding(
                                          horizontal: 20,
                                          vertical: 20
                                      )
                                  ),
                                  onPressed: () async{
                                    Get.back(result: true);
                                  },
                                  child: Text(
                                    "Apply",
                                    style: TextStyle(color: Colors.white, fontSize: 16),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
