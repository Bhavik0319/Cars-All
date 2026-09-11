import 'package:cars_and_alll/app/constants/assetConstant.dart';
import 'package:cars_and_alll/app/extensions/build_context_theme_extension.dart';
import 'package:cars_and_alll/app/extensions/spacing_extension.dart';
import 'package:cars_and_alll/app/routes/app_routes.dart';
import 'package:cars_and_alll/shared/theme/custom_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../shared/color/app_color.dart';

class OtpVerificationDialog extends StatefulWidget {
  final Function(String) onVerify;
  final Function() resendOtp;
  const OtpVerificationDialog({super.key, required this.onVerify, required this.resendOtp});

  @override
  _OtpVerificationDialogState createState() => _OtpVerificationDialogState();
}

class _OtpVerificationDialogState extends State<OtpVerificationDialog> {

  TextEditingController otpController = TextEditingController();

  bool isInvalid = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: Icon(
                  Icons.close,
                ),
              ),
            ),
            20.space,
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColors.splashBackground,
                    backgroundImage: AssetImage(
                      AssetConstant.appLogoSqr,
                    ),
                  ),
                  20.space,
                  Text(
                    tr("almost_done"),
                    style: CustomTextStyle.txtPoppins12Black500.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: context.colorScheme.onSurface),
                  ),
                  16.space,
                  PinCodeTextField(
                    length: 4,
                    appContext: context,
                    controller: otpController,
                    keyboardType: TextInputType.number,
                    textStyle: CustomTextStyle.txtPoppins12Black500.copyWith(
                      color: Color(0xff9095A0),
                    ),
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: 50,
                      fieldWidth: 50,
                      activeFillColor: Colors.transparent,
                      activeColor: isInvalid ? Colors.red : Color(0xff9095A0),
                      selectedColor:context.colorScheme.onSurface,
                      inactiveColor: Colors.grey,

                      errorBorderColor: isInvalid ? Colors.red : context.colorScheme.secondaryContainer,
                    ),
                    onChanged: (value) {
                      setState(() {
                        isInvalid = false;
                        isLoading = false;
                      });
                    },
                  ),
                  if (isInvalid)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        tr("enter_valid_code"),
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ),
                  16.space,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondaryLight,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: Size(double.infinity, 65),
                    ),
                    onPressed: () async{
                      setState(() {
                        isLoading = true;
                      });
                      setState(() {
                        isLoading = false;
                      });
                      await widget.onVerify(otpController.text);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        isLoading ? SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        ) : SizedBox.shrink(),
                        10.spaceHorizontal,
                        Text(tr("verify"), style: TextStyle(color: Colors.white, fontSize: 16)),
                      ],
                    ),
                  ),
                  20.space,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        tr("otp_not_received"),
                        style: CustomTextStyle.txtPoppins12Black500.copyWith(
                            fontSize: 14,
                            color: AppColors.primaryLight
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          widget.resendOtp();
                        },
                        child: Text(
                          " ${tr('resend_now')}",
                          style: CustomTextStyle.txtPoppins12Black500.copyWith(
                              fontSize: 14,
                              color: AppColors.primaryLight
                          ),
                        ),
                      ),
                    ],
                  ),
                  20.space,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
