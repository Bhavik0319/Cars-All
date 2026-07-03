
import 'package:cars_and_alll/app/screens/home/controllers/home_controller.dart';
import 'package:cars_and_alll/app/services/user.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../shared/color/app_color.dart';
import '../../../../shared/theme/custom_text_style.dart';
import '../../../../shared/theme/theme_helper.dart';
import '../../../constants/assetConstant.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/scale_utility.dart';
import '../../../widgets/decoratedContainer.dart';
import '../../../widgets/location_popup.dart';

class HomeHeader extends GetView<HomeController> {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff636AE8),
            theme.primaryColor
          ],
          stops: [.16, .64],
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(scale.getScaledFont(6)),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: scale.getPadding(
              top: 40,
              left: 20,
              right: 20,
              bottom: 10,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.splashBackground,
                  radius: scale.getScaledFont(22),
                  backgroundImage: AssetImage(
                    AssetConstant.appLogoSqr,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return LocationPopup();
                      },
                    );
                  },
                  child: DecoratedContainer(
                    margin: scale.getMargin(
                      horizontal: 10,
                    ),
                    padding: scale.getPadding(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    fillColor: Colors.transparent,
                    width: scale.getScaledWidth(180),
                    height: scale.getScaledHeight(60),
                    child: Obx(
                            () {
                          return UserStore.to.userLocation.value.pincode == null || UserStore.to.userLocation.value.pincode == 0 ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                tr('select_location'),
                                style: CustomTextStyle.txtPoppins14Black700.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ) : Text(
                            '${UserStore.to.userLocation.value.name}, ${UserStore.to.userLocation.value.district}\n${UserStore.to.userLocation.value.state} - ${UserStore.to.userLocation.value.pincode}',
                            style: CustomTextStyle.txtPoppins14Black700.copyWith(
                              color: AppColors.white,
                              fontSize: scale.getScaledFont(10),
                            ),
                          );
                        }
                    ),
                  ),
                ),
                Obx(
                  () => UserStore.to.uid.value == "" ? GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.loginWithPhone);
                      },
                      child: DecoratedContainer(
                          borderRadius: 24,
                          fillColor: AppColors.white,
                          padding: scale.getPadding(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          child: Text(
                            tr('sign_in'),
                            style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                fontSize: scale.getScaledFont(12),
                                color: AppColors.primaryLight
                            ),
                          )
                      ),
                    ) : GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.profileScreen);
                      },
                      child: CircleAvatar(
                        radius: scale.getScaledFont(22),
                        backgroundImage: NetworkImage(
                          UserStore.to.profile.userProfileImage![0],
                        ),
                      )
                    )
                )
              ],
            ),
          ),
          Divider(
            color: AppColors.dividerColor,
            thickness: 1,
          ),
          Container(
            padding: scale.getPadding(
                vertical: 10,
                horizontal: 25
            ),
            color: Colors.transparent,
            alignment: Alignment.center,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.searchScreen);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        enabled: false,
                        decoration: InputDecoration(
                            isDense: true,
                            labelStyle: TextStyle(fontWeight: FontWeight.w600),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            hintStyle: CustomTextStyle.txtPoppins12White300.copyWith(
                              color: Color(0xff9095A0),
                              fontSize: scale.getScaledFont(12),
                              fontWeight: FontWeight.w500,
                            ),
                            focusColor: AppColors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: AppColors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: AppColors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: AppColors.white),
                            ),
                            contentPadding: EdgeInsets.zero,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                AssetConstant.searchBarIcon,
                                height: 2,
                              ),
                            ),
                            hintText: tr('search_cars')
                        ),
                        style: CustomTextStyle.txtPoppins12White300.copyWith(
                          color: AppColors.black,
                          fontSize: scale.getScaledFont(12),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: scale.getScaledWidth(30),
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if(UserStore.to.uid.value == ""){
                          Get.toNamed(AppRoutes.loginWithPhone);
                        }else{
                          Get.toNamed(AppRoutes.savedVehicle);
                        }
                      },
                      child: Icon(
                        Icons.bookmark,
                        color: AppColors.secondaryLight,
                        size: scale.getScaledHeight(20),
                      ),
                    ),
                    Text(
                      tr('saved'),
                      style: CustomTextStyle.txtPoppins12Black500.copyWith(
                        color: AppColors.white
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
