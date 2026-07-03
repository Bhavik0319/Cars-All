import 'package:cars_and_alll/app/screens/car_details/controller/carDetailController.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:cars_and_alll/shared/theme/custom_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../utils/scale_utility.dart';

class OverviewTab extends GetView<CarDetailController> {
  const OverviewTab({super.key});

  @override
  Widget build(BuildContext context) {

    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Container(
      margin: scale.getMargin(
        horizontal: 10,
      ),
      padding: scale.getPadding(
        bottom: 10,
      ),
      child: Column(
        children: [
          Container(
            margin: scale.getMargin(
              bottom: 5,
              top: 10
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tr('registration_year'),
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.black,
                  ),
                ),
                Text(
                  '${controller.vehicleDetail.value.filters!.registrationYear}',
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.black2020,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight.withOpacity(0.30) : AppColors.black2020.withOpacity(0.30),
            thickness: 0.75,
          ),
          Container(
            margin: scale.getMargin(
                bottom: 5,
                top: 10
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tr('brand'),
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.black,
                  ),
                ),
                Text(
                  '${controller.vehicleDetail.value.filters!.brand}',
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.black2020,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight.withOpacity(0.30) : AppColors.black2020.withOpacity(0.30),
            thickness: 0.75,
          ),
          Container(
            margin: scale.getMargin(
                bottom: 5,
                top: 10
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tr('model'),
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.black,
                  ),
                ),
                Text(
                  '${controller.vehicleDetail.value.filters!.model}',
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.black2020,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight.withOpacity(0.30) : AppColors.black2020.withOpacity(0.30),
            thickness: 0.75,
          ),
          Container(
            margin: scale.getMargin(
              bottom: 5,
              top: 10
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tr('rto_code'),
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.black,
                  ),
                ),
                Text(
                  controller.vehicleDetail.value.rtoDetails!.rtoCode!,
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.black2020,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight.withOpacity(0.30) : AppColors.black2020.withOpacity(0.30),
            thickness: 0.75,
          ),
          Container(
            margin: scale.getMargin(
              bottom: 5,
              top: 10
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tr('rto_address'),
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.black,
                  ),
                ),
                Text(
                  '${controller.vehicleDetail.value.rtoDetails!.rtoAddress}',
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.black2020,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight.withOpacity(0.30) : AppColors.black2020.withOpacity(0.30),
            thickness: 0.75,
          ),
          Container(
            margin: scale.getMargin(
              bottom: 5,
              top: 10
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tr('ownership'),
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.black,
                  ),
                ),
                Text(
                  '${controller.vehicleDetail.value.filters!.ownerType}',
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.black2020,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight.withOpacity(0.30) : AppColors.black2020.withOpacity(0.30),
            thickness: 0.75,
          ),
          Container(
            margin: scale.getMargin(
              bottom: 5,
              top: 10
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tr('seating_capacity'),
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.black,
                  ),
                ),
                Text(
                  '${controller.vehicleDetail.value.filters!.seatingCapacity}',
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.black2020,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight.withOpacity(0.30) : AppColors.black2020.withOpacity(0.30),
            thickness: 0.75,
          ),
          Container(
            margin: scale.getMargin(
              bottom: 5,
              top: 10
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tr('fuel_type'),
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.black,
                  ),
                ),
                Text(
                  '${controller.vehicleDetail.value.filters!.fuelType}',
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.black2020,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight.withOpacity(0.30) : AppColors.black2020.withOpacity(0.30),
            thickness: 0.75,
          ),

          Container(
            margin: scale.getMargin(
              bottom: 5,
              top: 10
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tr('kms_driven'),
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.black,
                  ),
                ),
                Text(
                  '${controller.vehicleDetail.value.filters!.kmsDriven} Kms',
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.black2020,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight.withOpacity(0.30) : AppColors.black2020.withOpacity(0.30),
            thickness: 0.75,
          ),
          Container(
            margin: scale.getMargin(
              bottom: 5,
              top: 10
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tr('transmission'),
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.black,
                  ),
                ),
                Text(
                  '${controller.vehicleDetail.value.filters!.transmissionType}',
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.black2020,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight.withOpacity(0.30) : AppColors.black2020.withOpacity(0.30),
            thickness: 0.75,
          ),
          Container(
            margin: scale.getMargin(
              bottom: 5,
              top: 10
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tr('body_type'),
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.black,
                  ),
                ),
                Text(
                  '${controller.vehicleDetail.value.filters!.bodyType}',
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.black2020,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight.withOpacity(0.30) : AppColors.black2020.withOpacity(0.30),
            thickness: 0.75,
          ),
        ],
      ),
    );
  }
}
