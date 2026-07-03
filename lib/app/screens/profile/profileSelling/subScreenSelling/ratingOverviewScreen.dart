import 'package:cars_and_alll/app/models/RatingBySellerModel.dart';
import 'package:cars_and_alll/app/screens/profile/controller/ratingBySellerController.dart';
import 'package:cars_and_alll/app/widgets/decoratedContainer.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../../shared/theme/custom_text_style.dart';
import '../../../../constants/assetConstant.dart';
import '../../../../utils/scale_utility.dart';

class RatingOverviewScreen extends GetView<RatingBySellerController> {
  const RatingOverviewScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top bar
                GestureDetector(
                  onTap: () {
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
                    tr('customer_review'),
                    style: CustomTextStyle.txtPoppins12Black500.copyWith(
                      fontSize: scale.getScaledFont(20),
                    ),
                  ),
                ),
                const SizedBox(height: 20),


                // Rating summary
                Center(
                  child: Column(
                    children: [
                      Obx(
                        () {
                          return Text(
                            "${controller.averageRating.value}",
                            style: TextStyle(
                              fontSize: 40,
                              color: AppColors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          5,
                              (index) =>
                              Icon(Icons.star, color: Colors.amber, size: 28),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Obx(
                        () {
                          return Text(
                            "${controller.totalRating.value} ${tr('reviews')}",
                            style: TextStyle(color: Colors.grey[600]),
                          );
                        }
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Rating bars
                Obx(
                  () {
                    return controller.isLoading.value ? const Center(
                      child: CircularProgressIndicator(),
                    ) :  Column(
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
                                  value: controller.breakdownStar[index]["percentage"]/100,
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
                    );
                  }
                ),



                // const SizedBox(height: 20),
                // // Filter row
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: ["All", "5", "4", "3", "2", "1"]
                //       .map(
                //         (e) => DecoratedContainer(
                //           fillColor: e == 'All' ? AppColors.primaryLight : Colors.white,
                //           borderColor: e == 'All' ? Colors.transparent : AppColors.primaryLight,
                //           padding: scale.getPadding(
                //             horizontal: 10,
                //             vertical: 5
                //           ),
                //           borderRadius: 100,
                //           child: Row(
                //             children: [
                //               Icon(Icons.star_border,
                //                 size: 14,
                //                 color: e == 'All' ? Colors.white : AppColors.primaryLight,
                //               ),
                //               SizedBox(
                //                 width: scale.getScaledWidth(3),
                //               ),
                //               Text(
                //                 e,
                //                 style: CustomTextStyle.txtPoppins12Black500.copyWith(
                //                   fontSize: scale.getScaledFont(12),
                //                   fontWeight: FontWeight.w500,
                //                   color: e == 'All' ? Colors.white : AppColors.primaryLight
                //                 ),
                //               )
                //             ],
                //           ),
                //     ),
                //   )
                //       .toList(),
                // ),

                const SizedBox(height: 20),

                // Review list (scrollable section inside page)
                Obx(
                  () {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.ratings.value.length,
                      itemBuilder: (context, index) {
                        return ReviewCard(
                          ratingModel: controller.ratings[index],
                        );
                      },
                    );
                  }
                ),


                const SizedBox(height: 20),


                // Load more button
                // Container(
                //   width: scale.fw,
                //   height: scale.getScaledHeight(45),
                //   margin: scale.getMargin(
                //     bottom: 30
                //   ),
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: AppColors.primaryLight,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(8),
                //       ),
                //     ),
                //     onPressed: () {},
                //     child: const Text(
                //       "Load More Review",
                //       style: TextStyle(fontSize: 16, color: Colors.white),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class ReviewCard extends StatelessWidget {
  final RatingStatusModel ratingModel;

  const ReviewCard({required this.ratingModel, super.key});


  @override
  Widget build(BuildContext context) {
    final scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Container(
      margin: scale.getMargin(
        bottom: 12,
      ),
      padding: scale.getPadding(
        bottom: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: AppColors.white,
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              '${ratingModel.user!.userName}',
              style: CustomTextStyle.txtPoppins12Black500.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            // subtitle: Text(
            //   'A day ago',
            //   style: CustomTextStyle.txtPoppins12Black500.copyWith(
            //     fontWeight: FontWeight.w400,
            //     color: Color(0xff202020).withOpacity(0.70),
            //   ),
            // ),
            leading: CircleAvatar(
              radius: scale.getScaledFont(18),
              backgroundImage: NetworkImage(
                ratingModel.vehicle!.images!.first,
              ),
            ),
            trailing: Wrap(
              children: List.generate(5, (index) {
                return Icon(
                  ratingModel.ratingValue! < index+1
                      ? Icons.star_border
                      : Icons.star,
                  color: AppColors.secondaryLight,
                  size: scale.getScaledFont(16),
                );
              }),
            ),
            titleAlignment: ListTileTitleAlignment.top,
            dense: true,
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: scale.getPadding(
              left: 12,
              right: 18,
              top: 10,
            ),
            child: Text(
              '${ratingModel.reviewText!.isEmpty ? "NO REVIEW" : ratingModel.reviewText}',
              style: CustomTextStyle.txtPoppins12Black500.copyWith(
                fontWeight: FontWeight.w400,
                color: Color(0xff202020),
              ),
            ),
          ),
          // Padding(
          //   padding: scale.getPadding(horizontal: 12),
          //   child: Row(
          //     children: [
          //       Text(
          //         'Is this review helpful?',
          //         style: CustomTextStyle.txtPoppins10W400.copyWith(
          //           fontSize: scale.getScaledFont(8),
          //         ),
          //       ),
          //       Container(
          //         margin: scale.getMargin(
          //           horizontal: 10,
          //         ),
          //         padding: scale.getPadding(
          //           left: 10,
          //           right: 10,
          //           top: 1,
          //           bottom: 3,
          //         ),
          //         decoration: BoxDecoration(
          //             color: Colors.transparent,
          //             borderRadius: BorderRadius.circular(20),
          //             border: Border.all(
          //               color: Color(0xff9DB2CE),
          //             )
          //         ),
          //         child: Text(
          //           'Yes',
          //           style: CustomTextStyle.txtPoppins10W400.copyWith(
          //             fontSize: scale.getScaledFont(8),
          //           ),
          //         ),
          //       ),
          //       Container(
          //         padding: scale.getPadding(
          //           left: 10,
          //           right: 10,
          //           top: 1,
          //           bottom: 3,
          //         ),
          //         decoration: BoxDecoration(
          //             color: Colors.transparent,
          //             borderRadius: BorderRadius.circular(20),
          //             border: Border.all(
          //               color: Color(0xff9DB2CE),
          //             )
          //         ),
          //         child: Text(
          //           'No',
          //           style: CustomTextStyle.txtPoppins10W400.copyWith(
          //             fontSize: scale.getScaledFont(8),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}



