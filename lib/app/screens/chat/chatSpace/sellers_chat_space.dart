import 'package:cars_and_alll/app/routes/app_routes.dart';
import 'package:cars_and_alll/app/utils/scale_utility.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:cars_and_alll/shared/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellersChatSpace extends StatefulWidget {
  const SellersChatSpace({super.key});


  @override
  State<SellersChatSpace> createState() => _SellersChatSpaceState();
}


class _SellersChatSpaceState extends State<SellersChatSpace> {
  bool autoFollowUp = true;


  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              color: AppColors.primaryLight,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  const Icon(Icons.arrow_back, color: Colors.white),
                  const SizedBox(width: 10),
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://randomuser.me/api/portraits/men/1.jpg",
                    ),
                    radius: 20,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Seller Name",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Honda City • ₹8.5L • 45,000 km',
                          style: CustomTextStyle.txtPoppins12Black500.copyWith(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(onTap: () {
                    Get.toNamed(AppRoutes.callUser);
                  },child: const Icon(Icons.call, color: Colors.white)),
                ],
              ),
            ),
            // Chat body
            Expanded(
              child: Container(
                color: AppColors.backgroundColor,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Quick Replies
                      Container(
                        width: double.infinity,
                        color: AppColors.backgroundColor,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Wrap(
                          runSpacing: 10,
                          spacing: 8,
                          children: [
                            Text(
                              'Quick Questions',
                              style: CustomTextStyle.txtPoppins12Black500,
                            ),
                            _quickReplyButton("Yes, are you interested?"),
                            _quickReplyButton("In talks. I'll let you know."),
                            _quickReplyButton("Sorry, It's not available."),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: scale.getScaledHeight(20),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          constraints: BoxConstraints(
                            minWidth: 0,
                            maxWidth: 150,
                          ),
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Hi",
                            style: CustomTextStyle.txtPoppins12Black500.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "08:00 am ✓",
                          style: CustomTextStyle.txtPoppins12Black500.copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 8,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          constraints: BoxConstraints(
                            minWidth: 0,
                            maxWidth: 280,
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Thanks for your interest in my Honda City. Feel free to ask any questions.",
                            style: CustomTextStyle.txtPoppins12Black500.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "08:00 am ✓",
                          style: CustomTextStyle.txtPoppins12Black500.copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 8,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Message input
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Type your message",
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(4),
                          child: CircleAvatar(
                            backgroundColor: AppColors.secondaryLight,
                            child: const Icon(Icons.mic, color: Colors.white),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: Colors.yellow.shade600,
                            width: 1.5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: Colors.yellow.shade600,
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: Colors.yellow.shade800,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 22,
                    child: const Icon(Icons.send, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _quickReplyButton(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
      decoration: BoxDecoration(
        color: Color(0xffF6F6F6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: CustomTextStyle.txtPoppins12Black500.copyWith(
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}



