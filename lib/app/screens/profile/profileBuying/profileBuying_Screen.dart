import 'package:cars_and_alll/app/constants/assetConstant.dart';
import 'package:cars_and_alll/app/routes/app_routes.dart';
import 'package:cars_and_alll/app/widgets/logout_popup.dart';
import 'package:cars_and_alll/app/utils/scale_utility.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:cars_and_alll/shared/theme/custom_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';

class ProfileBuyingScreen extends GetView<ProfileController> {
  const ProfileBuyingScreen({super.key});


  @override
  Widget build(BuildContext context) {

    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Container(
      color: AppColors.backgroundColor,
      child: SingleChildScrollView(
        child: Padding(
          padding: scale.getPadding(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///  == Quick Actions
              Text(
                tr('quick_action'),
                style: CustomTextStyle.txtPoppins16Black500,
              ),

              SizedBox(
                height: scale.getScaledHeight(10),
              ),
              /// -- My Purchases
              ListTile(
                onTap: (){
                  Get.toNamed(AppRoutes.recentlyViewVehicle);
                },
                leading: Container(
                  height: scale.getScaledHeight(26),
                  width: scale.getScaledWidth(26),
                  padding: scale.getPadding(
                    all: 4,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: SvgPicture.asset(
                    AssetConstant.carIcon,
                    height: scale.getScaledHeight(14),
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  tr('recently_viewed'),
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    fontSize: scale.getScaledFont(14),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded, color: Colors.black, size: 16,),
              ),


              Container(
                margin: scale.getMargin(
                  vertical: 5,
                ),
                child: Divider(
                  color: Color(0xffF2F4F7),
                ),
              ),


              ListTile(
                onTap: (){
                  ///TODO: Need to add navigation
                  Get.toNamed(AppRoutes.savedVehicle);
                },
                leading: Container(
                  height: scale.getScaledHeight(26),
                  width: scale.getScaledWidth(26),
                  padding: scale.getPadding(
                    all: 4,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: SvgPicture.asset(
                    AssetConstant.carIcon,
                    height: scale.getScaledHeight(14),
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  tr("saved_vehicle"),
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    fontSize: scale.getScaledFont(14),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded, color: Colors.black, size: 16,),
              ),

              Container(
                margin: scale.getMargin(
                  vertical: 5,
                ),
                child: Divider(
                  color: Color(0xffF2F4F7),
                ),
              ),

              /// -- Chat with Seller
              ListTile(
                onTap: (){
                  Get.toNamed(AppRoutes.shareMyNumber);
                },
                leading: Container(
                  height: scale.getScaledHeight(26),
                  width: scale.getScaledWidth(26),
                  padding: scale.getPadding(
                    all: 4,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: SvgPicture.asset(
                    AssetConstant.chat,
                    height: scale.getScaledHeight(14),
                    color: Colors.white,
                  ),
                ),
                title:  Text(
                  tr('chat_settings'),
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    fontSize: scale.getScaledFont(14),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded, color: Colors.black, size: 16,),
              ),

              Container(
                margin: scale.getMargin(
                  vertical: 5,
                ),
                child: Divider(
                  color: Color(0xffF2F4F7),
                ),
              ),
              /// -- Rated Sellers
              ListTile(
                onTap: (){
                  Get.toNamed(AppRoutes.ratedSeller);
                },
                leading: Container(
                  height: scale.getScaledHeight(26),
                  width: scale.getScaledWidth(26),
                  decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Icon(Icons.star, color: Colors.white, size: 20,),
                ),
                title: Text(
                  tr('rated_seller'),
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    fontSize: scale.getScaledFont(14),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded, color: Colors.black, size: 16,),
              ),

              // Container(
              //   margin: scale.getMargin(
              //     vertical: 5,
              //   ),
              //   child: Divider(
              //     color: Color(0xffF2F4F7),
              //   ),
              // ),
              // ListTile(
              //   onTap: () {
              //     Get.toNamed(AppRoutes.serviceHistoryScreen);
              //   },
              //   leading: Container(
              //     height: scale.getScaledHeight(26),
              //     width: scale.getScaledWidth(26),
              //     padding: scale.getPadding(
              //       all: 4,
              //     ),
              //     decoration: BoxDecoration(
              //         color: Colors.orangeAccent,
              //         borderRadius: BorderRadius.circular(50)
              //     ),
              //     child: SvgPicture.asset(
              //       AssetConstant.chatIcon,
              //       color: Colors.white,
              //     ),
              //   ),
              //   title: Text(
              //     "Service History",
              //     style: CustomTextStyle.txtPoppins12Black500.copyWith(
              //       fontSize: scale.getScaledFont(14),
              //       fontWeight: FontWeight.w400,
              //     ),
              //   ),
              //   trailing: Icon(Icons.arrow_forward_ios_rounded, color: Colors.black, size: 16,),
              // ),

              Container(
                margin: scale.getMargin(
                  vertical: 10,
                ),
                child: Divider(
                  color: Color(0xffC2C2C2),
                ),
              ),
              ///  == Personal Settings
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  tr('personal_settings'),
                  style: CustomTextStyle.txtPoppins16Black500,
                ),
              ),

              SizedBox(
                height: scale.getScaledHeight(10),
              ),
              /// -- My Purchases
              ListTile(
                onTap: (){
                  Get.toNamed(AppRoutes.editProfileScreen);
                },
                leading: Container(
                  height: scale.getScaledHeight(26),
                  width: scale.getScaledWidth(26),
                  padding: scale.getPadding(
                    all: 4,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: SvgPicture.asset(
                    AssetConstant.personIcon,
                    height: scale.getScaledHeight(14),
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  tr("edit_profile"),
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    fontSize: scale.getScaledFont(14),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded, color: Colors.black, size: 16,),
              ),

              // Container(
              //   margin: scale.getMargin(
              //     vertical: 5,
              //   ),
              //   child: Divider(
              //     color: Color(0xffF2F4F7),
              //   ),
              // ),
              //
              // ListTile(
              //   onTap: (){
              //     Get.toNamed(AppRoutes.paymentMethodScreen);
              //   },
              //   leading: Container(
              //     height: scale.getScaledHeight(26),
              //     width: scale.getScaledWidth(26),
              //     padding: scale.getPadding(
              //       all: 4,
              //     ),
              //     decoration: BoxDecoration(
              //         color: Colors.orangeAccent,
              //         borderRadius: BorderRadius.circular(50)
              //     ),
              //     child: SvgPicture.asset(
              //       AssetConstant.carIcon,
              //       height: scale.getScaledHeight(14),
              //       color: Colors.white,
              //     ),
              //   ),
              //   title:  Text(
              //     "Payment Methods",
              //     style: CustomTextStyle.txtPoppins12Black500.copyWith(
              //       fontSize: scale.getScaledFont(14),
              //       fontWeight: FontWeight.w400,
              //     ),
              //   ),
              //   trailing: Icon(Icons.arrow_forward_ios_rounded, color: Colors.black, size: 16,),
              // ),

              Container(
                margin: scale.getMargin(
                  vertical: 5,
                ),
                child: Divider(
                  color: Color(0xffF2F4F7),
                ),
              ),
              ListTile(
                onTap: (){
                  Get.toNamed(AppRoutes.getStarted);
                },
                leading: Container(
                  height: scale.getScaledHeight(26),
                  width: scale.getScaledWidth(26),
                  padding: scale.getPadding(
                    all: 4,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: SvgPicture.asset(
                    AssetConstant.chatIcon,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  tr('language_preference'),
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    fontSize: scale.getScaledFont(14),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded, color: Colors.black, size: 16,),
              ),

              Container(
                margin: scale.getMargin(
                  vertical: 5,
                ),
                child: Divider(
                  color: Color(0xffF2F4F7),
                ),
              ),

              ListTile(
                onTap: (){},
                leading: Container(
                  height: scale.getScaledHeight(26),
                  width: scale.getScaledWidth(26),
                  padding: scale.getPadding(
                    all: 4,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: SvgPicture.asset(
                    AssetConstant.chatIcon,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  tr("notification_settings"),
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    fontSize: scale.getScaledFont(14),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Obx(
                  () {
                    return Switch(
                      value: controller.isSwitched.value,
                      activeTrackColor: AppColors.secondaryLight,
                      activeColor: Colors.white,
                      inactiveThumbColor: AppColors.primaryLight,
                      onChanged: (e) {
                        controller.checkNotificationPermission();
                      },
                    );
                  }
                ),
              ),

              Container(
                margin: scale.getMargin(
                  vertical: 10,
                ),
                child: Divider(
                  color: Color(0xffC2C2C2),
                ),
              ),

              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  tr('about_us'),
                  style: CustomTextStyle.txtPoppins16Black500,
                ),
              ),
              ListTile(
                onTap: (){
                  Get.toNamed(AppRoutes.faqScreen);
                },
                leading: Container(
                  height: scale.getScaledHeight(26),
                  width: scale.getScaledWidth(26),
                  padding: scale.getPadding(
                    all: 4,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: SvgPicture.asset(
                    AssetConstant.carIcon,
                    height: scale.getScaledHeight(14),
                    color: Colors.white,
                  ),
                ),
                title:  Text(
                  tr('faq'),
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    fontSize: scale.getScaledFont(14),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded, color: Colors.black, size: 16,),
              ),

              Container(
                margin: scale.getMargin(
                  vertical: 5,
                ),
                child: Divider(
                  color: Color(0xffF2F4F7),
                ),
              ),
              /// -- Rated Sellers
              ListTile(
                onTap: (){
                  Get.toNamed(AppRoutes.contactScreen);
                },
                leading: Container(
                  height: scale.getScaledHeight(26),
                  width: scale.getScaledWidth(26),
                  padding: scale.getPadding(
                    all: 4,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: SvgPicture.asset(
                    AssetConstant.carIcon,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  tr('contact_support'),
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    fontSize: scale.getScaledFont(14),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios_rounded, color: Colors.black, size: 16,),
              ),

              Container(
                margin: scale.getMargin(
                  vertical: 5,
                ),
                child: Divider(
                  color: Color(0xffF2F4F7),
                ),
              ),
              /// -- Services History
              ListTile(
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return LogoutPopup();
                    },
                  );
                },
                leading: Container(
                  height: scale.getScaledHeight(26),
                  width: scale.getScaledWidth(26),
                  padding: scale.getPadding(
                    all: 4,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: SvgPicture.asset(
                    AssetConstant.chatIcon,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  tr("logout"),
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    fontSize: scale.getScaledFont(14),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              Container(
                margin: scale.getMargin(
                  vertical: 5,
                ),
                child: Divider(
                  color: Color(0xffF2F4F7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
