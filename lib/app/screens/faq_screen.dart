import 'package:cars_and_alll/app/utils/scale_utility.dart';
import 'package:cars_and_alll/shared/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/color/app_color.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

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
            vertical: 10,
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
                  height: scale.getScaledHeight(20),
                ),
                Text(
                  "Frequently Asked Questions",
                  style: CustomTextStyle.txtPoppins14Black700.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: scale.getScaledFont(20),
                  ),
                ),
                SizedBox(
                  height: scale.getScaledHeight(20),
                ),
                ExpansionTile(
                  backgroundColor: AppColors.white,
                  collapsedBackgroundColor: AppColors.white,
                  collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                      side: BorderSide(
                        color: Colors.transparent,
                      )
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12),
                    side: BorderSide(
                      color: Colors.transparent,
                    )
                  ),
                  title: Text(
                    'How do I get started?',
                    style: CustomTextStyle.txtPoppins16Black500.copyWith(
                      fontWeight: FontWeight.w500,
                    )
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "When you sign up, you'll start with the Free plan. It's ideal for new teams and allows unlimited team members, but only 1 active editable project at a time. For more advanced features, check out our Basic, Premium, or Enterprise plans.",
                        style: CustomTextStyle.txtPoppins14Black700.copyWith(
                          fontWeight: FontWeight.w400,
                        )
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: scale.getScaledHeight(5),
                ),
                ExpansionTile(
                  backgroundColor: AppColors.white,
                  collapsedBackgroundColor: AppColors.white,
                  collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                      side: BorderSide(
                        color: Colors.transparent,
                      )
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12),
                    side: BorderSide(
                      color: Colors.transparent,
                    )
                  ),
                  title: Text(
                    'What is included in the Free plan?',
                    style: CustomTextStyle.txtPoppins16Black500.copyWith(
                      fontWeight: FontWeight.w500,
                    )
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "The Free Plan includes 1 active editable project, unlimited team members, basic templates, 24/7 customer support, and access to our mobile app. You can upgrade anytime to unlock more features and projects.",
                        style: CustomTextStyle.txtPoppins14Black700.copyWith(
                          fontWeight: FontWeight.w400,
                        )
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: scale.getScaledHeight(5),
                ),
                ExpansionTile(
                  backgroundColor: AppColors.white,
                  collapsedBackgroundColor: AppColors.white,
                  collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                      side: BorderSide(
                        color: Colors.transparent,
                      )
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12),
                    side: BorderSide(
                      color: Colors.transparent,
                    )
                  ),
                  title: Text(
                    'How do I cancel my membership?',
                    style: CustomTextStyle.txtPoppins16Black500.copyWith(
                      fontWeight: FontWeight.w500,
                    )
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "You can cancel your membership at any time by going to your Account Settings > Billing > Cancel Subscription. Your account will remain active until the end of your current billing period, and you'll retain access to all your data.",
                        style: CustomTextStyle.txtPoppins14Black700.copyWith(
                          fontWeight: FontWeight.w400,
                        )
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: scale.getScaledHeight(5),
                ),
                ExpansionTile(
                  backgroundColor: AppColors.white,
                  collapsedBackgroundColor: AppColors.white,
                  collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                      side: BorderSide(
                        color: Colors.transparent,
                      )
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12),
                    side: BorderSide(
                      color: Colors.transparent,
                    )
                  ),
                  title: Text(
                    'How do I transfer my membership to a different account?',
                    style: CustomTextStyle.txtPoppins16Black500.copyWith(
                      fontWeight: FontWeight.w500,
                    )
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "To transfer your membership, contact our support team with both the current and new account email addresses. We'll help you migrate your subscription, projects, and data to the new account within 24-48 hours.",
                        style: CustomTextStyle.txtPoppins14Black700.copyWith(
                          fontWeight: FontWeight.w400,
                        )
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: scale.getScaledHeight(5),
                ),
                ExpansionTile(
                  backgroundColor: AppColors.white,
                  collapsedBackgroundColor: AppColors.white,
                  collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(12),
                      side: BorderSide(
                        color: Colors.transparent,
                      )
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12),
                    side: BorderSide(
                      color: Colors.transparent,
                    )
                  ),
                  title: Text(
                    'What is the refund policy?',
                    style: CustomTextStyle.txtPoppins16Black500.copyWith(
                      fontWeight: FontWeight.w500,
                    )
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        "We offer a 30-day money-back guarantee for all paid plans. If you're not satisfied within the first 30 days, contact our support team for a full refund. Refunds are processed within 5-7 business days.",
                        style: CustomTextStyle.txtPoppins14Black700.copyWith(
                          fontWeight: FontWeight.w400,
                        )
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
