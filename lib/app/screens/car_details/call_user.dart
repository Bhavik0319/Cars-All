import 'package:cars_and_alll/shared/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/color/app_color.dart';
import '../../utils/scale_utility.dart';

class CallUserScreen extends StatelessWidget {
  const CallUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Container(
          width: scale.fw,
          margin: scale.getMargin(
            left: 20,
            right: 20,
            bottom: 120,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColors.backgroundColor,
                    child: Icon(
                      Icons.arrow_back_outlined,
                    ),
                  ),
                ),
              ),
              Container(
                height: scale.getScaledHeight(60),
                width: scale.getScaledWidth(60),
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/user_img.png',
                    ),
                    fit: BoxFit.contain
                  )
                ),
                child: CircleAvatar(
                  backgroundColor: AppColors.primaryLight,
                  radius: 12,
                  child: Icon(
                    Icons.edit,
                    color: AppColors.white,
                    size: scale.getScaledFont(10),
                  ),
                ),
              ),
              SizedBox(
                height: scale.getScaledHeight(50),
              ),
              Text(
                'User',
                style: CustomTextStyle.txtPoppins16Black500.copyWith(
                  fontSize: scale.getScaledFont(20),
                ),
              ),
              SizedBox(
                height: scale.getScaledHeight(30),
              ),
              Text(
                '+91 5678345656',
                style: CustomTextStyle.txtPoppins16Black500.copyWith(
                  fontSize: scale.getScaledFont(15),
                  fontWeight: FontWeight.w400,
                ),
              ),
              Spacer(),
              SizedBox(
                width: scale.fw,
                height: scale.getScaledHeight(40),
                child: ElevatedButton(
                  onPressed: () {
                    // Get.toNamed(AppRoutes.callUser);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: scale.getPadding(
                      vertical: 20,
                    ),
                  ),
                  child: Text(
                    'Call',
                    style: CustomTextStyle.txtPoppins12Black500.copyWith(
                      color: AppColors.white,
                      fontSize: scale.getScaledFont(15),
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
