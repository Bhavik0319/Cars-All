import 'package:cars_and_alll/app/constants/assetConstant.dart';
import 'package:cars_and_alll/app/services/user.dart';
import 'package:cars_and_alll/app/widgets/decoratedContainer.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../shared/theme/custom_text_style.dart';
import '../../../../routes/app_routes.dart';
import '../../../../utils/scale_utility.dart';
import '../../controller/editProfileController.dart';
class EditProfileScreen extends GetView<EditProfileController> {
  const EditProfileScreen({super.key});

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
                  tr('edit_profile'),
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    fontSize: scale.getScaledFont(20),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.showPickerOptions(context);
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Obx(
                      () {
                        return controller.selectedImage!.value.path != "" ? Image.file(
                          controller.selectedImage!.value,
                          height: scale.getScaledHeight(65),
                          width: scale.getScaledWidth(65),
                        ) : Container(
                          height: scale.getScaledHeight(65),
                          width: scale.getScaledWidth(65),
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                UserStore.to.profile.userProfileImage!.first,
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: CircleAvatar(
                            backgroundColor: AppColors.primaryLight,
                            radius: 13,
                            child: Icon(
                              Icons.edit,
                              color: AppColors.white,
                              size: scale.getScaledFont(8),
                            ),
                          ),
                        );
                      }
                    ),
                  ),
                ),
                SizedBox(
                  height: scale.getScaledHeight(10),
                ),
                Text(
                 '${tr('full_name')}*',
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
                    controller: controller.nameController,
                    enabled: false,
                    style: CustomTextStyle.txtPoppins14Black700.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.black828282,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter your full name',
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
                SizedBox(
                  height: scale.getScaledHeight(15),
                ),
                Text(
                  '${tr('mobile_no')}*',
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
                    controller: controller.phoneController,
                    enabled: false,
                    style: CustomTextStyle.txtPoppins14Black700.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.black828282,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter your number',
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
                SizedBox(
                  height: scale.getScaledHeight(15),
                ),

                Text(
                  '${tr('email')}*',
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
                    controller: controller.emailController,
                    enabled: false,
                    style: CustomTextStyle.txtPoppins14Black700.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.black828282,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
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
                SizedBox(
                  height: scale.getScaledHeight(15),
                ),
                Text(
                  '${tr('bio_description_optional')} ✎',
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
                    controller: controller.bioController,
                    maxLines: 3,
                    style: CustomTextStyle.txtPoppins14Black700.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.black828282,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter short description',
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
                SizedBox(
                  height: scale.getScaledHeight(15),
                ),
                Text(
                  '${tr('website_social_link')} ✎',
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
                    controller: controller.websiteController,
                    style: CustomTextStyle.txtPoppins14Black700.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.black828282,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Link',
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
                SizedBox(
                  height: scale.getScaledHeight(15),
                ),

                SizedBox(
                  width: scale.fw,
                  height: scale.getScaledHeight(40),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.updateProfile();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: scale.getPadding(
                        vertical: 20,
                      ),
                    ),
                    child: Text(
                      tr('save'),
                      style: CustomTextStyle.txtPoppins12Black500.copyWith(
                        color: AppColors.white,
                        fontSize: scale.getScaledFont(15),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: scale.fw,
                  margin: scale.getMargin(
                    top: 10,
                    bottom: 30,
                  ),
                  height: scale.getScaledHeight(40),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(6),
                        side: BorderSide(
                          color: AppColors.secondaryLight
                        )
                      ),
                      padding: scale.getPadding(
                        vertical: 20,
                      ),
                    ),
                    child: Text(
                      tr('cancel'),
                      style: CustomTextStyle.txtPoppins12Black500.copyWith(
                        color: AppColors.black,
                        fontSize: scale.getScaledFont(15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
