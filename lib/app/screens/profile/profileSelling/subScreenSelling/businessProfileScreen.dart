

import 'package:cars_and_alll/app/screens/profile/controller/controller.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../../shared/theme/custom_text_style.dart';
import '../../../../services/user.dart';
import '../../../../utils/scale_utility.dart';

class BusinessProfileScreen extends GetView<ProfileController> {
  const BusinessProfileScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();


    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xFFF7F3EA),
                    child:
                    const Icon(Icons.arrow_back, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Business Info Section
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(UserStore.to.profile.userProfileImage!.first), // demo profile img
                  ),
                  Icon(Icons.verified, color: Colors.green, size: 18),
                ],
              ),
              const SizedBox(height: 20),


              Text(
                "${UserStore.to.profile.userName}",
                style: CustomTextStyle.txtPoppins12Black500.copyWith(
                  fontSize: scale.getScaledFont(16),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),

              infoRow(Icons.phone, "${UserStore.to.profile.userPhone}"),
              infoRow(Icons.email, "${UserStore.to.profile.userEmail}"),
              if(UserStore.to.profile.userWebsite != null)
                infoRow(Icons.link, "${UserStore.to.profile.userWebsite}"),
              if(UserStore.to.profile.userBio != null)
              infoRow(Icons.library_books_rounded, "${UserStore.to.profile.userBio}"),

              const SizedBox(height: 20),


              // Performance Overview
              Text(
                tr('performance_overview'),
                style: CustomTextStyle.txtPoppins12Black500.copyWith(
                  fontSize: scale.getScaledFont(16),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                                    tr('total_listing'),
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
                                  Obx(() {
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
                                    tr('vehicle_sold'),
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
                                    tr('total_views'),
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
                                    tr('average_rating'),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.grey[700], size: 18),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: CustomTextStyle.txtPoppins12Black500.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.black828282
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class PerformanceCard extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;


  const PerformanceCard({
    super.key,
    required this.value,
    required this.label,
    required this.icon,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange, width: 1),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}




