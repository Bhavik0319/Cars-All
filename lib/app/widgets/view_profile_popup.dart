import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cars_and_alll/app/extensions/spacing_extension.dart';
import 'package:cars_and_alll/app/routes/app_routes.dart';
import 'package:cars_and_alll/app/utils/customSnackBar.dart';
import 'package:cars_and_alll/shared/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/color/app_color.dart';
import '../constants/assetConstant.dart';
import '../models/review_model.dart';
import '../models/vehicle_detail_model.dart';
import '../services/user.dart';
import '../utils/scale_utility.dart';

class ViewProfilePopup extends StatelessWidget {
  final VehicleUser user;
  final ReviewSummary reviewSummary;
  final double averageRating;
  final int totalRating;
  final List<dynamic> breakdownStar;
  final Function() onChat;

  const ViewProfilePopup({required this.averageRating, required this.onChat, required this.breakdownStar, required this.totalRating, required this.reviewSummary, super.key, required this.user});

  @override
  Widget build(BuildContext context) {

    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            20.space,
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 0
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: AppColors.splashBackground,
                            backgroundImage: NetworkImage(
                              user.profilePic,
                            ),
                          ),
                          SizedBox(
                            width: scale.getScaledWidth(150),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: user.userName,
                                style: CustomTextStyle.txtPoppins16Black500.copyWith(
                                  color: AppColors.black,
                                  fontSize: scale.getScaledFont(12),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RatingBar.builder(
                            initialRating: reviewSummary.averageRating ?? 0.0,
                            minRating: 0,
                            itemSize: scale.getScaledFont(20),
                            unratedColor: AppColors.grey,
                            direction: Axis.horizontal,
                            wrapAlignment: WrapAlignment.start,
                            allowHalfRating: true,
                            itemCount: 5,
                            ignoreGestures: true,
                            itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: AppColors.secondaryLight,
                            ),
                            onRatingUpdate: (rating) {

                            },
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "$totalRating reviews",
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ],
                  ),
                  20.space,
                  Padding(
                    padding: scale.getPadding(horizontal: 20),
                    child: Column(
                      children: [
                        Column(
                          children: List.generate(5, (index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                children: [
                                  Text(
                                    "${5 - index}",
                                    style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                      fontSize: scale.getScaledFont(12),
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black828282,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: LinearProgressIndicator(
                                      value: breakdownStar[index]["percentage"]/100,
                                      backgroundColor: Colors.grey[300],
                                      color: Colors.amber,
                                      minHeight: 10,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                  20.space,
                  Padding(
                    padding: scale.getPadding(horizontal: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        padding: scale.getPadding(
                          vertical: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                          side: BorderSide(
                            color: AppColors.secondaryLight,
                            width: 1,
                          ),
                        ),
                        minimumSize: Size(double.infinity, 65),
                      ),
                      onPressed: () async{
                        onChat();
                      },
                      child: Text(
                        "Chat with seller",
                        style: CustomTextStyle.txtPoppins16Black500.copyWith(
                          color: AppColors.primaryLight,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(5),
                  ),
                  Padding(
                    padding: scale.getPadding(horizontal: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: scale.getPadding(
                          vertical: 20,
                        ),
                        minimumSize: Size(double.infinity, 65),
                      ),
                      onPressed: () async {
                        if (UserStore.to.uid.value == "") {
                          Get.toNamed(AppRoutes.loginWithPhone);
                        } else {
                          final Uri uri = Uri.parse('tel:+91${user.userPhone}');
                          try {
                            await launchUrl(uri);
                          } catch (e) {
                            customSnackBar(
                              type: AnimatedSnackBarType.error, message: "Could not make a call to ${user.userPhone}",
                            );
                          }
                        }
                      },
                      child: Text(
                        "Call The Seller",
                        style: CustomTextStyle.txtPoppins16Black500.copyWith(
                          color: Colors.white,
                        ),
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
