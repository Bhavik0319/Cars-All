import 'package:cars_and_alll/app/screens/profile/controller/ratedSellerController.dart';
import 'package:cars_and_alll/app/widgets/decoratedContainer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../shared/color/app_color.dart';
import '../../../../../shared/theme/custom_text_style.dart';
import '../../../../constants/assetConstant.dart';
import '../../../../utils/scale_utility.dart';

class RatedSellerScreen extends GetView<RatedSellerController> {
  const RatedSellerScreen({super.key});

  @override
  Widget build(BuildContext context) {

    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: scale.getMargin(
            left: 20,
            right: 20,
            bottom: 20,

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr('rated_seller'),
                      style: CustomTextStyle.txtPoppins12Black500.copyWith(
                        fontSize: scale.getScaledFont(20),
                      ),
                    ),
                    Obx(
                      () {
                        return Text(
                          '${controller.submittedRating.value.length ?? 0} Seller',
                          style: CustomTextStyle.txtPoppins12Black500,
                        );
                      }
                    ),
                  ],
                ),
                // Container(
                //   margin: scale.getMargin(
                //     vertical: 10,
                //   ),
                //   child: Row(
                //     children: [
                //       Expanded(
                //         child: TextFormField(
                //           decoration: InputDecoration(
                //             isDense: true,
                //             labelStyle: TextStyle(fontWeight: FontWeight.w600),
                //             floatingLabelBehavior: FloatingLabelBehavior.always,
                //             hintStyle: CustomTextStyle.txtPoppins12White300.copyWith(
                //               color: Color(0xff9095A0),
                //               fontSize: scale.getScaledFont(10),
                //               fontWeight: FontWeight.w500,
                //             ),
                //             focusColor: AppColors.white,
                //             border: OutlineInputBorder(
                //               borderRadius: BorderRadius.circular(10),
                //               borderSide: BorderSide(color: AppColors.secondaryLight),
                //             ),
                //             focusedBorder: OutlineInputBorder(
                //               borderRadius: BorderRadius.circular(10),
                //               borderSide: BorderSide(color: AppColors.secondaryLight),
                //             ),
                //             enabledBorder: OutlineInputBorder(
                //               borderRadius: BorderRadius.circular(10),
                //               borderSide: BorderSide(color: AppColors.secondaryLight),
                //             ),
                //             contentPadding: EdgeInsets.zero,
                //             prefixIcon: Padding(
                //               padding: const EdgeInsets.all(12.0),
                //               child: SvgPicture.asset(
                //                 AssetConstant.searchBarIcon,
                //                 height: 2,
                //                 color: AppColors.black,
                //               ),
                //             ),
                //             hintText: 'Search by location or service',
                //           ),
                //           style: CustomTextStyle.txtPoppins12White300.copyWith(
                //             color: AppColors.black,
                //             fontSize: scale.getScaledFont(10),
                //             fontWeight: FontWeight.w500,
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         width: scale.getScaledWidth(20),
                //       ),
                //       SvgPicture.asset(
                //         AssetConstant.filterIcon,
                //         color: AppColors.primaryLight,
                //       )
                //     ],
                //   ),
                // ),
                Obx(
                  () => controller.isLoading.value ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.secondaryLight,
                    ),
                  ) : ListView.builder(
                      itemCount: controller.submittedRating.value.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return DecoratedContainer(
                          margin: scale.getMargin(
                            vertical: 4,
                          ),
                          borderColor: Colors.transparent,
                          padding: scale.getPadding(
                              vertical: 10,
                              horizontal: 10
                          ),
                          borderRadius: 6,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: scale.getScaledFont(20),
                                backgroundImage: NetworkImage(
                                  controller.submittedRating[index].vehicle!.images![0],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: scale.getMargin(
                                    left: 16,
                                    right: 5,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${controller.submittedRating[index].vehicle!.filters!.brand}, ${controller.submittedRating[index].vehicle!.filters!.model}',
                                        style: CustomTextStyle.txtPoppins14Black700.copyWith(
                                          fontSize: scale.getScaledFont(14),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: AppColors.secondaryLight,
                                            size: scale.getScaledFont(15),
                                          ),
                                          Text(
                                            '  ${controller.submittedRating[index].ratingValue} ${tr('rating')}',
                                            style: CustomTextStyle.txtPoppins10W400.copyWith(
                                              fontSize: scale.getScaledFont(10),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: scale.getScaledHeight(5),
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.location_on_outlined,
                                                color: AppColors.black,
                                                size: scale.getScaledFont(15),
                                              ),
                                              SizedBox(
                                                width: scale.getScaledWidth(5),
                                              ),
                                              Text(
                                                '${controller.submittedRating[index].vehicle!.location!.city}, ${controller.submittedRating[index].vehicle!.location!.state}',
                                                style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                                  fontSize: scale.getScaledFont(10),
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            width: scale.getScaledWidth(15),
                                          ),
                                          // Row(
                                          //   children: [
                                          //     SvgPicture.asset(
                                          //       AssetConstant.carIcon,
                                          //       color: AppColors.secondaryLight,
                                          //       height: scale.getScaledFont(15),
                                          //     ),
                                          //     SizedBox(
                                          //       width: scale.getScaledWidth(5),
                                          //     ),
                                          //     Text(
                                          //       '45 Cars Sold',
                                          //       style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                          //         fontSize: scale.getScaledFont(10),
                                          //         fontWeight: FontWeight.w400,
                                          //       ),
                                          //     )
                                          //   ],
                                          // ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: scale.getScaledHeight(5),
                                      ),
                                      // Row(
                                      //   children: [
                                      //     DecoratedContainer(
                                      //       padding: scale.getPadding(
                                      //         horizontal: 8,
                                      //         vertical: 2,
                                      //       ),
                                      //       borderColor: Colors.transparent,
                                      //       fillColor: AppColors.primaryLight.withOpacity(0.2),
                                      //       child: Text(
                                      //         'Quick Response',
                                      //         style: CustomTextStyle.txtPoppins10W400.copyWith(
                                      //           color: AppColors.primaryLight,
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     SizedBox(
                                      //       width: scale.getScaledWidth(10),
                                      //     ),
                                      //     DecoratedContainer(
                                      //       padding: scale.getPadding(
                                      //         horizontal: 8,
                                      //         vertical: 2,
                                      //       ),
                                      //       borderColor: Colors.transparent,
                                      //       fillColor: AppColors.greenCheckColor,
                                      //       child: Text(
                                      //         'Verified Listing',
                                      //         style: CustomTextStyle.txtPoppins10W400.copyWith(
                                      //           color: AppColors.white,
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                      // SizedBox(
                                      //   height: scale.getScaledHeight(15),
                                      // ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          // Container(
                                          //     margin: scale.getMargin(
                                          //       bottom: 5,
                                          //     ),
                                          //     height: scale.getScaledHeight(30),
                                          //     child: ElevatedButton(
                                          //       onPressed: () {  },
                                          //       style: ElevatedButton.styleFrom(
                                          //         padding: scale.getPadding(
                                          //           horizontal: 15,
                                          //         ),
                                          //       ),
                                          //       child: Text(
                                          //         "View Seller Details",
                                          //         style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                          //           color: Colors.white,
                                          //         ),
                                          //       ),
                                          //     )
                                          // ),
                                          Text(
                                            controller.submittedRating[index].reviewText?? '',
                                            style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                              fontSize: scale.getScaledFont(14),
                                            ),
                                          ),
                                          Spacer(),
                                          CircleAvatar(
                                            backgroundColor: AppColors.primaryLight,
                                            radius: 12,
                                            child: Icon(
                                              Icons.edit,
                                              color: AppColors.white,
                                              size: scale.getScaledFont(10),
                                            ),
                                          ),
                                          // CircleAvatar(
                                          //     backgroundColor: AppColors.secondaryLight,
                                          //     radius: 12,
                                          //     child: SvgPicture.asset(
                                          //       AssetConstant.chatIcon,
                                          //       color: Colors.white,
                                          //       height: scale.getScaledHeight(10),
                                          //     )
                                          // ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
