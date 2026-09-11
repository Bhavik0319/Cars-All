
import 'package:cars_and_alll/app/models/category_model.dart';
import 'package:cars_and_alll/app/routes/app_routes.dart';
import 'package:cars_and_alll/app/screens/home/controllers/home_controller.dart';
import 'package:cars_and_alll/app/screens/home/widgets/category_tile.dart';
import 'package:cars_and_alll/app/screens/home/widgets/homeHeader.dart';
import 'package:cars_and_alll/app/widgets/decoratedContainer.dart';
import 'package:cars_and_alll/shared/theme/custom_text_style.dart';
import 'package:easy_localization/easy_localization.dart' show tr;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../shared/color/app_color.dart';
import '../../../constants/assetConstant.dart';
import '../../../controller/home_nav_controller.dart';
import '../../../utils/scale_utility.dart';
import '../widgets/category_card_tile.dart';


class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          HomeHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Obx(
                () => controller.isLoading.value ? Center(
                  child: Padding(
                    padding: scale.getPadding(top: 10),
                    child: CircularProgressIndicator(
                      color: AppColors.secondaryLight,
                    ),
                  ),
                ) : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: scale.getPadding(top: 15,bottom: 10,left: 20),
                      child: Text(
                        tr("top_categories"),
                        style: CustomTextStyle.txtPoppins16Black500.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: scale.getScaledFont(14),
                        ),
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      padding: scale.getPadding(horizontal: 20),
                      child: Consumer(
                          builder: (context, ref, child) {
                            return Wrap(
                              alignment: WrapAlignment.center,
                              runSpacing: scale.getScaledHeight(10),
                              spacing: scale.getScaledWidth(6),
                              children: List.generate(
                                controller.allCategories.length?? 0,
                                    (index) {
                                  CategoryModel category = (controller.allCategories[index]);
                                  return GestureDetector(
                                    onTap: () {
                                      if(index == (controller.allCategories.length)-1){
                                        Get.toNamed(AppRoutes.futureScopeScreen);
                                      }else if(category.categorySlug == "cars" || category.categorySlug == "ev" || category.categorySlug == "bikes" || category.categorySlug == "machinery" ||category.categorySlug == "commercial" || category.categorySlug == "luxury-vehicles"){
                                        if(category.categorySlug == "luxury-vehicles") {
                                          Get.toNamed(AppRoutes.viewAllVehicles, arguments: {"category": category.categorySlug});
                                        } else {
                                          Get.toNamed(AppRoutes.viewAllVehicles, arguments: {"category": category.categorySlug});
                                        }
                                      }else {
                                        Get.toNamed(AppRoutes.comingSoonScreen);
                                      }
                                    },
                                    child: CategoryTile(category: category, scale: scale),
                                  );
                                },
                              ),
                            );
                          }
                      ),
                    ),
                    SizedBox(
                      height: scale.getScaledHeight(20),
                    ),
                    Obx(
                        () {
                          return CategoryCardTile(
                            scale: scale,
                            txt: tr('special_for_you'),
                            allVehicles: controller.allVehicles.value,
                            onViewAll: () {
                              Get.toNamed(AppRoutes.viewAllVehicles, arguments: {"category": "cars"});
                            },
                            onTapLatest: () {
                              controller.changeTap(1);
                            },
                          );
                        }
                    ),
                    SizedBox(
                      height: scale.getScaledHeight(20),
                    ),
                    Obx(
                        () {
                          return CategoryCardTile(
                            scale: scale,
                            allVehicles: controller.popularVehicles.value,
                            onViewAll: () {
                              Get.toNamed(AppRoutes.viewAllVehicles, arguments: {"category": "cars"});
                            },
                            onTapLatest: () {
                              controller.changeTap(1);
                            },
                            txt: tr('popular_vehicle'),
                          );
                        }
                    ),
                    Container(
                      padding: scale.getPadding(
                        horizontal: 10,
                        vertical: 10,
                      ),
                    ),
                    // Padding(
                    //   padding: scale.getPadding(
                    //       bottom: 10,
                    //       left: 20
                    //   ),
                    //   child: Text(
                    //     "Our Services",
                    //     style: CustomTextStyle.txtPoppins16Black500,
                    //   ),
                    // ),
                    // Container(
                    //   margin: scale.getMargin(
                    //     left: 20,
                    //     right: 20,
                    //   ),
                    //   child: MediaQuery.removePadding(
                    //     context: context,
                    //     removeTop: true,
                    //     child: Consumer(
                    //       builder: (context, ref, child) {
                    //         var homeController = ref.watch(homeProvider);
                    //         return GridView.count(
                    //           shrinkWrap: true,
                    //           physics: NeverScrollableScrollPhysics(),
                    //           crossAxisSpacing: 6,
                    //           mainAxisSpacing: 6,
                    //           crossAxisCount: 2,
                    //           children: List.generate(
                    //             homeController!.allServices.length,
                    //             (index) {
                    //               return ServicesTile(
                    //                 scale: scale,
                    //                 onTap: () {
                    //                   controller.navigateToService(index);
                    //                 },
                    //                 service: homeController.allServices[index],
                    //               );
                    //             },
                    //           ),
                    //         );
                    //       }
                    //     ),
                    //   ),
                    // ),
                    Obx(
                        () {
                          return CategoryCardTile(
                            scale: scale,
                            allVehicles: controller.allBikes.value,
                            onViewAll: () {
                              Get.toNamed(AppRoutes.viewAllVehicles, arguments: {"category": "bikes"});
                            },
                            onTapLatest: () {
                              controller.changeTap(1);
                            },
                            txt: tr('best_bikes'),
                          );
                        }
                    ),
                    Container(
                      margin: scale.getMargin(
                        vertical: 20,
                      ),
                      child: Image.asset(
                        AssetConstant.homePageBanner,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Obx(
                        () {
                          return CategoryCardTile(
                            scale: scale,
                            allVehicles: controller.allEv.value,
                            onViewAll: () {
                              Get.toNamed(AppRoutes.viewAllVehicles, arguments: {"category": "ev"});
                            },
                            onTapLatest: () {
                              controller.changeTap(1);
                            },
                            txt: tr('electric_vehicle'),
                          );
                        }
                    ),
                    SizedBox(
                      height: scale.getScaledHeight(20),
                    ),
                    Container(
                      padding: scale.getPadding(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      color: AppColors.white,
                      child: Wrap(
                        children: List.generate(3, (index) => DecoratedContainer(
                          margin: scale.getMargin(
                            left: 10,
                            right: 10,
                          ),
                          padding: scale.getPadding(
                            vertical: 1,
                            horizontal: 1
                          ),
                          fillColor: AppColors.backgroundColor,
                          height: scale.getScaledHeight(75),
                          width: scale.getScaledWidth(90),
                          image: AssetConstant.appLogoSqr,
                          child: Container(),
                        ),
                        ),
                      ),
                    ),
                    // Container(
                    //   padding: scale.getPadding(
                    //       bottom: 10,
                    //       left: 20
                    //   ),
                    //   child: Text(
                    //     "All Brands",
                    //     style: CustomTextStyle.txtPoppins16Black500,
                    //   ),
                    // ),
                    // Container(
                    //   margin: scale.getMargin(
                    //     horizontal: 20,
                    //   ),
                    //   alignment: Alignment.center,
                    //   child: Wrap(
                    //     spacing: 10,
                    //     runSpacing: 10,
                    //     children: List.generate(
                    //       12,
                    //       (index) {
                    //         return index != 11 ? Column(
                    //           children: [
                    //             CircleAvatar(
                    //               backgroundColor: Color(0xffD9D9D9),
                    //               radius: scale.getScaledFont(22),
                    //               child: Padding(
                    //                 padding: const EdgeInsets.all(8.0),
                    //                 child: Image.asset(
                    //                   AssetConstant.brandLogo,
                    //                 ),
                    //               ),
                    //             ),
                    //             Padding(
                    //               padding: scale.getPadding(
                    //                 top: 6,
                    //               ),
                    //               child: Text(
                    //                 'BMW',
                    //                 style: CustomTextStyle.txtPoppins10W400.copyWith(
                    //                   fontWeight: FontWeight.w500,
                    //                   color: AppColors.black,
                    //                 ),
                    //               ),
                    //             )
                    //           ],
                    //         ) : Column(
                    //           children: [
                    //             CircleAvatar(
                    //               backgroundColor: Color(0xffD9D9D9),
                    //               radius: scale.getScaledFont(22),
                    //               child: Padding(
                    //                 padding: const EdgeInsets.all(8.0),
                    //                 child: Icon(
                    //                   Icons.more_horiz,
                    //                   size: scale.getScaledFont(20),
                    //                   color: AppColors.primaryLight,
                    //                 )
                    //               ),
                    //             ),
                    //             Padding(
                    //               padding: scale.getPadding(
                    //                 top: 6,
                    //               ),
                    //               child: Text(
                    //                 'More',
                    //                 style: CustomTextStyle.txtPoppins10W400.copyWith(
                    //                   fontWeight: FontWeight.w500,
                    //                   color: AppColors.primaryLight,
                    //                 ),
                    //               ),
                    //             )
                    //           ],
                    //         );
                    //       },
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
