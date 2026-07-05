import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cars_and_alll/app/constants/assetConstant.dart';
import 'package:cars_and_alll/app/controller/auth_controller.dart';
import 'package:cars_and_alll/app/extensions/build_context_theme_extension.dart';
import 'package:cars_and_alll/app/extensions/spacing_extension.dart';
import 'package:cars_and_alll/app/routes/app_routes.dart';
import 'package:cars_and_alll/app/screens/auth/OtpDialog.dart';
import 'package:cars_and_alll/app/utils/customSnackBar.dart';
import 'package:cars_and_alll/app/widgets/button/custom_elevated_button.dart';
import 'package:cars_and_alll/app/widgets/textfield/custom_text_form_feild.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:cars_and_alll/shared/theme/custom_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/route_manager.dart';
import 'package:go_router/go_router.dart';

class LoginWithPhoneScreen extends GetView<AuthController> {
  LoginWithPhoneScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<TooltipState> tooltipKey = GlobalKey<TooltipState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // leading: const BackButton(color: Colors.black),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: 24.paddingHorizontal,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.splashBackground,
                  backgroundImage: AssetImage(
                    AssetConstant.appLogoSqr,
                  ),
                ),
                24.space,

                // Sign In
                Text(
                  tr('sign_in'),
                  style: context.textTheme.titleLarge?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: context.colorScheme.onSurface),
                  textAlign: TextAlign.center,
                ),
                34.space,

                CustomTextFormField(
                  fillColor: Colors.transparent,
                  labelText: tr("mobile_no"),
                  hintText: tr("enter_mobile"),
                  controller: controller.phone,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Phone number cannot be empty';
                    }
                    if (value.trim().length != 10 || int.tryParse(value.trim()) == null) {
                      return 'Invalid phone number (Must be 10 digits)';
                    }
                    return null;
                  },
                  textStyle: CustomTextStyle.txtPoppins14Black700.copyWith(
                    fontWeight: FontWeight.w400
                  ),
                ),
                30.space,
                CustomElevatedButton(
                  text: tr("send_otp"),
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      if(controller.agreeToTermsLoginPage.value) {
                        controller.loginUserByPhone();
                      } else {
                        tooltipKey.currentState!.ensureTooltipVisible();
                        controller.showCheckboxError.value = true;
                      }
                    } else {
                      if(controller.agreeToTermsLoginPage.value) {
                        tooltipKey.currentState!.ensureTooltipVisible();
                        controller.showCheckboxError.value = false;
                      } else {
                        tooltipKey.currentState!.ensureTooltipVisible();
                        controller.showCheckboxError.value = true;
                      }
                    }
                  },
                  buttonTextStyle: context.textTheme.labelLarge?.copyWith(
                    color: context.colorScheme.surface,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1.2,
                  ),
                ),
                20.space,
                CustomElevatedButton(
                  text: tr("login_email"),
                  onPressed: () {
                    Get.toNamed(AppRoutes.loginWithEmail);
                  },
                  buttonTextStyle: context.textTheme.labelLarge?.copyWith(
                    color: context.colorScheme.surface,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 1.2,
                  ),
                ),
                20.space,
                Text(
                  tr("forgot_password"),
                  style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.colorScheme.primary
                  ),
                  textAlign: TextAlign.center,
                ),
                16.space,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Tooltip(
                        key: tooltipKey,
                        message: 'Agree to terms and conditions',
                        child: Obx(
                           () {
                              return Checkbox(
                                value: controller.agreeToTermsLoginPage.value,

                                onChanged: (value) {
                                  controller.agreeToTermsLoginPage.value = value ?? false;
                                },
                                activeColor: const Color(0xFFFFC107),
                                fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                                  if (states.contains(WidgetState.selected)) {
                                    return AppColors.secondaryLight;
                                  }
                                  return Colors.transparent;
                                }),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                side: controller.showCheckboxError.value ? BorderSide(
                                  color: Colors.red,
                                  width: 2,
                                ) : BorderSide(color: Colors.grey.shade300),
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,

                              );
                            }
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black87,
                            height: 1.5,
                          ),
                          children: [
                            TextSpan(
                                text: tr('agree_text')),
                            TextSpan(
                              text: ' ${tr('terms')}',
                              style: TextStyle(color: Colors.blue[700]),
                            ),
                            TextSpan(text: ' ${tr("and")} '),
                            TextSpan(
                              text: tr("privacy_policy"),
                              style: TextStyle(color: Colors.blue[700]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                Text(
                  tr('or_signup'),
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Google Button
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: Center(
                        child: Text(
                          'G',
                          style: TextStyle(
                            color: Colors.red[400],
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Facebook Button
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: Center(
                        child: Text(
                          'f',
                          style: TextStyle(
                            color: Colors.blue[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      tr("no_account"),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.userSelection);
                      },
                      child: Text(
                        ' ${tr("signup")}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[700],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
