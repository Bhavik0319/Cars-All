
import 'dart:developer';

import 'package:cars_and_alll/app/constants/assetConstant.dart';
import 'package:cars_and_alll/app/controller/auth_controller.dart';
import 'package:cars_and_alll/app/extensions/build_context_theme_extension.dart';
import 'package:cars_and_alll/app/models/enum/user_type.dart';
import 'package:cars_and_alll/shared/theme/custom_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/route_manager.dart';
import '../../../shared/color/app_color.dart';
import '../../routes/app_routes.dart';
import '../../utils/scale_utility.dart';
import '../../widgets/button/custom_elevated_button.dart';

class UserSelection extends GetView<AuthController> {
  const UserSelection({super.key});

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Container(
          padding: scale.getPadding(
            horizontal: 18,
            vertical: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: scale.getPadding(
                        left: 10,
                        right: 82,
                      ),
                      child: Image.asset(
                        AssetConstant.arrowBack,
                        height: scale.getScaledHeight(15),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: scale.getScaledFont(50),
                    backgroundColor: AppColors.splashBackground,
                    backgroundImage: AssetImage(
                      AssetConstant.appLogoSqr,
                    ),
                  )
                ],
              ),
              Container(
                margin: scale.getMargin(
                  top: 65,
                  left: 48,
                  right: 48,
                  bottom: 65,
                ),
                child: Image.asset(
                  AssetConstant.userSelection,
                  fit: BoxFit.cover,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: '${tr('hey')} ${tr('are_you')}',
                  style: CustomTextStyle.txtPoppins20W700.copyWith(
                    color: AppColors.txtColorDrkBlu,
                  ),
                  children: [
                    TextSpan(
                      text: '_____',
                      style: CustomTextStyle.txtPoppins20W700.copyWith(
                        color: AppColors.txtColorBlu,
                      ),
                    )
                  ]
                ),
              ),
              Obx(
                () {
                  return GestureDetector(
                    onTap: () {
                      controller.updateUserSelection(UserType.INDIVIDUAL);
                    },
                    child: Container(
                      margin: scale.getMargin(
                        top: 22,
                        bottom: 20
                      ),
                      padding: scale.getPadding(
                        all: 20
                      ),
                      decoration: BoxDecoration(
                          color: controller.userType.value == UserType.INDIVIDUAL
                              ? AppColors.white
                              : AppColors.radioBtnSelection,
                        borderRadius: BorderRadius.circular(scale.getScaledFont(16)),
                        border: controller.userType.value == UserType.INDIVIDUAL ? Border.all(
                          color: Theme.of(context).primaryColor,
                          width: scale.getScaledWidth(1),
                        ) : null,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundImage: AssetImage(AssetConstant.user),
                              ),
                              SizedBox(width: scale.getScaledWidth(15),),
                              Text(
                                tr('individual'),
                                style: CustomTextStyle.txtPoppins16Black500,
                              ),
                            ],
                          ),
                          Radio<UserType>(
                            value: UserType.INDIVIDUAL,
                            groupValue: controller.userType.value,
                            activeColor: AppColors.txtColorBlu,
                            focusColor: AppColors.txtColorBlu,
                            onChanged: (value) {
                              log('$value');
                              controller.updateUserSelection(value!);
                            },
                            toggleable: true,
                          ),
                        ],
                      ),
                    ),
                  );
                }
              ),
              Obx(
                () {
                  return GestureDetector(
                    onTap: () {
                      controller.updateUserSelection(UserType.DEALER);
                    },
                    child: Container(
                      margin: scale.getMargin(
                          bottom: 20
                      ),
                      padding: scale.getPadding(
                          all: 20
                      ),
                      decoration: BoxDecoration(
                        color: controller.userType.value == UserType.DEALER
                            ? AppColors.white
                            : AppColors.radioBtnSelection,
                        borderRadius: BorderRadius.circular(scale.getScaledFont(16)),
                        border: controller.userType.value == UserType.DEALER ? Border.all(
                          color: Theme.of(context).primaryColor,
                          width: scale.getScaledWidth(1),
                        ) : null,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundImage: AssetImage(AssetConstant.user),
                              ),
                              SizedBox(width: scale.getScaledWidth(15),),
                              Text(
                                tr("dealer"),
                                style: CustomTextStyle.txtPoppins16Black500,
                              ),
                            ],
                          ),
                          Radio<UserType>(
                            value: UserType.DEALER,
                            groupValue: controller.userType.value,
                            activeColor: AppColors.txtColorBlu,
                            focusColor: AppColors.txtColorBlu,
                            onChanged: (value) {
                              controller.updateUserSelection(value!);
                            },
                            toggleable: true,
                          ),
                        ],
                      ),
                    ),
                  );
                }
              ),
              CustomElevatedButton(
                text: "Next",
                onPressed: () {
                  Get.toNamed(AppRoutes.signUpScreen);
                },
                buttonTextStyle: context.textTheme.labelLarge?.copyWith(
                  color: context.colorScheme.surface,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
