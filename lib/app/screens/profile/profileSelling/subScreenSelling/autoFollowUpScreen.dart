import 'package:cars_and_alll/app/screens/profile/controller/controller.dart';
import 'package:cars_and_alll/shared/theme/custom_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../shared/color/app_color.dart';
import '../../../../services/user.dart';
import '../../../../utils/scale_utility.dart';

class AutoFollowUpScreen extends GetView<ProfileController> {
  const AutoFollowUpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: scale.getMargin(
            horizontal: 20,
          ),
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
                height: scale.getScaledHeight(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tr('auto_followup'),
                    style: CustomTextStyle.txtPoppins12Black500.copyWith(
                      fontSize: scale.getScaledFont(20),
                    ),
                  ),
                  Obx(
                    () {
                      return Switch(
                        value: UserStore.to.autoFollowUp.value,
                        activeTrackColor: AppColors.secondaryLight,
                        activeColor: Colors.white,
                        inactiveThumbColor: AppColors.primaryLight,
                        onChanged: (e) {
                          UserStore.to.setFollowUp(e);
                        },
                      );
                    }
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
