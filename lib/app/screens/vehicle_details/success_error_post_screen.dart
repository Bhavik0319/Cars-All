import 'dart:io';

import 'package:cars_and_alll/app/constants/assetConstant.dart';
import 'package:cars_and_alll/app/widgets/decoratedContainer.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:cars_and_alll/shared/theme/custom_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../routes/app_routes.dart';
import '../../utils/scale_utility.dart';

class SuccessErrorPostScreen extends StatefulWidget {
  const SuccessErrorPostScreen({super.key});

  @override
  State<SuccessErrorPostScreen> createState() => _SuccessErrorPostScreenState();
}

class _SuccessErrorPostScreenState extends State<SuccessErrorPostScreen> {


  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () => Get.offAllNamed(AppRoutes.homeNav));
  }


  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: Container(
            width: scale.fw,
            margin: scale.getMargin(
              horizontal: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AssetConstant.successIcon,
                  color: AppColors.greenCheckColor,
                  height: scale.getScaledHeight(100),
                ),
                SizedBox(
                  height: scale.getScaledHeight(40),
                ),
                Text(
                  tr('success_post'),
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.txtPoppins16Black500,
                ),
                SizedBox(
                  height: scale.getScaledHeight(4),
                ),
                Text(
                  tr('redirect_home'),
                  textAlign: TextAlign.center,
                  style: CustomTextStyle.txtPoppins16Black500.copyWith(
                    fontSize: scale.getScaledFont(10),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
