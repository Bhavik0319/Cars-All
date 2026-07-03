import 'package:cars_and_alll/app/extensions/build_context_theme_extension.dart';
import 'package:cars_and_alll/app/extensions/spacing_extension.dart';
import 'package:cars_and_alll/app/routes/app_routes.dart';
import 'package:cars_and_alll/app/widgets/button/custom_elevated_button.dart';
import 'package:cars_and_alll/app/widgets/textfield/custom_text_form_feild.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:cars_and_alll/shared/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';
import 'package:go_router/go_router.dart';

import '../../constants/assetConstant.dart';
import '../../utils/scale_utility.dart';

class SelectKycMode extends ConsumerStatefulWidget {
  const SelectKycMode({super.key});

  @override
  ConsumerState<SelectKycMode> createState() => _SelectKycModeState();
}

class _SelectKycModeState extends ConsumerState<SelectKycMode> {

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: BackButton(color: context.colorScheme.onSurface,onPressed: (){context.pop();},),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: 24.paddingHorizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo
              CircleAvatar(
                radius: scale.getScaledFont(50),
                backgroundColor: AppColors.splashBackground,
                backgroundImage: AssetImage(
                  AssetConstant.appLogoSqr,
                ),
              ),
              20.space,
              // Create Account Title
              Text(
                'Create your Account',
                style: context.textTheme.titleLarge?.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: context.colorScheme.onSurface),
                textAlign: TextAlign.center,
              ),
              100.space,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: scale.getMargin(
                        bottom: 20
                    ),
                    padding: scale.getPadding(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.radioBtnSelection,
                      borderRadius: BorderRadius.circular(scale.getScaledFont(16)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/aadhaar_icon.png',
                          height: scale.getScaledHeight(50),
                        ),
                        Expanded(
                          child: Container(
                            margin: scale.getMargin(
                              right: 30,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Aadhaar',
                              style: CustomTextStyle.txtPoppins20W700.copyWith(
                                fontSize: scale.getScaledFont(21),
                                color: AppColors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: scale.getMargin(
                        bottom: 20
                    ),
                    padding: scale.getPadding(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.radioBtnSelection,
                      borderRadius: BorderRadius.circular(scale.getScaledFont(16)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/digilocker_icon.png',
                          height: scale.getScaledHeight(35),
                        ),
                        Expanded(
                          child: Container(
                            margin: scale.getMargin(
                              right: 30,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'DigiLocker',
                              style: CustomTextStyle.txtPoppins20W700.copyWith(
                                fontSize: scale.getScaledFont(21),
                                color: AppColors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(70),
                  ),
                  CustomElevatedButton(
                    text: "Continue",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
