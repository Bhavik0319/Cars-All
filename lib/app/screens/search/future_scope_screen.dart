import 'package:cars_and_alll/app/constants/assetConstant.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:cars_and_alll/shared/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/scale_utility.dart';

class FutureScopeScreen extends StatelessWidget {
  const FutureScopeScreen({super.key});

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
              margin: scale.getMargin(
                left: 20,
              ),
              alignment: Alignment.topLeft,
              child: GestureDetector(
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
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Coming Soon',
                style: CustomTextStyle.txtPoppins10W400.copyWith(
                  fontSize: scale.getScaledFont(22),
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
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
                    AssetConstant.partsAccessories,
                    height: scale.getScaledHeight(40),
                  ),
                  Text(
                    'Parts & Accessories',
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
                    AssetConstant.servicesTile,
                    height: scale.getScaledHeight(40),
                  ),
                  Text(
                    'Services',
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
                    AssetConstant.insuranceTile,
                    height: scale.getScaledHeight(40),
                  ),
                  Text(
                    'Insurance',
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
                    AssetConstant.moneyComingSoon,
                    height: scale.getScaledHeight(40),
                  ),
                  Text(
                    'Finance',
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
                    AssetConstant.rsaTile,
                    height: scale.getScaledHeight(40),
                  ),
                  Text(
                    'RSA',
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
                    AssetConstant.vehicleAuctionTile,
                    height: scale.getScaledHeight(40),
                  ),
                  Text(
                    'Vehicle Auction',
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
                    AssetConstant.marchendiseTile,
                    height: scale.getScaledHeight(40),
                  ),
                  Text(
                    'Marchandise Store',
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
