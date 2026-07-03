import 'package:cars_and_alll/app/constants/assetConstant.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:cars_and_alll/shared/theme/custom_text_style.dart';
import 'package:flutter/material.dart';

import '../../utils/scale_utility.dart';

class SelectVehicleType extends StatelessWidget {
  const SelectVehicleType({super.key});

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        margin: scale.getMargin(
          top: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                'Select Vehicle Type',
                style: CustomTextStyle.txtPoppins10W400.copyWith(
                  fontSize: scale.getScaledFont(22),
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
              ),
            ),
            Container(
              width: scale.getScaledWidth(100),
              padding: scale.getPadding(
                left: 6,
                right: 12,
                top: 3,
                bottom: 3,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AssetConstant.carTile,
                    height: scale.getScaledHeight(40),
                  ),
                  Text(
                    'Cars',
                    textAlign: TextAlign.center,
                    style: CustomTextStyle.txtPoppins12Black500.copyWith(
                      color: AppColors.black,
                      fontSize: scale.getScaledFont(12),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: scale.getScaledWidth(100),
              padding: scale.getPadding(
                left: 6,
                right: 12,
                top: 3,
                bottom: 3,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AssetConstant.bikeTile,
                    height: scale.getScaledHeight(40),
                  ),
                  Text(
                    'Bikes',
                    textAlign: TextAlign.center,
                    style: CustomTextStyle.txtPoppins12Black500.copyWith(
                      color: AppColors.black,
                      fontSize: scale.getScaledFont(12),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: scale.getScaledWidth(150),
              padding: scale.getPadding(
                left: 6,
                right: 12,
                top: 3,
                bottom: 3,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AssetConstant.evTile,
                    height: scale.getScaledHeight(40),
                  ),
                  Text(
                    'Electric Vehicles',
                    textAlign: TextAlign.center,
                    style: CustomTextStyle.txtPoppins12Black500.copyWith(
                      color: AppColors.black,
                      fontSize: scale.getScaledFont(12),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: scale.getScaledWidth(150),
              padding: scale.getPadding(
                left: 6,
                right: 12,
                top: 3,
                bottom: 3,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AssetConstant.commercialVehicleTile,
                    height: scale.getScaledHeight(40),
                  ),
                  Text(
                    'Commercial',
                    textAlign: TextAlign.center,
                    style: CustomTextStyle.txtPoppins12Black500.copyWith(
                      color: AppColors.black,
                      fontSize: scale.getScaledFont(12),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              width: scale.getScaledWidth(150),
              padding: scale.getPadding(
                left: 6,
                right: 12,
                top: 3,
                bottom: 3,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AssetConstant.heavyMechaneryTile,
                    height: scale.getScaledHeight(40),
                  ),
                  Text(
                    'Heavy',
                    textAlign: TextAlign.center,
                    style: CustomTextStyle.txtPoppins12Black500.copyWith(
                      color: AppColors.black,
                      fontSize: scale.getScaledFont(12),
                    ),
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
