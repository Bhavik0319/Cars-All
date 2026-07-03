
import 'package:cars_and_alll/app/models/wishlist_model.dart';
import 'package:cars_and_alll/app/screens/car_details/controller/carDetailController.dart';
import 'package:cars_and_alll/app/utils/numberFormat.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:cars_and_alll/shared/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../../utils/scale_utility.dart';

class WishlistTile extends StatelessWidget {
  final WishlistModel vehicleModel;

  const WishlistTile({super.key, required this.vehicleModel});

  @override
  Widget build(BuildContext context) {

    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return GestureDetector(
      onTap: () {
        if(Get.currentRoute.startsWith(AppRoutes.carDetailScreen)) {
          Get.find<CarDetailController>().vehicleId = vehicleModel.vehicle!.id!;
          Get.find<CarDetailController>().onReady();
          Get.find<CarDetailController>().scroll.jumpTo(0);
        }else{
          Get.toNamed(AppRoutes.carDetailScreen, parameters: {"vehicleId": vehicleModel.vehicle!.id?? ''});
        }
      },
      child: Stack(
        children: [
          Container(
            width: scale.getScaledWidth(152),
            height: scale.getScaledHeight(200),
            padding: scale.getPadding(
              bottom: 10,
            ),
            decoration: BoxDecoration(
              image: vehicleModel.vehicle!.subCategory != "luxury" && vehicleModel.vehicle!.subCategory != "premium"
                  ? null
                  : DecorationImage(
                image: AssetImage(
                  "assets/logo/lux_bg.jpg",
                ),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                color: AppColors.secondaryLight,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: scale.getScaledHeight(100),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        topLeft: Radius.circular(5),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          vehicleModel.vehicle!.images!.first,
                        ),
                        fit: BoxFit.cover,
                      )
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: scale.getPadding(
                    horizontal: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${vehicleModel.vehicle!.category!.capitalizeFirst} ${vehicleModel.vehicle!.subCategory!}',
                        style: CustomTextStyle.txtPoppins12Black500.copyWith(
                          fontSize: scale.getScaledFont(12),
                          color: vehicleModel.vehicle!.subCategory == "luxury" || vehicleModel.vehicle!.subCategory == "premium"
                              ? AppColors.secondaryLight
                              : AppColors.black,
                        ),
                      ),
                      Text(
                        formatWithCommas(vehicleModel.vehicle!.askingPrice),
                        style: CustomTextStyle.txtPoppins12Black500.copyWith(
                          fontSize: scale.getScaledFont(11),
                          color: AppColors.primaryLight,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: scale.getScaledHeight(10),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondaryLight,
                          padding: scale.getPadding(
                            vertical: 20
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                            side: BorderSide(
                              color: AppColors.secondaryLight,
                            )
                          ),
                        ),
                        onPressed: () async{
                          Get.toNamed(AppRoutes.carDetailScreen, parameters: {"vehicleId": vehicleModel.vehicle!.id?? ''});
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'View Detail',
                              style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                color: AppColors.white,
                                fontSize: scale.getScaledFont(12),
                              )
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          if(vehicleModel.isSoldout!)
            Container(
            width: scale.getScaledWidth(152),
            height: scale.getScaledHeight(200),
            padding: scale.getPadding(
              all: 40
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: AppColors.black.withOpacity(0.5),
            ),
            child: Image.network(
              "https://carsandallweb.netlify.app/image/out-of-stock.png",
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
