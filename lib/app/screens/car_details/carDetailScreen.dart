
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cars_and_alll/app/screens/car_details/widgets/overview_tab.dart';
import 'package:cars_and_alll/app/utils/customImageView.dart';
import 'package:cars_and_alll/app/utils/numberFormat.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:cars_and_alll/shared/theme/custom_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../routes/app_routes.dart';
import '../../services/user.dart';
import '../../utils/customSnackBar.dart';
import '../../utils/scale_utility.dart';
import '../home/widgets/vehicle_list_view_tile.dart';
import 'controller/carDetailController.dart';

class CarDetailScreen extends GetView<CarDetailController> {
  const CarDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return DefaultTabController(
      length: 1,
      child: Obx(
        () {
          return Scaffold(
            backgroundColor: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.black : AppColors.backgroundColor,
            body: Obx(
              () {
                return Container(
                  child: controller.isLoading.value ? Center(
                    child: Padding(
                      padding: scale.getPadding(top: 10),
                      child: CircularProgressIndicator(
                        color: AppColors.secondaryLight,
                      ),
                    ),
                  ) : CustomScrollView(
                    controller: controller.scroll,
                    shrinkWrap: true,
                    slivers: [
                      SliverAppBar(
                        expandedHeight: 400.0,
                        pinned: true,
                        backgroundColor: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.black : AppColors.backgroundColor,
                        surfaceTintColor: Colors.transparent,
                        automaticallyImplyLeading: false,
                        actionsPadding: scale.getPadding(
                          right: 10,
                        ),
                        leading: Padding(
                          padding: scale.getPadding(left: 10),
                          child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: CircleAvatar(
                              backgroundColor: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight :AppColors.white,
                              child: Icon(
                                Icons.arrow_back_outlined,
                              ),
                            ),
                          ),
                        ),
                        actions: [
                          GestureDetector(
                            onTap: () async {
                              final box = context.findRenderObject() as RenderBox?;

                              await Share.share(
                                'https://carsandallweb.netlify.app/${controller.vehicleDetail.value.category}/${controller.vehicleDetail.value.subCategory}/${controller.vehicleDetail.value.filters!.brand!.toLowerCase().replaceAll(' ', '-')}-${controller.vehicleDetail.value.filters!.model!.toLowerCase().replaceAll(' ', '-')}/${controller.vehicleDetail.value.id}',
                                subject: 'Checkout this product',
                                sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
                              );
                            },
                            child: CircleAvatar(
                              backgroundColor: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.white,
                              child: Icon(
                                Icons.share_outlined,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: scale.getScaledWidth(10),
                          ),
                          GestureDetector(
                            onTap: () {
                              if(!controller.isFavorite.value){
                                controller.addToFavorite();
                              }else {
                                controller.removeFavorite();
                              }
                            },
                            child: CircleAvatar(
                              backgroundColor: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.white,
                              child: Obx(
                                () => Icon(
                                  !controller.isFavorite.value
                                      ? Icons.bookmark_border
                                      : Icons.bookmark,
                                ),
                              ),
                            ),
                          ),
                        ],
                        flexibleSpace: FlexibleSpaceBar(
                          background: PageView.builder(
                            controller: controller.pageController,
                            itemCount: controller.vehicleDetail.value.images?.length?? 0,
                            itemBuilder: (context, index) {
                              return CustomImageView(
                                path: controller.vehicleDetail.value.images?[index]?? '',
                                fit: BoxFit.fitWidth,
                              );
                            }
                          )
                        ),
                        primary: true,
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: scale.getPadding(
                            horizontal: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  padding: scale.getPadding(
                                    horizontal: 8,
                                    vertical: 8,
                                  ),
                                  margin: scale.getMargin(
                                    right: 10,
                                    left: 10,
                                    bottom: 20,
                                  ),
                                  decoration: BoxDecoration(
                                    color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.white,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    alignment: WrapAlignment.center,
                                    children: List.generate(controller.vehicleDetail.value.images!.length, (index) {
                                      return index >= 9 ? Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryLight,
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                        height: scale.getScaledHeight(40),
                                        width: scale.getScaledWidth(40),
                                        alignment: Alignment.center,
                                        child: Text(
                                          '+${controller.vehicleDetail.value.images!.length-1}',
                                          style: CustomTextStyle.txtPoppins12White300.copyWith(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ) : GestureDetector(
                                        onTap: () {
                                          controller.pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          height: scale.getScaledHeight(40),
                                          child: Image.network(
                                            controller.vehicleDetail.value.images![index],
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: scale.getScaledHeight(10),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: scale.getScaledWidth(190),
                                        child: Text(
                                          '${controller.vehicleDetail.value.filters!.brand} ${controller.vehicleDetail.value.filters!.model}',
                                          style: CustomTextStyle.txtPoppins20W700.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: scale.getScaledFont(18),
                                            color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.black,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10,),
                                      Icon(
                                        Icons.location_on_outlined,
                                        color: AppColors.primaryLight,
                                        size: scale.getScaledFont(14),
                                      ),
                                      SizedBox(width: 2,),
                                      Text(
                                        '${controller.vehicleDetail.value.location!.city}',
                                        style: CustomTextStyle.txtPoppins14Black700.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.primaryLight,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: scale.getMargin(
                                      vertical: 10,
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: scale.getPadding(
                                            horizontal: 10,
                                            vertical: 8,
                                          ),
                                          decoration: BoxDecoration(
                                            color: AppColors.secondaryLight,
                                            borderRadius: BorderRadius.circular(100),
                                          ),
                                          child: Text(
                                            tr('kyc_verified'),
                                            style: CustomTextStyle.txtPoppins10W400.copyWith(
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.black,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: scale.getMargin(
                                            horizontal: 15,
                                          ),
                                          height: scale.getScaledHeight(40),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Get.dialog(
                                                  barrierDismissible: false,
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      const CircularProgressIndicator(),
                                                    ],
                                                  )
                                              );
                                              controller.getRating();
                                            },
                                            style: ElevatedButton.styleFrom(
                                                padding: scale.getPadding(
                                                  horizontal: 15,
                                                )
                                            ),
                                            child: Text(
                                              tr('view_seller_details'),
                                              style: CustomTextStyle.txtPoppins12White300.copyWith(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    'Rs ${formatWithCommas(controller.vehicleDetail.value.askingPrice)}',
                                    style: CustomTextStyle.txtPoppins14Black700.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.black,
                                      fontSize: scale.getScaledFont(14),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: scale.getScaledHeight(10),
                                  // ),
                                  // Row(
                                  //   children: [
                                  //     Text(
                                  //       'EMI from Rs. 6789.',
                                  //       style: CustomTextStyle.txtPoppins12White300.copyWith(
                                  //         fontWeight: FontWeight.w400,
                                  //         color: AppColors.black2020,
                                  //       ),
                                  //     ),
                                  //     GestureDetector(
                                  //       onTap: () {
                                  //         NestedNavigationEmi nestedNavigation = NestedNavigationEmi.emiCalculatorScreen;
                                  //         showModalBottomSheet(
                                  //           useRootNavigator: true,
                                  //           backgroundColor: Colors.transparent,
                                  //           scrollControlDisabledMaxHeightRatio: 0.85,
                                  //           shape: RoundedRectangleBorder(
                                  //               borderRadius: BorderRadiusDirectional.vertical(
                                  //                 top: Radius.circular(50),
                                  //               )
                                  //           ),
                                  //           context: context,
                                  //           builder: (context) {
                                  //             return Container(
                                  //               decoration: BoxDecoration(
                                  //                   color: AppColors.white,
                                  //                   borderRadius: BorderRadius.vertical(
                                  //                     top: Radius.circular(40),
                                  //                   )
                                  //               ),
                                  //               child: Navigator(
                                  //                 key: Get.nestedKey(2),
                                  //                 initialRoute: AppRoutes.emiCalculatorScreen,
                                  //                 onGenerateRoute: (settings) {
                                  //                   switch(settings.name){
                                  //                     case AppRoutes.emiCalculatorScreen:
                                  //                       return GetPageRoute(
                                  //                         page: () => EmiCalculatorScreen(
                                  //                           nestedNavigation: nestedNavigation,
                                  //                         ),
                                  //                         maintainState: true,
                                  //                       );
                                  //                     case AppRoutes.loanSummaryScreen:
                                  //                       return GetPageRoute(
                                  //                         page: () => LoanSummaryScreen(
                                  //                           nestedNavigation: nestedNavigation,
                                  //                         ),
                                  //                         maintainState: true,
                                  //                       );
                                  //                     default:
                                  //                       return null;
                                  //                   }
                                  //                 },
                                  //               ),
                                  //             );
                                  //           },
                                  //         );
                                  //       },
                                  //       child: Container(
                                  //         margin: scale.getMargin(
                                  //           left: 10,
                                  //         ),
                                  //         padding: scale.getPadding(
                                  //           horizontal: 8,
                                  //           vertical: 4,
                                  //         ),
                                  //         decoration: BoxDecoration(
                                  //           border: Border.all(
                                  //             width: 1,
                                  //             color: AppColors.secondaryLight,
                                  //           ),
                                  //           borderRadius: BorderRadius.circular(100),
                                  //         ),
                                  //         child: Text(
                                  //           'Get EMI Calculator',
                                  //           style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                  //             color: AppColors.primaryLight,
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  SizedBox(
                                    height: scale.getScaledHeight(8),
                                  ),
                                  Text(
                                    tr('description'),
                                    style: CustomTextStyle.txtPoppins14Black700.copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: scale.getScaledFont(15),
                                      color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: scale.getScaledHeight(3),
                                  ),
                                  RichText(
                                    maxLines: 6,
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                        text: '${controller.vehicleDetail.value.description}',
                                        style: CustomTextStyle.txtPoppins10W400.copyWith(
                                          color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.black,
                                          fontSize: scale.getScaledFont(12),
                                        ),
                                        children: [
                                          // TextSpan(
                                          //   text: ' View more...',
                                          //   style: CustomTextStyle.txtPoppins10W400.copyWith(
                                          //     color: AppColors.primaryLight,
                                          //     fontSize: scale.getScaledFont(11),
                                          //   ),
                                          // ),
                                        ]
                                    ),
                                  ),
                                  Container(
                                    margin: scale.getMargin(
                                      vertical: 10,
                                    ),
                                    alignment: Alignment.center,
                                    child: TabBar(
                                      labelStyle: CustomTextStyle.txtPoppins12Black500.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.primaryLight,
                                      ),
                                      unselectedLabelStyle: CustomTextStyle.txtPoppins12Black500.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff202020),
                                      ),
                                      padding: scale.getPadding(
                                          left: 0
                                      ),
                                      tabAlignment: TabAlignment.center,
                                      dividerColor: Colors.transparent,
                                      indicatorColor: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.primaryLight,
                                      unselectedLabelColor: Color(0xff202020),
                                      labelColor:  AppColors.primaryLight,
                                      indicatorPadding: EdgeInsets.zero,
                                      labelPadding: scale.getPadding(
                                          right: 10,
                                          left: 10
                                      ),
                                      onTap: (index) {
                                        // ref.read(carDetailProvider)?.changeTabIndex(index);
                                      },
                                      tabs: [
                                        Tab(
                                          child: Row(
                                            children: [
                                              Obx(
                                                () {
                                                    return Text(
                                                      "\$",
                                                      style: controller.currentTab.value != 0 ? CustomTextStyle.txtPoppins10W400.copyWith(
                                                        fontSize: scale.getScaledFont(11),
                                                        color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.black2020,
                                                      ) : CustomTextStyle.txtPoppins10W400.copyWith(
                                                        fontSize: scale.getScaledFont(11),
                                                        color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.primaryLight,
                                                      ),
                                                    );
                                                  }
                                              ),
                                              SizedBox(
                                                width: scale.getScaledWidth(5),
                                              ),
                                              Obx(
                                                () {
                                                    return Text(
                                                      'Overview',
                                                      style: controller.currentTab.value != 0 ? CustomTextStyle.txtPoppins10W400.copyWith(
                                                        fontSize: scale.getScaledFont(11),
                                                        color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.black2020,
                                                      ) : CustomTextStyle.txtPoppins10W400.copyWith(
                                                        fontSize: scale.getScaledFont(11),
                                                        color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.primaryLight,
                                                      ),
                                                    );
                                                  }
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Tab(
                                        //   child: Row(
                                        //     children: [
                                        //       SvgPicture.asset(
                                        //         AssetConstant.carStarring,
                                        //         color: ref.watch(carDetailProvider)?.currentTab != 1
                                        //             ? AppColors.black2020
                                        //             : AppColors.primaryLight,
                                        //       ),
                                        //       SizedBox(
                                        //         width: scale.getScaledWidth(5),
                                        //       ),
                                        //       Text(
                                        //         'Presentation',
                                        //         style: ref.watch(carDetailProvider)?.currentTab != 1 ? CustomTextStyle.txtPoppins10W400.copyWith(
                                        //           fontSize: scale.getScaledFont(10),
                                        //           color: AppColors.black2020,
                                        //         ) : CustomTextStyle.txtPoppins10W400.copyWith(
                                        //           fontSize: scale.getScaledFont(10),
                                        //           color: AppColors.primaryLight,
                                        //         ),
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),
                                        // Tab(
                                        //   child: Row(
                                        //     children: [
                                        //       Icon(
                                        //         Icons.star_border_outlined,
                                        //         color: ref.watch(carDetailProvider)?.currentTab != 2
                                        //             ? AppColors.black2020
                                        //             : AppColors.primaryLight,
                                        //         size: scale.getScaledFont(15),
                                        //       ),
                                        //       SizedBox(
                                        //         width: scale.getScaledWidth(5),
                                        //       ),
                                        //       Text(
                                        //         'Features',
                                        //         style: ref.watch(carDetailProvider)?.currentTab != 2 ? CustomTextStyle.txtPoppins10W400.copyWith(
                                        //           fontSize: scale.getScaledFont(10),
                                        //           color: AppColors.black2020,
                                        //         ) : CustomTextStyle.txtPoppins10W400.copyWith(
                                        //           fontSize: scale.getScaledFont(10),
                                        //           color: AppColors.primaryLight,
                                        //         ),
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),
                                        // Tab(
                                        //   child: Row(
                                        //     children: [
                                        //       SvgPicture.asset(
                                        //         AssetConstant.carIcon,
                                        //         color: ref.watch(carDetailProvider)?.currentTab !=3
                                        //             ? AppColors.black2020
                                        //             : AppColors.primaryLight,
                                        //       ),
                                        //       SizedBox(
                                        //         width: scale.getScaledWidth(5),
                                        //       ),
                                        //       Text(
                                        //         'Safety',
                                        //         style: ref.watch(carDetailProvider)?.currentTab != 3 ? CustomTextStyle.txtPoppins10W400.copyWith(
                                        //           fontSize: scale.getScaledFont(10),
                                        //           color: AppColors.black2020,
                                        //         ) : CustomTextStyle.txtPoppins10W400.copyWith(
                                        //           fontSize: scale.getScaledFont(10),
                                        //           color: AppColors.primaryLight,
                                        //         ),
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: scale.getScaledHeight(400),
                                    child: TabBarView(
                                      physics: NeverScrollableScrollPhysics(),
                                      children: [
                                        OverviewTab(),
                                        // PresentationTab(),
                                        // FeatureTab(),
                                        // SafetyTab()
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '${tr('find_best')} ${tr(controller.vehicleDetail.value.category!)}',
                                      style: CustomTextStyle.txtPoppins16Black500.copyWith(
                                        color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.black,
                                        fontSize: scale.getScaledFont(16),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: scale.getMargin(
                                      vertical: 15,
                                    ),
                                    height: scale.getScaledHeight(265),
                                    child: VehicleListViewTile(
                                      vehicleModel: controller.findBestCars.value,
                                    ),
                                  )
                                  // Container(
                                  //   padding: scale.getPadding(
                                  //     horizontal: 15,
                                  //     vertical: 10,
                                  //   ),
                                  //   margin: scale.getMargin(
                                  //     bottom: 30,
                                  //   ),
                                  //   decoration: BoxDecoration(
                                  //     borderRadius: BorderRadius.circular(6),
                                  //     color: AppColors.primaryLight,
                                  //   ),
                                  //   child: Row(
                                  //     crossAxisAlignment: CrossAxisAlignment.start,
                                  //     children: [
                                  //       Image.asset(
                                  //         AssetConstant.pdfDownloadIcon,
                                  //         height: scale.getScaledHeight(34),
                                  //         width: scale.getScaledWidth(34),
                                  //       ),
                                  //       Container(
                                  //         width: scale.getScaledWidth(240),
                                  //         margin: scale.getMargin(
                                  //           left: 11,
                                  //         ),
                                  //         child: Column(
                                  //           crossAxisAlignment: CrossAxisAlignment.start,
                                  //           children: [
                                  //             Text(
                                  //               '${controller.vehicleDetail.value.filters!.brand}',
                                  //               style: CustomTextStyle.txtPoppins12White300.copyWith(
                                  //                 fontWeight: FontWeight.w500,
                                  //                 fontSize: scale.getScaledFont(12),
                                  //               ),
                                  //             ),
                                  //             Text(
                                  //               'Download ${controller.vehicleDetail.value.filters!.brand} brochure in just one click to view specs and features of all the variants of ${controller.vehicleDetail.value.filters!.brand}.',
                                  //               style: CustomTextStyle.txtPoppins10W400.copyWith(
                                  //                 color: AppColors.white,
                                  //               ),
                                  //             ),
                                  //             SizedBox(
                                  //               height: scale.getScaledHeight(5),
                                  //             ),
                                  //             Row(
                                  //               children: [
                                  //                 Icon(
                                  //                   Icons.file_download_outlined,
                                  //                   color: AppColors.white,
                                  //                   size: scale.getScaledFont(16),
                                  //                 ),
                                  //                 SizedBox(
                                  //                   width: scale.getScaledWidth(5),
                                  //                 ),
                                  //                 Text(
                                  //                   'Download Brochue',
                                  //                   style: CustomTextStyle.txtPoppins10W400.copyWith(
                                  //                     color: AppColors.white,
                                  //                     fontWeight: FontWeight.w500,
                                  //                   ),
                                  //                 )
                                  //               ],
                                  //             )
                                  //           ],
                                  //         ),
                                  //       )
                                  //     ],
                                  //   ),
                                  // ),
                                  // Text(
                                  //   'Reviews & Rating',
                                  //   style: CustomTextStyle.txtPoppins14Black700.copyWith(
                                  //     fontWeight: FontWeight.w500,
                                  //     fontSize: scale.getScaledFont(15),
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   height: scale.getScaledHeight(10),
                                  // ),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //   children: [
                                  //     Row(
                                  //       children: [
                                  //         Icon(
                                  //           Icons.star_border_outlined,
                                  //           color: AppColors.secondaryLight,
                                  //           size: scale.getScaledFont(20),
                                  //         ),
                                  //         SizedBox(
                                  //           width: scale.getScaledWidth(8),
                                  //         ),
                                  //         Text(
                                  //           '${controller.reviewSummary.value.averageRating}/5',
                                  //           style: CustomTextStyle.txtPoppins20W700.copyWith(
                                  //             fontWeight: FontWeight.w500,
                                  //             color: AppColors.black,
                                  //           ),
                                  //         ),
                                  //         SizedBox(
                                  //           width: scale.getScaledWidth(8),
                                  //         ),
                                  //         Text(
                                  //           '(${controller.reviewSummary.value.totalReviews!} reviews)',
                                  //           style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                  //             fontWeight: FontWeight.w400,
                                  //           ),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //     Text(
                                  //       'view all',
                                  //       style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                  //         color: AppColors.primaryLight,
                                  //         fontWeight: FontWeight.w400,
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                  // Container(
                                  //   margin: scale.getMargin(
                                  //     vertical: 11,
                                  //   ),
                                  //   child: Row(
                                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //     children: [
                                  //       IconTile(
                                  //         scale: scale,
                                  //         icon: Icon(
                                  //           Icons.star_border_outlined,
                                  //           size: scale.getScaledFont(16),
                                  //           color: AppColors.white,
                                  //         ),
                                  //         tileText: 'All',
                                  //         isSelected: true,
                                  //         selectedTextStyle: CustomTextStyle.txtPoppins12Black500.copyWith(
                                  //           fontWeight: FontWeight.w400,
                                  //           color: AppColors.white,
                                  //         ),
                                  //         selectedColor: AppColors.primaryLight,
                                  //         unSelectedColor: Colors.transparent,
                                  //         unSelectedTextStyle: CustomTextStyle.txtPoppins12Black500.copyWith(
                                  //           fontWeight: FontWeight.w400,
                                  //           color: AppColors.primaryLight,
                                  //         ),
                                  //       ),
                                  //       IconTile(
                                  //         scale: scale,
                                  //         icon: Icon(
                                  //           Icons.star_border_outlined,
                                  //           color: AppColors.primaryLight,
                                  //           size: scale.getScaledFont(16),
                                  //         ),
                                  //         tileText: '1',
                                  //         isSelected: false,
                                  //         selectedTextStyle: CustomTextStyle.txtPoppins12Black500.copyWith(
                                  //           fontWeight: FontWeight.w400,
                                  //           color: AppColors.white,
                                  //         ),
                                  //         selectedColor: AppColors.primaryLight,
                                  //         unSelectedColor: Colors.transparent,
                                  //         unSelectedTextStyle: CustomTextStyle.txtPoppins12Black500.copyWith(
                                  //           fontWeight: FontWeight.w400,
                                  //           color: AppColors.primaryLight,
                                  //         ),
                                  //       ),
                                  //       IconTile(
                                  //         scale: scale,
                                  //         icon: Icon(
                                  //           Icons.star_border_outlined,
                                  //           color: AppColors.primaryLight,
                                  //           size: scale.getScaledFont(16),
                                  //         ),
                                  //         tileText: '2',
                                  //         isSelected: false,
                                  //         selectedTextStyle: CustomTextStyle.txtPoppins12Black500.copyWith(
                                  //           fontWeight: FontWeight.w400,
                                  //           color: AppColors.white,
                                  //         ),
                                  //         selectedColor: AppColors.primaryLight,
                                  //         unSelectedColor: Colors.transparent,
                                  //         unSelectedTextStyle: CustomTextStyle.txtPoppins12Black500.copyWith(
                                  //           fontWeight: FontWeight.w400,
                                  //           color: AppColors.primaryLight,
                                  //         ),
                                  //       ),
                                  //       IconTile(
                                  //         scale: scale,
                                  //         icon: Icon(
                                  //           Icons.star_border_outlined,
                                  //           color: AppColors.primaryLight,
                                  //           size: scale.getScaledFont(16),
                                  //         ),
                                  //         tileText: '3',
                                  //         isSelected: false,
                                  //         selectedTextStyle: CustomTextStyle.txtPoppins12Black500.copyWith(
                                  //           fontWeight: FontWeight.w400,
                                  //           color: AppColors.white,
                                  //         ),
                                  //         selectedColor: AppColors.primaryLight,
                                  //         unSelectedColor: Colors.transparent,
                                  //         unSelectedTextStyle: CustomTextStyle.txtPoppins12Black500.copyWith(
                                  //           fontWeight: FontWeight.w400,
                                  //           color: AppColors.primaryLight,
                                  //         ),
                                  //       ),
                                  //       IconTile(
                                  //         scale: scale,
                                  //         icon: Icon(
                                  //           Icons.star_border_outlined,
                                  //           color: AppColors.primaryLight,
                                  //           size: scale.getScaledFont(16),
                                  //         ),
                                  //         tileText: '4',
                                  //         isSelected: false,
                                  //         selectedTextStyle: CustomTextStyle.txtPoppins12Black500.copyWith(
                                  //           fontWeight: FontWeight.w400,
                                  //           color: AppColors.white,
                                  //         ),
                                  //         selectedColor: AppColors.primaryLight,
                                  //         unSelectedColor: Colors.transparent,
                                  //         unSelectedTextStyle: CustomTextStyle.txtPoppins12Black500.copyWith(
                                  //           fontWeight: FontWeight.w400,
                                  //           color: AppColors.primaryLight,
                                  //         ),
                                  //       ),
                                  //       IconTile(
                                  //         scale: scale,
                                  //         icon: Icon(
                                  //           Icons.star_border_outlined,
                                  //           color: AppColors.primaryLight,
                                  //           size: scale.getScaledFont(16),
                                  //         ),
                                  //         tileText: '5',
                                  //         isSelected: false,
                                  //         selectedTextStyle: CustomTextStyle.txtPoppins12Black500.copyWith(
                                  //           fontWeight: FontWeight.w400,
                                  //           color: AppColors.white,
                                  //         ),
                                  //         selectedColor: AppColors.primaryLight,
                                  //         unSelectedColor: Colors.transparent,
                                  //         unSelectedTextStyle: CustomTextStyle.txtPoppins12Black500.copyWith(
                                  //           fontWeight: FontWeight.w400,
                                  //           color: AppColors.primaryLight,
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  // ListView.builder(
                                  //   itemCount: 6,
                                  //   physics: NeverScrollableScrollPhysics(),
                                  //   shrinkWrap: true,
                                  //   itemBuilder: (context, index) {
                                  //     return Container(
                                  //       margin: scale.getMargin(
                                  //         bottom: 12,
                                  //       ),
                                  //       padding: scale.getPadding(
                                  //         bottom: 12,
                                  //       ),
                                  //       decoration: BoxDecoration(
                                  //         borderRadius: BorderRadius.circular(6),
                                  //         color: AppColors.white,
                                  //       ),
                                  //       child: Column(
                                  //         children: [
                                  //           ListTile(
                                  //             title: Text(
                                  //               'Jinney Oslin',
                                  //               style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                  //                 fontWeight: FontWeight.w700,
                                  //               ),
                                  //             ),
                                  //             subtitle: Text(
                                  //               'A day ago',
                                  //               style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                  //                 fontWeight: FontWeight.w400,
                                  //                 color: Color(0xff202020).withOpacity(0.70),
                                  //               ),
                                  //             ),
                                  //             leading: CircleAvatar(
                                  //               radius: scale.getScaledFont(18),
                                  //               backgroundImage: AssetImage(
                                  //                 AssetConstant.personImage,
                                  //               ),
                                  //             ),
                                  //             trailing: Wrap(
                                  //               children: List.generate(5, (index) {
                                  //                 return Icon(
                                  //                   Icons.star,
                                  //                   color: AppColors.secondaryLight,
                                  //                   size: scale.getScaledFont(16),
                                  //                 );
                                  //               }),
                                  //             ),
                                  //             titleAlignment: ListTileTitleAlignment.top,
                                  //             dense: true,
                                  //           ),
                                  //           Container(
                                  //             padding: scale.getPadding(
                                  //               left: 12,
                                  //               right: 18,
                                  //             ),
                                  //             child: Text(
                                  //               'Nostrud excepteur magna id est quis in aliqua consequat. Exercitation enim eiusmod elit sint laborum',
                                  //               style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                  //                 fontWeight: FontWeight.w400,
                                  //                 color: Color(0xff202020),
                                  //               ),
                                  //             ),
                                  //           ),
                                  //           Padding(
                                  //             padding: scale.getPadding(horizontal: 12),
                                  //             child: Row(
                                  //               children: [
                                  //                 Text(
                                  //                   'Is this review helpful?',
                                  //                   style: CustomTextStyle.txtPoppins10W400.copyWith(
                                  //                     fontSize: scale.getScaledFont(8),
                                  //                   ),
                                  //                 ),
                                  //                 Container(
                                  //                   margin: scale.getMargin(
                                  //                     horizontal: 10,
                                  //                   ),
                                  //                   padding: scale.getPadding(
                                  //                     left: 10,
                                  //                     right: 10,
                                  //                     top: 1,
                                  //                     bottom: 3,
                                  //                   ),
                                  //                   decoration: BoxDecoration(
                                  //                       color: Colors.transparent,
                                  //                       borderRadius: BorderRadius.circular(20),
                                  //                       border: Border.all(
                                  //                         color: Color(0xff9DB2CE),
                                  //                       )
                                  //                   ),
                                  //                   child: Text(
                                  //                     'Yes',
                                  //                     style: CustomTextStyle.txtPoppins10W400.copyWith(
                                  //                       fontSize: scale.getScaledFont(8),
                                  //                     ),
                                  //                   ),
                                  //                 ),
                                  //                 Container(
                                  //                   padding: scale.getPadding(
                                  //                     left: 10,
                                  //                     right: 10,
                                  //                     top: 1,
                                  //                     bottom: 3,
                                  //                   ),
                                  //                   decoration: BoxDecoration(
                                  //                       color: Colors.transparent,
                                  //                       borderRadius: BorderRadius.circular(20),
                                  //                       border: Border.all(
                                  //                         color: Color(0xff9DB2CE),
                                  //                       )
                                  //                   ),
                                  //                   child: Text(
                                  //                     'No',
                                  //                     style: CustomTextStyle.txtPoppins10W400.copyWith(
                                  //                       fontSize: scale.getScaledFont(8),
                                  //                     ),
                                  //                   ),
                                  //                 ),
                                  //               ],
                                  //             ),
                                  //           )
                                  //         ],
                                  //       ),
                                  //     );
                                  //   },
                                  // )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                );
              }
            ),
            bottomNavigationBar: Container(
              padding: scale.getPadding(
                horizontal: 20,
                vertical: 20,
              ),
              color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.black : AppColors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: scale.getScaledWidth(150),
                    height: scale.getScaledHeight(40),
                    padding: scale.getPadding(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.secondaryLight,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        if(UserStore.to.uid.value == ""){
                          Get.toNamed(AppRoutes.loginWithPhone);
                        } else {
                          controller.generateConversation();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        padding: scale.getPadding(
                          vertical: 20,
                        ),
                      ),
                      child: Text(
                        tr('chat'),
                        style: CustomTextStyle.txtPoppins12Black500.copyWith(
                          color: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.primaryLight,
                          fontSize: scale.getScaledFont(15),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: scale.getScaledWidth(150),
                    height: scale.getScaledHeight(40),
                    child: ElevatedButton(
                      onPressed: () async {
                        if(UserStore.to.uid.value == ""){
                          Get.toNamed(AppRoutes.loginWithPhone);
                        } else {
                          final Uri uri = Uri.parse('tel:+91${controller.vehicleDetail.value.user!.userPhone}');
                          try {
                            await launchUrl(uri);
                          } catch (e) {
                            customSnackBar(
                              type: AnimatedSnackBarType.error,
                              message: "Could not make a call to ${controller.vehicleDetail.value.user!.userPhone}",
                            );
                          }
                        }
                      },
                      //   showModalBottomSheet(
                      //     backgroundColor: Colors.transparent,
                      //     scrollControlDisabledMaxHeightRatio: 0.85,
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadiusDirectional.vertical(
                      //           top: Radius.circular(50),
                      //         )
                      //     ),
                      //     context: context,
                      //     builder: (context) {
                      //       return Container(
                      //         decoration: BoxDecoration(
                      //             color: AppColors.white,
                      //             borderRadius: BorderRadius.vertical(
                      //               top: Radius.circular(40),
                      //             )
                      //         ),
                      //         child: MakeAnOfferScreen(),
                      //       );
                      //     },
                      //   );
                      // },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: (controller.vehicleDetail.value.subCategory == 'luxury' || controller.vehicleDetail.value.subCategory == 'premium') ? AppColors.secondaryLight : AppColors.primaryLight,
                        padding: scale.getPadding(
                          vertical: 20,
                        ),
                      ),
                      child: Text(
                        tr('call'),
                        style: CustomTextStyle.txtPoppins12Black500.copyWith(
                          color: AppColors.white,
                          fontSize: scale.getScaledFont(15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
