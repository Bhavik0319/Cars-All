import 'package:cars_and_alll/app/extensions/spacing_extension.dart';
import 'package:cars_and_alll/app/routes/app_routes.dart';
import 'package:cars_and_alll/app/services/user.dart';
import 'package:cars_and_alll/shared/theme/custom_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/color/app_color.dart';
import '../constants/assetConstant.dart';
import '../utils/scale_utility.dart';

class LogoutPopup extends StatelessWidget {
  const LogoutPopup({super.key});

  @override
  Widget build(BuildContext context) {

    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

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
            20.space,
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 20
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: AppColors.splashBackground,
                    backgroundImage: NetworkImage(
                      UserStore.to.profile.userProfileImage!.first,
                    ),
                  ),
                  20.space,
                  SizedBox(
                    width: scale.getScaledWidth(150),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: '',
                        style: CustomTextStyle.txtPoppins16Black500.copyWith(
                          color: AppColors.primaryLight,
                          fontSize: scale.getScaledFont(12),
                        ),
                        children: [
                          TextSpan(
                            text: ' ${tr('logout_confirmation_line1')} ',
                            style: CustomTextStyle.txtPoppins16Black500.copyWith(
                              fontSize: scale.getScaledFont(12),
                            ),
                          ),
                          TextSpan(
                            text: '${tr('logout_confirmation_line2')}?',
                            style: CustomTextStyle.txtPoppins16Black500.copyWith(
                              color: AppColors.primaryLight,
                              fontSize: scale.getScaledFont(12),
                            ),
                          ),
                        ]
                      ),
                    ),
                  ),
                  20.space,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.redCheckColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      minimumSize: Size(double.infinity, 65),
                    ),
                    onPressed: () async{
                      UserStore.to.onLogout();
                    },
                    child: Text(
                      tr("logout"),
                      style: CustomTextStyle.txtPoppins16Black500.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(5),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      minimumSize: Size(double.infinity, 65),
                    ),
                    onPressed: () async{
                      Get.back();
                    },
                    child: Text(
                      tr("cancel"),
                      style: CustomTextStyle.txtPoppins16Black500.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: scale.getScaledFont(14),
                      ),
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
