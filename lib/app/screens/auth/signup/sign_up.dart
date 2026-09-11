import 'package:cars_and_alll/app/controller/auth_controller.dart';
import 'package:cars_and_alll/app/extensions/build_context_theme_extension.dart';
import 'package:cars_and_alll/app/extensions/spacing_extension.dart';
import 'package:cars_and_alll/app/routes/app_routes.dart';
import 'package:cars_and_alll/app/widgets/button/custom_elevated_button.dart';
import 'package:cars_and_alll/app/widgets/textfield/custom_text_form_feild.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:cars_and_alll/shared/theme/custom_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';
import 'package:get/route_manager.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/assetConstant.dart';
import '../../../utils/scale_utility.dart';
import '../OtpDialog.dart';

class SignUpScreen extends GetView<AuthController> {
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<TooltipState> tooltipKey = GlobalKey<TooltipState>();
  final GlobalKey<TooltipState> showNumberToolTip = GlobalKey<TooltipState>();


  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: BackButton(color: context.colorScheme.onSurface,onPressed: (){Get.back();},),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: Colors.transparent,
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
                  radius: scale.getScaledFont(50),
                  backgroundColor: AppColors.splashBackground,
                  backgroundImage: AssetImage(
                    AssetConstant.appLogoSqr,
                  ),
                ),
                20.space,
                // Create Account Title
                Text(
                  tr('create_account'),
                  style: context.textTheme.titleLarge?.copyWith(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: context.colorScheme.onSurface),
                  textAlign: TextAlign.center,
                ),

                34.space,

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      fillColor: Colors.transparent,
                      labelText: tr('enter_name'),
                      hintText: tr('enter_your_name'),
                      controller: controller.name,
                      textStyle: CustomTextStyle.txtPoppins14Black700.copyWith(
                          fontWeight: FontWeight.w400
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Name cannot be empty';
                        }
                        return null;
                      },
                    ),
                    15.space,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: (){
                            showNumberToolTip.currentState?.ensureTooltipVisible();
                          },
                          child: Tooltip(
                            key: showNumberToolTip,
                            verticalOffset: 20,
                            margin: scale.getMargin(
                              horizontal: 20,
                            ),
                            message: 'Note: This will show your number to buyers and sellers so deals close faster!',
                            child: Image.asset(
                              'assets/images/info_icon.png',
                              height: scale.getScaledHeight(14),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: scale.getScaledWidth(4),
                        ),
                        Text(
                          tr('show_number'),
                          style: CustomTextStyle.txtPoppins10W400.copyWith(
                            fontSize: scale.getScaledFont(9),
                            color: Color(0xff808080),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          width: scale.getScaledWidth(5),
                        ),
                        Obx(
                          () {
                            return Switch(
                              value: controller.showPhoneNumber.value,
                              activeColor: Colors.transparent,
                              inactiveThumbColor: AppColors.primaryLight,
                              activeTrackColor: AppColors.primaryLight,
                              onChanged: (val) {
                                controller.showPhoneNumber.value = val;
                              },
                              trackOutlineColor: WidgetStateProperty.all(Color(0xffB4B4B4)),
                            );
                          }
                        )
                      ],
                    ),
                    SizedBox(
                      height: scale.getScaledHeight(2),
                    ),
                    Obx(
                      () {
                        return CustomTextFormField(
                          fillColor: Colors.transparent,
                          labelText: tr('mobile_no'),
                          hintText: tr('enter_mobile'),
                          controller: controller.phone,
                          obscureText: controller.showPhoneNumber.value,
                          textStyle: CustomTextStyle.txtPoppins14Black700.copyWith(
                              fontWeight: FontWeight.w400
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Phone number cannot be empty';
                            }
                            if (value.trim().length != 10 || int.tryParse(value.trim()) == null) {
                              return 'Invalid phone number (Must be 10 digits)';
                            }
                            return null;
                          },
                        );
                      }
                    ),
                    24.space,
                    CustomTextFormField(
                      fillColor: Colors.transparent,
                      labelText: tr("email"),
                      hintText: tr("enter_email"),
                      controller: controller.email,
                      textStyle: CustomTextStyle.txtPoppins14Black700.copyWith(
                          fontWeight: FontWeight.w400
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Email cannot be empty';
                        }
                        if (!value.trim().isEmail) {
                          return 'Invalid email';
                        }
                        return null;
                      },
                      suffix: Icon(
                        Icons.mail_outlined,
                        size: scale.getScaledHeight(20),
                        color: const Color(0xff171a1f).withOpacity(0.54),
                      ),
                    ),
                    24.space,
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
                                  value: controller.agreeToTermsRegisterPage.value,
                                  onChanged: (value) {
                                      controller.agreeToTermsRegisterPage.value = value ?? false;
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
                                  side: controller.showCheckboxErrorRegister.value ? BorderSide(
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
                                    text: '${tr('agree_text')}',
                                ),
                                TextSpan(
                                  text: ' ${tr('terms')}',
                                  style: TextStyle(color: Colors.blue[700]),
                                ),
                                const TextSpan(text: ' and '),
                                TextSpan(
                                  text: ' ${tr('privacy_policy')}',
                                  style: TextStyle(color: Colors.blue[700]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    20.space,
                    CustomElevatedButton(
                      text: tr("continue"),
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          if(controller.agreeToTermsRegisterPage.value) {
                            controller.registerUser();
                          } else {
                            tooltipKey.currentState!.ensureTooltipVisible();
                            controller.showCheckboxErrorRegister.value = true;
                          }
                        } else {
                          if(controller.agreeToTermsRegisterPage.value) {
                            tooltipKey.currentState!.ensureTooltipVisible();
                            controller.showCheckboxErrorRegister.value = false;
                          } else {
                            tooltipKey.currentState!.ensureTooltipVisible();
                            controller.showCheckboxErrorRegister.value = true;
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
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
