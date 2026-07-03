import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cars_and_alll/app/screens/profile/controller/controller.dart';
import 'package:cars_and_alll/app/utils/customSnackBar.dart';
import 'package:cars_and_alll/app/widgets/decoratedContainer.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../shared/theme/custom_text_style.dart';
import '../../../../utils/scale_utility.dart';

class ContactScreen extends GetView<ProfileController> {
  const ContactScreen({super.key});

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
                  onTap: (){
                    Get.back();
                  },
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xFFF7F3EA),
                      child:
                      const Icon(Icons.arrow_back, color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    tr("contact_support"),
                    style: CustomTextStyle.txtPoppins12Black500.copyWith(
                      fontSize: scale.getScaledFont(20),
                    ),
                  ),
                ),
                SizedBox(
                  height: scale.getScaledHeight(10),
                ),
                Text(
                  tr('select_subject_topic'),
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    fontSize: scale.getScaledFont(12),
                    color: AppColors.black828282,
                  ),
                ),
                SizedBox(
                  height: scale.getScaledHeight(5),
                ),
                Padding(
                  padding: scale.getPadding(right: 3),
                  child: DropdownButtonFormField2<String>(
                    isDense: true,
                    decoration: InputDecoration(
                      isDense: true,
                      suffixIcon: Container(
                        padding: scale.getPadding(
                            all: 4
                        ),
                        margin: scale.getMargin(
                          left: 10,
                          right: 10,
                          bottom: 10,
                          top: 10,
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Color(0xff808080)
                            )
                        ),
                        child: Image.asset(
                          'assets/images/pencil_icon.png',
                          height: scale.getScaledHeight(13),
                        ),
                      ),
                      contentPadding: scale.getPadding(vertical: 10),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(
                          color: Color(0xffBDBDBD),
                          width: 1,
                        ),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(
                          color: Color(0xffBDBDBD),
                          width: 1,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(
                          color: Color(0xffBDBDBD),
                          width: 1,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(
                          color: Color(0xffBDBDBD),
                          width: 1,
                        ),
                      ),
                    ),
                    items: ['My Orders / Purchases', 'Vehicle Listings', 'Payments & Refunds', 'Account/Profile Issues', 'Documents / KYC', 'Other'].map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: CustomTextStyle.txtPoppins10W400.copyWith(
                          color: AppColors.black,
                          fontSize: scale.getScaledFont(10),
                        ),
                      ),
                    )).toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select your fuel type.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      controller.subjectTopic.value = value!;
                    },
                    buttonStyleData: ButtonStyleData(
                    ),
                    iconStyleData: IconStyleData(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: scale.getScaledFont(24),
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    menuItemStyleData: MenuItemStyleData(
                      padding: scale.getPadding(horizontal: 16),
                    ),
                  ),
                ),
                SizedBox(
                  height: scale.getScaledHeight(15),
                ),
                Text(
                  tr('full_name'),
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
                    controller: controller.name,
                    style: CustomTextStyle.txtPoppins14Black700.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.black828282,
                    ),
                    decoration: InputDecoration(
                      hintText: tr('full_name'),
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
                  tr('email'),
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
                    controller: controller.email,
                    style: CustomTextStyle.txtPoppins14Black700.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.black828282,
                    ),
                    decoration: InputDecoration(
                      hintText: tr('email'),
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
                  height: scale.getScaledHeight(5),
                ),
                SizedBox(
                  height: scale.getScaledHeight(15),
                ),
                Text(
                  tr('mobile_no'),
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
                    controller: controller.phone,
                    style: CustomTextStyle.txtPoppins14Black700.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.black828282,
                    ),
                    decoration: InputDecoration(
                      hintText: tr('mobile_no'),
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
                  height: scale.getScaledHeight(5),
                ),
                Text(
                  tr('description'),
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
                    controller: controller.message,
                    maxLines: 5,
                    style: CustomTextStyle.txtPoppins14Black700.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.black828282,
                    ),
                    decoration: InputDecoration(
                      hintText: tr('description'),
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

                Container(
                  width: scale.fw,
                  height: scale.getScaledHeight(45),
                  margin: scale.getMargin(
                      bottom: 30,
                    top: 40,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryLight,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      if(controller.subjectTopic.value.isNotEmpty) {
                        if(controller.name.text.isNotEmpty && controller.email.text.isNotEmpty && controller.phone.text.isNotEmpty && controller.message.text.isNotEmpty) {
                          controller.contactSupport();
                        }else {
                          customSnackBar(
                            type: AnimatedSnackBarType.error,
                            message: 'Please fill all the information',
                          );
                        }
                      } else {
                        customSnackBar(
                          type: AnimatedSnackBarType.error,
                          message: 'Please select a subject topic',
                        );
                      }
                    },
                    child: Text(
                      tr("submit_request"),
                      style: CustomTextStyle.txtPoppins14Black700.copyWith(
                        fontSize: scale.getScaledFont(16),
                        color: Colors.white,
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
