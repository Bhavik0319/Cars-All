
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../shared/theme/custom_text_style.dart';
import '../../../../utils/scale_utility.dart';
class VerifyDeviceScreen extends StatelessWidget {
  const VerifyDeviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Container(
          margin: scale.getMargin(
            horizontal: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
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
                SizedBox(
                  height: scale.getScaledHeight(10),
                ),
                Text(
                  'Verify Device & Mobile No',
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    fontSize: scale.getScaledFont(20),
                  ),
                ),
                SizedBox(
                  height: scale.getScaledHeight(5),
                ),
                Text(
                  'We need to send SMS from your mobile number to verify your device',
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    fontSize: scale.getScaledFont(12),
                    color: AppColors.black828282,
                  ),
                ),
                SizedBox(
                  height: scale.getScaledHeight(15),
                ),
                Text(
                  'Choose SIM linked to',
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    fontSize: scale.getScaledFont(12),
                    color: AppColors.black828282,
                  ),
                ),
                SizedBox(
                  height: scale.getScaledHeight(5),
                ),
                Padding(
                  padding: scale.getPadding(horizontal: 3),
                  child: TextFormField(
                    style: CustomTextStyle.txtPoppins14Black700.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.black828282,
                    ),
                    decoration: InputDecoration(
                      hintText: '+91 xxxxx xxxxx',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffBDBDBD),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xffBDBDBD),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Color(0xffBDBDBD),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Color(0xffBDBDBD),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: scale.getMargin(
          all: 20
        ),
        width: scale.fw,
        height: scale.getScaledHeight(40),
        child: ElevatedButton(
          onPressed: () {

          },
          style: ElevatedButton.styleFrom(
            padding: scale.getPadding(
              vertical: 20,
            ),
          ),
          child: Text(
            'Save',
            style: CustomTextStyle.txtPoppins12Black500.copyWith(
              color: AppColors.white,
              fontSize: scale.getScaledFont(15),
            ),
          ),
        ),
      ),
    );
  }
}
