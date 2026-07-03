
import 'package:cars_and_alll/app/constants/assetConstant.dart';
import 'package:cars_and_alll/app/routes/app_routes.dart';
import 'package:cars_and_alll/shared/theme/custom_text_style.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/color/app_color.dart';
import '../../services/storage.dart';
import '../../utils/scale_utility.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Scaffold(
      backgroundColor: AppColors.splashBackground,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetConstant.appLogo,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: scale.getScaledHeight(253),
        padding: scale.getPadding(top: 35, bottom: 75, left: 23, right: 23),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(scale.getScaledFont(60)),
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: scale.getMargin(
                left: 10,
                right: 10,
              ),
              width: scale.getScaledWidth(140),
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButtonFormField2<String>(
                isDense: true,
                value: 'en',
                style: CustomTextStyle.txtPoppins16Black500.copyWith(
                  color: AppColors.primaryLight,
                  fontWeight: FontWeight.w500,
                  fontSize: scale.getScaledFont(10),
                ),
                decoration: InputDecoration(
                  isDense: true,
                  focusColor: AppColors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                hint: Text(
                  'Language',
                  style: CustomTextStyle.txtPoppins16Black500.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: scale.getScaledFont(16),
                  ),
                ),
                items: [
                  DropdownMenuItem(
                    value: 'en',
                    child: Text(
                      "English",
                      style: CustomTextStyle.txtPoppins14Black700.copyWith(
                        color: AppColors.secondaryLight,
                        fontWeight: FontWeight.w500,
                        fontSize: scale.getScaledFont(14),
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'hi',
                    child: Text(
                      "हिन्दी",
                      style: CustomTextStyle.txtPoppins14Black700.copyWith(
                        color: AppColors.secondaryLight,
                        fontWeight: FontWeight.w500,
                        fontSize: scale.getScaledFont(14),
                      ),
                    ),
                  ),

                  DropdownMenuItem(
                    value: 'ta',
                    child: Text(
                      "தமிழ்",
                      style: CustomTextStyle.txtPoppins14Black700.copyWith(
                        color: AppColors.secondaryLight,
                        fontWeight: FontWeight.w500,
                        fontSize: scale.getScaledFont(14),
                      ),
                    ),
                  ),

                  DropdownMenuItem(
                    value: 'te',
                    child: Text(
                      "తెలుగు",
                      style: CustomTextStyle.txtPoppins14Black700.copyWith(
                        color: AppColors.secondaryLight,
                        fontWeight: FontWeight.w500,
                        fontSize: scale.getScaledFont(14),
                      ),
                    ),
                  ),

                  DropdownMenuItem(
                    value: 'ml',
                    child: Text(
                      "മലയാളം",
                      style: CustomTextStyle.txtPoppins14Black700.copyWith(
                        color: AppColors.secondaryLight,
                        fontWeight: FontWeight.w500,
                        fontSize: scale.getScaledFont(14),
                      ),
                    ),
                  ),

                  DropdownMenuItem(
                    value: 'mr',
                    child: Text(
                      "मराठी",
                      style: CustomTextStyle.txtPoppins14Black700.copyWith(
                        color: AppColors.secondaryLight,
                        fontWeight: FontWeight.w500,
                        fontSize: scale.getScaledFont(14),
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'ur',
                    child: Text(
                      "اردو",
                      style: CustomTextStyle.txtPoppins14Black700.copyWith(
                        color: AppColors.secondaryLight,
                        fontWeight: FontWeight.w500,
                        fontSize: scale.getScaledFont(14),
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'kn',
                    child: Text(
                      "ಕನ್ನಡ",
                      style: CustomTextStyle.txtPoppins14Black700.copyWith(
                        color: AppColors.secondaryLight,
                        fontWeight: FontWeight.w500,
                        fontSize: scale.getScaledFont(14),
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'gu',
                    child: Text(
                      "ગુજરાતી",
                      style: CustomTextStyle.txtPoppins14Black700.copyWith(
                        color: AppColors.secondaryLight,
                        fontWeight: FontWeight.w500,
                        fontSize: scale.getScaledFont(14),
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'bn',
                    child: Text(
                      "বাংলা",
                      style: CustomTextStyle.txtPoppins14Black700.copyWith(
                        color: AppColors.secondaryLight,
                        fontWeight: FontWeight.w500,
                        fontSize: scale.getScaledFont(14),
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'as',
                    child: Text(
                      "অসমীয়া",
                      style: CustomTextStyle.txtPoppins14Black700.copyWith(
                        color: AppColors.secondaryLight,
                        fontWeight: FontWeight.w500,
                        fontSize: scale.getScaledFont(14),
                      ),
                    ),
                  ),
                ],
                validator: (value) {
                  if (value == null) {
                    return 'Please select a language';
                  }
                  return null;
                },
                onChanged: (value) async {
                  await StorageService.to.setString("language", value!);
                },
                buttonStyleData: ButtonStyleData(
                  padding: scale.getPadding(
                    horizontal: 0,
                    vertical: 0,
                  ),
                ),
                iconStyleData: IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down_sharp,
                    color: AppColors.secondaryLight,
                  ),
                  iconSize: scale.getScaledFont(25),
                ),
                dropdownStyleData: DropdownStyleData(
                  offset: Offset(0, -5),
                  maxHeight: scale.getScaledHeight(400),
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                menuItemStyleData: MenuItemStyleData(
                  padding: scale.getPadding(left: 8),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                String langCode = StorageService.to.getString("language");
                print(langCode);
                if (langCode.isEmpty) {
                  langCode = "en";
                  print(langCode);
                  await StorageService.to.setString("language", langCode);
                }
                await context.setLocale(Locale(langCode));
                Get.updateLocale(Locale(langCode));
                if(langCode == 'en') {
                  Get.offAllNamed(AppRoutes.homeNav);
                }
              },
              child: Container(
                width: scale.getScaledWidth(110),
                alignment: Alignment.center,
                margin: scale.getMargin(
                  top: 30,
                ),
                padding: scale.getPadding(
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.secondaryLight,
                  borderRadius: BorderRadius.circular(scale.getScaledFont(73))
                ),
                child: Text(
                  'Go',
                  style: CustomTextStyle.txtPoppins18Black500.copyWith(
                    color: AppColors.white
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
