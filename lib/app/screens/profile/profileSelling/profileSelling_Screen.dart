import 'package:cars_and_alll/app/screens/profile/controller/controller.dart';
import 'package:cars_and_alll/app/utils/scale_utility.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../shared/theme/custom_text_style.dart';
import '../../../constants/assetConstant.dart';
import '../../../routes/app_routes.dart';
import '../../../widgets/logout_popup.dart';

class ProfileSellingScreen extends GetView<ProfileController> {
  const ProfileSellingScreen({super.key});

  static bool isSwitched = true;

  @override
  Widget build(BuildContext context) {

    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Container(
      color: AppColors.backgroundColor,
      child: SingleChildScrollView(
        child: Padding(
          padding: scale.getPadding(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: scale.getMargin(
                  horizontal: 10
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: scale.getMargin(
                        top: 15,
                        bottom: 10,
                      ),
                      child: Text(
                        tr("dashboard_stats"),
                        style: CustomTextStyle.txtPoppins16Black500,
                      ),
                    ),
                    Row(
                      children: [
                        /// -- Total Listing
                        Expanded(
                          child: Padding(
                            padding: scale.getPadding(left: 10, right: 10),
                            child: Container(
                              width: scale.getScaledWidth(150),
                              height: scale.getScaledHeight(100),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.orangeAccent)
                              ),
                              child: Padding(
                                padding: scale.getPadding(all: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    /// -- Icon
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(Icons.document_scanner_outlined,
                                        color: Colors.orangeAccent,
                                        size: scale.getScaledFont(18),
                                      ),
                                    ),
                                    Obx(
                                      () {
                                        return Text(
                                          "${controller.totalListedVehicle.value}",
                                          textAlign: TextAlign.center,
                                          style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                            fontSize: scale.getScaledFont(14),
                                            color: AppColors.primaryLight,
                                          ),
                                        );
                                      }
                                    ),
                                    SizedBox(height: scale.getScaledWidth(4),),
                                    Text(
                                      tr("total_listing"),
                                      textAlign: TextAlign.center,
                                      style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                        fontSize: scale.getScaledFont(12),
                                        color: AppColors.primaryLight,
                                      ),
                                    ),
                                    SizedBox(height: scale.getScaledWidth(10),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        /// -- Buyer Messages
                        Expanded(
                          child: Padding(
                            padding: scale.getPadding(left: 10, right: 10),
                            child: Container(
                              width: scale.getScaledWidth(150),
                              height: scale.getScaledHeight(100),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.orangeAccent)
                              ),
                              child: Padding(
                                padding: scale.getPadding(all: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    /// -- Icon
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(Icons.document_scanner_outlined,
                                        color: Colors.orangeAccent,
                                        size: scale.getScaledFont(18),
                                      ),
                                    ),
                                    Obx(
                                      () {
                                        return Text(
                                          "${controller.vehicleSold.value}",
                                          textAlign: TextAlign.center,
                                          style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                            fontSize: scale.getScaledFont(14),
                                            color: AppColors.primaryLight,
                                          ),
                                        );
                                      }
                                    ),
                                    SizedBox(height: scale.getScaledWidth(4),),
                                    Text(
                                      tr("vehicle_sold"),
                                      textAlign: TextAlign.center,
                                      style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                        fontSize: scale.getScaledFont(12),
                                        color: AppColors.primaryLight,
                                      ),
                                    ),
                                    SizedBox(height: scale.getScaledWidth(10),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: scale.getScaledHeight(10)),
                    Row(
                      children: [
                        /// -- Total Earnings
                        Expanded(
                          child: Padding(
                            padding: scale.getPadding(left: 10, right: 10),
                            child: Container(
                              width: scale.getScaledWidth(150),
                              height: scale.getScaledHeight(100),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.orangeAccent)
                              ),
                              child: Padding(
                                padding: scale.getPadding(all: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    /// -- Icon
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(Icons.document_scanner_outlined,
                                        color: Colors.orangeAccent,
                                        size: scale.getScaledFont(18),
                                      ),
                                    ),
                                    Obx(
                                      () {
                                        return Text(
                                          "${controller.totalViews.value}",
                                          textAlign: TextAlign.center,
                                          style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                            fontSize: scale.getScaledFont(14),
                                            color: AppColors.primaryLight,
                                          ),
                                        );
                                      }
                                    ),
                                    SizedBox(height: scale.getScaledWidth(4),),
                                    Text(
                                      tr("total_views"),
                                      textAlign: TextAlign.center,
                                      style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                        fontSize: scale.getScaledFont(12),
                                        color: AppColors.primaryLight,
                                      ),
                                    ),
                                    SizedBox(height: scale.getScaledWidth(10),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: scale.getPadding(left: 10, right: 10),
                            child: Container(
                              width: scale.getScaledWidth(150),
                              height: scale.getScaledHeight(100),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.orangeAccent)
                              ),
                              child: Padding(
                                padding: scale.getPadding(all: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    /// -- Icon
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(Icons.document_scanner_outlined,
                                        color: Colors.orangeAccent,
                                        size: scale.getScaledFont(18),
                                      ),
                                    ),
                                    Obx(
                                      () {
                                        return Text(
                                          "${controller.averageRating.value}",
                                          style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                            fontSize: scale.getScaledFont(14),
                                            color: AppColors.primaryLight,
                                          ),
                                        );
                                      }
                                    ),
                                    SizedBox(height: scale.getScaledWidth(4),),
                                    Text(
                                      tr('average_rating'),
                                      style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                        fontSize: scale.getScaledFont(12),
                                        color: AppColors.primaryLight,
                                      ),
                                    ),
                                    SizedBox(height: scale.getScaledWidth(10),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: scale.getScaledHeight(20)),
              Divider(color: Colors.grey, thickness: 1,),
              SizedBox(height: scale.getScaledHeight(10)),

              Container(
                margin: scale.getMargin(
                  horizontal: 10,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        tr("seller_actions"),
                        style: CustomTextStyle.txtPoppins16Black500,
                      ),
                    ),
                    SizedBox(
                      height: scale.getScaledHeight(10),
                    ),
                    /// -- My Purchases
                    ListTile(
                      onTap: (){
                        Get.toNamed(AppRoutes.myListingScreen);
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
                        tr('my_listing'),
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
                    /// -- My Purchases
                    ListTile(
                      onTap: (){
                        Get.toNamed(AppRoutes.getVehicleDetails);
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
                        tr("post_new_ads"),
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
                    /// -- My Purchases
                    ListTile(
                      onTap: (){
                        Get.toNamed(AppRoutes.autoFollowUpScreen);
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
                        tr('chat_settings'),
                        style: CustomTextStyle.txtPoppins12Black500.copyWith(
                          fontSize: scale.getScaledFont(14),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios_rounded, color: Colors.black, size: 16,),
                    ),

                    SizedBox(
                      height: scale.getScaledHeight(10),
                    ),
                  ],
                ),
              ),
              Divider(color: Colors.grey, thickness: 1,),
              SizedBox(height: scale.getScaledHeight(10)),
              Container(
                margin: scale.getMargin(
                  horizontal: 10,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        tr("support_settings"),
                        style: CustomTextStyle.txtPoppins16Black500,
                      ),
                    ),
                    SizedBox(
                      height: scale.getScaledHeight(10),
                    ),
                    /// -- My Purchases
                    ListTile(
                      onTap: (){

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
                      )
                    ),
                    Container(
                      margin: scale.getMargin(
                        vertical: 5,
                      ),
                      child: Divider(
                        color: Color(0xffF2F4F7),
                      ),
                    ),
                    /// -- My Purchases
                    ListTile(
                      onTap: (){
                        Get.toNamed(AppRoutes.businessProfileScreen);
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
                        tr('business_profile'),
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
                    /// -- My Purchases
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
                          AssetConstant.personIcon,
                          height: scale.getScaledHeight(14),
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        tr("contact_support"),
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
                    /// -- My Purchases
                    ListTile(
                      onTap: (){
                        Get.toNamed(AppRoutes.ratingOverviewScreen);
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
                        tr('rating_overview'),
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
              SizedBox(height: scale.getScaledHeight(30)),
            ],
          ),
        ),
      ),
    );
  }
}
