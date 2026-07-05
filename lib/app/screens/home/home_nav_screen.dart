import 'package:cars_and_alll/app/bindings/chatBinding.dart';
import 'package:cars_and_alll/app/bindings/homeBinding.dart';
import 'package:cars_and_alll/app/bindings/reelsBinding.dart';
import 'package:cars_and_alll/app/constants/assetConstant.dart';
import 'package:cars_and_alll/app/controller/home_nav_controller.dart';
import 'package:cars_and_alll/app/routes/app_router.dart';
import 'package:cars_and_alll/app/routes/app_routes.dart';
import 'package:cars_and_alll/app/screens/home/views/addNewPostScreen.dart';
import 'package:cars_and_alll/app/screens/home/views/home_screen.dart';
import 'package:cars_and_alll/app/screens/home/views/myListingScreen.dart';
import 'package:cars_and_alll/app/screens/home/views/servicesScreen.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:cars_and_alll/shared/theme/theme_helper.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:super_tooltip/super_tooltip.dart';

import '../../../shared/theme/custom_text_style.dart';
import '../../bindings/categoryBinding.dart';
import '../../models/enum/nested_navigation.dart';
import '../../services/user.dart';
import '../../utils/scale_utility.dart';
import '../chat/chat_screen.dart';
import '../search/coming_soon_screen.dart';
import 'views/category_screen.dart';
import '../chat/chat_space_screen.dart';
import 'views/reels_screen.dart';

class HomeNavScreen extends GetView<BottomNavController> {
  const HomeNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    NestedNavigation nestedNavigation = NestedNavigation.homeScreen;
    return Scaffold(
        extendBody: true,
        body: Navigator(
        key: Get.nestedKey(nestedNavigation.navID!),
        initialRoute: AppRoutes.home,
        onGenerateRoute: (settings) {
          switch(settings.name){
            case AppRoutes.home:
              return GetPageRoute(
                page: () => HomeScreen(),
                binding: HomeBinding(),
              );
            case AppRoutes.chatScreen:
              return GetPageRoute(
                page: () => ChatScreen(),
                binding: ChatBinding(),
              );
            case AppRoutes.comingSoonScreen:
              return GetPageRoute(
                page: () => ComingSoonScreen(),
              );
            case AppRoutes.serviceScreen:
              return GetPageRoute(
                page: () => ServicesScreen(),
              );
            default:
              return null;
          }
        },
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          if(UserStore.to.uid.value == ""){
            Get.toNamed(AppRoutes.loginWithPhone);
          } else {
            Get.toNamed(AppRoutes.getVehicleDetails);
          }
        },
        child: CircleAvatar(
          radius: scale.getScaledFont(25),
          backgroundColor: AppColors.secondaryLight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_circle_outline, size: 20, color: Colors.white,),
              Text(
                tr('sell'),
                style: CustomTextStyle.txtPoppins10W400.copyWith(
                  color: AppColors.white,
                  fontSize: scale.getScaledFont(12),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        padding: scale.getPadding(
          left: 20,
          right: 20,
          top: 10,
        ),
        height: scale.getScaledHeight(55),
        color: AppColors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                if(controller.index.value != 0) {
                  controller.updateIndex(0);
                  Get.toNamed(AppRoutes.home, id: nestedNavigation.navID!);
                }
              },
              child: Column(
                children: [
                  Obx(
                    () {
                      return SvgPicture.asset(
                        controller.index.value == 0
                            ? AssetConstant.homeSelected
                            : AssetConstant.home,
                      );
                    }
                  ),
                  Obx(
                    () {
                      return Text(
                        tr('home'),
                        style: CustomTextStyle.txtPoppins12White300.copyWith(
                          fontWeight: FontWeight.w400,
                          color: controller.index.value == 0
                              ? AppColors.selectionColor
                              : AppColors.black,
                        ),
                      );
                    }
                  ),
                ],
              ),
            ),
            Container(
              margin: scale.getMargin(
                right: 40,
              ),
              child: GestureDetector(
                onTap: () {
                  if(UserStore.to.uid.value == ""){
                    Get.toNamed(AppRoutes.loginWithPhone);
                  }else{
                    Get.toNamed(AppRoutes.myListingScreen);
                  }
                },
                child: Column(
                  children: [
                    Obx(
                      () {
                        return SvgPicture.asset(
                          controller.index.value == 1
                              ? AssetConstant.categorySelected
                              : AssetConstant.category,
                        );
                      }
                    ),
                    Obx(
                      () {
                        return Text(
                          tr('my_listing'),
                          style: CustomTextStyle.txtPoppins12White300.copyWith(
                            fontWeight: FontWeight.w400,
                            color: controller.index.value == 1
                                ? AppColors.selectionColor
                                : AppColors.black,
                          ),
                        );
                      }
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if(controller.index.value != 2) {
                  if(UserStore.to.uid.value == ""){
                    Get.toNamed(AppRoutes.loginWithPhone);
                  }else {
                    Get.toNamed(AppRoutes.chatScreen);
                  }
                }
              },
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Obx(
                        () {
                            return SvgPicture.asset(
                              controller.index.value == 2
                                  ? AssetConstant.chatSelected
                                  : AssetConstant.chat,
                            );
                          }
                      ),
                      Obx((){
                        if (controller.unseenChat.value.summary?.totalUnseen != null && controller.unseenChat.value.summary!.totalUnseen! > 0) {
                          return Positioned(
                            top: -6,
                            right: -19,
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              margin: scale.getMargin(
                                left: 2,
                                right: 6
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 10,
                                minHeight: 10,
                              ),
                              child: Center(
                                child: Text(
                                  controller.unseenChat.value.summary!.totalUnseen! > 99 ? '99+' : '${controller.unseenChat.value.summary!.totalUnseen}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      }),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Obx(
                    () {
                      return Text(
                        tr('chat'),
                        style: CustomTextStyle.txtPoppins12White300.copyWith(
                          fontWeight: FontWeight.w400,
                          color: controller.index.value == 2
                              ? AppColors.selectionColor
                              : AppColors.black,
                        ),
                      );
                    }
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                if(controller.index.value != 3) {
                  Get.toNamed(AppRoutes.comingSoonScreen);
                }
              },
              child: Column(
                children: [
                  Obx(
                    () {
                      return SvgPicture.asset(
                        controller.index.value == 3
                            ? AssetConstant.reelsSelected
                            : AssetConstant.reels,
                      );
                    }
                  ),
                  Obx(
                    () {
                      return Text(
                        tr('reels'),
                        style: CustomTextStyle.txtPoppins12White300.copyWith(
                          fontWeight: FontWeight.w400,
                          color: controller.index.value == 3
                              ? AppColors.selectionColor
                              : AppColors.black,
                        ),
                      );
                    }
                  ),
                ],
              ),
            ),
          ],
        )
      )
    );
  }
}
