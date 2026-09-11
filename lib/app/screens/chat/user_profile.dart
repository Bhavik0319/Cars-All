

import 'package:cars_and_alll/app/screens/chat/chatSpace/controller/chatSpaceController.dart';
import 'package:cars_and_alll/app/screens/profile/controller/controller.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../shared/theme/custom_text_style.dart';
import '../../utils/scale_utility.dart';

class ChatUserProfile extends GetView<ChatSpaceController> {
  const ChatUserProfile({super.key});


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
                    backgroundImage: NetworkImage(controller.otherUser.value.userProfileImage!.first),
                  ),
                  Icon(Icons.verified, color: Colors.green, size: 18),
                ],
              ),
              const SizedBox(height: 20),


              Text(
                "${controller.otherUser.value.userName}",
                style: CustomTextStyle.txtPoppins12Black500.copyWith(
                  fontSize: scale.getScaledFont(16),
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),

              infoRow(Icons.phone, "${controller.otherUser.value.userPhone}"),
              infoRow(Icons.email, "${controller.otherUser.value.userEmail}"),
              if(controller.otherUser.value.otherDetails != null && controller.otherUser.value.otherDetails!.instagram != null)
                infoRow(Icons.link, "${controller.otherUser.value.otherDetails!.instagram}"),
              if(controller.otherUser.value.otherDetails != null && controller.otherUser.value.otherDetails!.facebook != null)
                infoRow(Icons.link, "${controller.otherUser.value.otherDetails!.facebook}"),
              if(controller.otherUser.value.userBio != null && controller.otherUser.value.userBio!.isNotEmpty)
                infoRow(Icons.library_books_rounded, "${controller.otherUser.value.userBio}"),

              const SizedBox(height: 20),

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