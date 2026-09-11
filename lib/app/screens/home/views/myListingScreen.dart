
import 'dart:developer';
import 'dart:io';

import 'package:cars_and_alll/app/routes/app_routes.dart';
import 'package:cars_and_alll/app/utils/customImageView.dart';
import 'package:cars_and_alll/app/utils/numberFormat.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../shared/theme/custom_text_style.dart';
import '../../../constants/assetConstant.dart';
import '../../../controller/MyListingController.dart';
import '../../../utils/scale_utility.dart';

 class MyListingScreen extends GetView<MyListingController> {
   const MyListingScreen({super.key});

   @override
   Widget build(BuildContext context) {

     ScalingUtility scale = ScalingUtility(context: context)
       ..setCurrentDeviceSize();

     return Scaffold(
       backgroundColor: AppColors.backgroundColor,
       body: SafeArea(
         child: Container(
           margin: scale.getMargin(
             left: 20,
             right: 20,
             bottom: 20,
           ),
           child: Obx(
             () {
               return controller.isLoading.value ? Center(
                 child: CircularProgressIndicator(
                   color: AppColors.secondaryLight,
                 ),
               ) : SingleChildScrollView(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [

                     /// -- Push Back Button
                     InkWell(
                       onTap: (){
                         Get.back();
                       },
                       child: Container(
                         padding: EdgeInsets.all(8),
                         decoration: BoxDecoration(
                             color: Colors.white,
                             borderRadius: BorderRadius.circular(50)
                         ),
                         child: Icon(Icons.arrow_back, size: 20, color: Colors.black, ),
                       ),
                     ),
                     SizedBox(height: 16),

                     Text(
                       tr('my_listing'),
                       style: CustomTextStyle.txtPoppins12Black500.copyWith(
                         fontWeight: FontWeight.w600,
                         fontSize: scale.getScaledFont(18),
                       ),
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
                     //     ],
                     //   ),
                     // ),

                     /// -- Active Listing
                     Obx(
                       () {
                         return controller.getAllListingActive.value.isEmpty ? SizedBox(
                           width: scale.fw,
                           child: Column(
                             children: [
                               Lottie.asset(
                                 "assets/no_data.json",
                                 width: 200,
                                 height: 200,
                                 fit: BoxFit.fill,
                               ),
                               Text(
                                 tr('no_data_found'),
                                 style: CustomTextStyle.txtPoppins14Black700,
                               )
                             ],
                           ),
                         ) : ListView.builder(
                             itemCount: controller.getAllListingActive.value.length,
                             shrinkWrap: true,
                             scrollDirection: Axis.vertical,
                             reverse: false,
                           physics: NeverScrollableScrollPhysics(),
                             itemBuilder: (context, index) => Container(
                               margin: scale.getMargin(
                                 vertical: 5
                               ),
                               width: double.infinity,
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children: [
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Row(
                                         children: [
                                           /// -- Car Image
                                           GestureDetector(
                                             onTap: (){
                                               log("ID: ${controller.getAllListingActive[index].id!}");
                                               Get.toNamed(AppRoutes.carDetailScreen, parameters: {'vehicleId' : controller.getAllListingActive[index].id!});
                                             },
                                             child: Container(
                                               width: scale.getScaledWidth(80),
                                               height: scale.getScaledHeight(80),
                                               margin: scale.getMargin(
                                                 right: 10,
                                               ),
                                               child: ClipRRect(
                                                 borderRadius: BorderRadiusGeometry.circular(10),
                                                 child: CustomImageView(
                                                   path: controller.getAllListingActive[index].vehicleImages!.first,
                                                   fit: BoxFit.cover,
                                                 ),
                                               ),
                                             ),
                                           ),

                                           /// -- Car Details
                                           Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               SizedBox(
                                                 width: scale.getScaledWidth(160),
                                                 child: Text(
                                                   "${controller.getAllListingActive[index].vehicleFilters!.brand} ${controller.getAllListingActive[index].vehicleFilters!.model}",
                                                   maxLines: 1,
                                                   overflow: TextOverflow.ellipsis,
                                                   style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                                     fontWeight: FontWeight.w400,
                                                     fontSize: scale.getScaledFont(12),
                                                   ),
                                                 ),
                                               ),
                                               SizedBox(
                                                 width: scale.getScaledWidth(160),
                                                 child: Text(
                                                   "Location: ${controller.getAllListingActive[index].vehicleLocation!.city}, ${controller.getAllListingActive[index].vehicleLocation!.state}",
                                                   style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                                     fontWeight: FontWeight.w400,
                                                   ),
                                                 ),
                                               ),
                                               SizedBox(height: 4),
                                               Text(
                                                 "Rs ${formatWithCommas(controller.getAllListingActive[index].askingPrice)}",
                                                 style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                                   fontWeight: FontWeight.w600,
                                                   fontSize: scale.getScaledFont(14),
                                                   color: AppColors.primaryLight,
                                                 ),
                                               ),
                                               SizedBox(height: 2),
                                               Row(
                                                 children: [
                                                   Icon(Icons.remove_red_eye, size: 10, color: Colors.grey.shade600,),
                                                   SizedBox(width: 6),
                                                   Text(
                                                     "${controller.getAllListingActive[index].vehicleViews} views",
                                                     style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                                       fontWeight: FontWeight.w400,
                                                       fontSize: scale.getScaledFont(9),
                                                       color: AppColors.black828282,
                                                     ),
                                                   ),
                                                 ],
                                               ),
                                               SizedBox(height: 2),
                                               Row(
                                                 children: [
                                                   Icon(Icons.check_circle_outline_rounded,
                                                     size: 12,
                                                     color: AppColors.primaryLight,
                                                   ),
                                                   SizedBox(width: 3),
                                                   GestureDetector(
                                                     onTap: () {
                                                       controller.showSoldPopup(controller.getAllListingActive[index].id);
                                                     },
                                                     child: Text(
                                                       "Mark sold",
                                                       style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                                         fontWeight: FontWeight.w500,
                                                         fontSize: scale.getScaledFont(10),
                                                         color: AppColors.primaryLight,
                                                       ),
                                                     ),
                                                   ),
                                                   SizedBox(width: 10),

                                                   /// -- Edit Button
                                                   GestureDetector(
                                                     onTap: (){
                                                       Get.toNamed(AppRoutes.enterVehicleDetails, arguments: {'vehicleId' : controller.getAllListingActive[index].id});
                                                     },
                                                     child: CircleAvatar(
                                                       radius: 10,
                                                       backgroundColor: AppColors.primaryLight,
                                                       child: Icon(
                                                         Icons.edit,
                                                         size: 12,
                                                         color: Colors.white,
                                                       ),
                                                     ),
                                                   ),
                                                   SizedBox(width: 10),

                                                   /// -- Delete Button
                                                   GestureDetector(
                                                     onTap: () {
                                                       controller.deleteVehicleStatus(controller.getAllListingActive[index].id);
                                                     },
                                                     child: Icon(Icons.delete_outline_rounded, size: 16, color: Colors.red,),
                                                   ),
                                                 ],
                                               ),
                                             ],
                                           ),
                                         ],
                                       ),
                                       /// -- Active, Pending or Sold labels
                                       Column(
                                         mainAxisAlignment: MainAxisAlignment.start,
                                         children: [
                                           Container(
                                             padding: scale.getPadding(
                                               horizontal: 15,
                                               vertical: 3
                                             ),
                                             decoration: BoxDecoration(
                                               color: Colors.lightGreen,
                                               borderRadius: BorderRadiusGeometry.circular(50),
                                             ),
                                             child: Text(
                                               "${controller.getAllListingActive[index].vehicleStatus}",
                                               style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                                 fontWeight: FontWeight.w600,
                                                 fontSize: scale.getScaledFont(10),
                                                 color: Colors.white,
                                               ),
                                             ),
                                           ),
                                         ],
                                       ),
                                     ],
                                   ),

                                   SizedBox(height: 6),
                                   Divider(
                                     thickness: 1,
                                     height: 1,
                                   )
                                 ],
                               ),
                             ),
                         );
                       }
                     ),

                     /// -- Past Listing
                     SizedBox(height: 20),
                     Text(
                       tr("past_listing"),
                       style: CustomTextStyle.txtPoppins12Black500.copyWith(
                         fontSize: scale.getScaledFont(18),
                         fontWeight: FontWeight.w600,
                       ),
                     ),
                     SizedBox(height: 10),
                     Obx(
                       () {
                         return controller.getAllListingSold.value.isEmpty ? SizedBox(
                           width: scale.fw,
                           child: Column(
                             children: [
                               Lottie.asset(
                                 "assets/no_data.json",
                                 width: 200,
                                 height: 200,
                                 fit: BoxFit.fill,
                               ),
                               Text(
                                 tr('no_data_found'),
                                 style: CustomTextStyle.txtPoppins14Black700,
                               )
                             ],
                           ),
                         ): ListView.builder(
                           itemCount: controller.getAllListingSold.value.length,
                           shrinkWrap: true,
                           scrollDirection: Axis.vertical,
                           reverse: false,
                           physics: NeverScrollableScrollPhysics(),
                           itemBuilder: (context, index) => Container(
                             padding: scale.getPadding(
                               top: 10,
                               right: 3,
                               left: 3
                             ),
                             color: Color(0xffDADADA).withOpacity(0.32),
                             margin: scale.getMargin(
                                 vertical: 5
                             ),
                             width: double.infinity,
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Row(
                                       children: [

                                         /// -- Car Image
                                         GestureDetector(
                                           onTap: (){
                                             Get.toNamed(AppRoutes.carDetailScreen, parameters: {'vehicleId' : controller.getAllListingSold[index].id!});
                                           },
                                           child: Container(
                                             width: scale.getScaledWidth(80),
                                             height: scale.getScaledHeight(80),
                                             margin: scale.getMargin(
                                               right: 10,
                                             ),
                                             child: ClipRRect(
                                               borderRadius: BorderRadiusGeometry.circular(10),
                                               child: CustomImageView(
                                                 path: controller.getAllListingSold[index].vehicleImages!.first,
                                                 fit: BoxFit.cover,
                                               ),
                                             ),
                                           ),
                                         ),

                                         /// -- Car Details
                                         Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             SizedBox(
                                               width: scale.getScaledWidth(160),
                                               child: Text(
                                                 "${controller.getAllListingSold[index].vehicleFilters!.brand} ${controller.getAllListingSold[index].vehicleFilters!.model}",
                                                 maxLines: 1,
                                                 overflow: TextOverflow.ellipsis,
                                                 style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                                   fontWeight: FontWeight.w400,
                                                   fontSize: scale.getScaledFont(12),
                                                 ),
                                               ),
                                             ),
                                             SizedBox(
                                               width: scale.getScaledWidth(170),
                                               child: Text(
                                                 "Location: ${controller.getAllListingSold[index].vehicleLocation!.city}, ${controller.getAllListingSold[index].vehicleLocation!.state}",
                                                 style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                                   fontWeight: FontWeight.w400,
                                                 ),
                                               ),
                                             ),
                                             SizedBox(height: 4),
                                             Text(
                                               "Rs ${formatWithCommas(controller.getAllListingSold[index].askingPrice)}",
                                               style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                                 fontWeight: FontWeight.w600,
                                                 fontSize: scale.getScaledFont(14),
                                                 color: AppColors.black828282,
                                               ),
                                             ),
                                             SizedBox(height: 2),
                                             Row(
                                               children: [
                                                 Icon(Icons.remove_red_eye, size: 10, color: Colors.grey.shade600,),
                                                 SizedBox(width: 6),
                                                 Text(
                                                   "${controller.getAllListingSold[index].vehicleViews} views",
                                                   style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                                     fontWeight: FontWeight.w400,
                                                     fontSize: scale.getScaledFont(9),
                                                     color: AppColors.black828282,
                                                   ),
                                                 ),
                                               ],
                                             ),
                                             SizedBox(height: 2),
                                             // Text(
                                             //   'Sold on 14-JUN-2025',
                                             //   style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                             //     fontSize: scale.getScaledFont(10),
                                             //     color: AppColors.black828282,
                                             //   ),
                                             // )
                                           ],
                                         ),

                                       ],
                                     ),
                                     /// -- Active, Pending or Sold labels
                                     Container(
                                       padding: scale.getPadding(
                                           horizontal: 15,
                                           vertical: 3
                                       ),
                                       decoration: BoxDecoration(
                                         color: Color(0xffC4C4C4),
                                         borderRadius: BorderRadiusGeometry.circular(50),
                                       ),
                                       child: Text(
                                         "Sold",
                                         style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                           fontWeight: FontWeight.w600,
                                           fontSize: scale.getScaledFont(10),
                                           color: AppColors.white,
                                         ),
                                       ),
                                     ),
                                   ],
                                 ),

                                 SizedBox(height: 6),
                                 Divider(
                                   thickness: 1,
                                   height: 1,
                                 )
                               ],
                             ),
                           ),
                         );
                       }
                     ),
                   ],
                 ),
               );
             }
           ),
         ),
       )
     );
   }
 }
