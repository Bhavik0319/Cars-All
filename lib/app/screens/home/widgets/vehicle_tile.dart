
import 'package:cars_and_alll/app/models/vehicle_model.dart';
import 'package:cars_and_alll/app/screens/car_details/controller/carDetailController.dart';
import 'package:cars_and_alll/app/utils/numberFormat.dart';
import 'package:cars_and_alll/app/widgets/decoratedContainer.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:cars_and_alll/shared/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../../utils/scale_utility.dart';

class VehicleTile extends StatelessWidget {
  final VehicleModel vehicleModel;
  
  const VehicleTile({super.key, required this.vehicleModel});

  @override
  Widget build(BuildContext context) {

    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();
    
    return GestureDetector(
      onTap: () {
        if(Get.currentRoute.startsWith(AppRoutes.carDetailScreen)) {
          Get.find<CarDetailController>().vehicleId = vehicleModel.id!;
          Get.find<CarDetailController>().onReady();
          Get.find<CarDetailController>().scroll.jumpTo(0);
        }else{
          Get.toNamed(AppRoutes.carDetailScreen, parameters: {"vehicleId": vehicleModel.id?? ''});
        }
      },
      child: Container(
        width: scale.getScaledWidth(162),
        height: scale.getScaledHeight(255),
        margin: scale.getMargin(
          horizontal: 3,
        ),
        padding: scale.getPadding(
          bottom: 10,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          image: vehicleModel.vehicleSubCategory != "luxury" && vehicleModel.vehicleSubCategory != "premium"
              ? null
              : DecorationImage(
            image: AssetImage(
              "assets/logo/lux_bg.jpg",
            ),
            fit: BoxFit.cover,
          ),
          border: Border.all(
            color: AppColors.secondaryLight
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: scale.getScaledHeight(120),
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  topLeft: Radius.circular(5),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    vehicleModel.vehicleImages!.first,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: scale.getPadding(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryLight,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(6),
                      ),
                    ),
                    child: Text(
                      formatTimeAgo(vehicleModel.createdAt!),
                      style: CustomTextStyle.txtPoppins10W400.copyWith(
                        color: AppColors.white,
                        fontSize: scale.getScaledFont(10),
                        fontWeight: FontWeight.w500,
                      )
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5,),
            Container(
              padding: scale.getPadding(
                horizontal: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${vehicleModel.vehicleFilters!.brand!} ${vehicleModel.vehicleFilters!.model!}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyle.txtPoppins12Black500.copyWith(
                      fontSize: scale.getScaledFont(12),
                      color: vehicleModel.vehicleSubCategory == "luxury" || vehicleModel.vehicleSubCategory == "premium"
                          ? AppColors.secondaryLight
                          : AppColors.black,
                    ),
                  ),
                  Text(
                    formatWithCommas(vehicleModel.askingPrice),
                    style: CustomTextStyle.txtPoppins12Black500.copyWith(
                      fontSize: scale.getScaledFont(11),
                      color: AppColors.primaryLight,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5,),
            Container(
              padding: scale.getPadding(horizontal: 8),
              // alignment: Alignment.center,
              child: Wrap(
                spacing: 15,
                runSpacing: 8,
                children: [
                  if(vehicleModel.vehicleFilters!.registrationYear != null)
                  DecoratedContainer(
                    padding: scale.getPadding(
                      horizontal: 5,
                      vertical: 3,
                    ),
                    borderRadius: 3,
                    fillColor: Colors.transparent,
                    child: Text(
                      '${vehicleModel.vehicleFilters!.registrationYear}',
                      style: CustomTextStyle.txtPoppins12Black500.copyWith(
                        color: AppColors.secondaryLight,
                        fontWeight: FontWeight.w700,
                        fontSize: scale.getScaledFont(9),
                      ),
                    ),
                  ),
                  if(vehicleModel.vehicleFilters!.kmsDriven != null)
                  DecoratedContainer(
                    padding: scale.getPadding(
                      horizontal: 5,
                      vertical: 3,
                    ),
                    borderRadius: 3,
                    fillColor: Colors.transparent,
                    child: Text(
                      '${vehicleModel.vehicleFilters!.kmsDriven} km',
                      style: CustomTextStyle.txtPoppins12Black500.copyWith(
                        color: AppColors.secondaryLight,
                        fontWeight: FontWeight.w700,
                        fontSize: scale.getScaledFont(9),
                      ),
                    ),
                  ),
                  if(vehicleModel.vehicleFilters!.transmissionType != "")
                  DecoratedContainer(
                    padding: scale.getPadding(
                      horizontal: 5,
                      vertical: 3,
                    ),
                    borderRadius: 3,
                    fillColor: Colors.transparent,
                    child: Text(
                      '${vehicleModel.vehicleFilters!.transmissionType}',
                      style: CustomTextStyle.txtPoppins12Black500.copyWith(
                        color: AppColors.secondaryLight,
                        fontWeight: FontWeight.w700,
                        fontSize: scale.getScaledFont(9),
                      ),
                    ),
                  ),
                  if(vehicleModel.vehicleFilters!.fuelType != null)
                  DecoratedContainer(
                    padding: scale.getPadding(
                      horizontal: 5,
                      vertical: 3,
                    ),
                    borderRadius: 3,
                    fillColor: Colors.transparent,
                    child: Text(
                      '${vehicleModel.vehicleFilters!.fuelType}',
                      style: CustomTextStyle.txtPoppins12Black500.copyWith(
                        color: AppColors.secondaryLight,
                        fontWeight: FontWeight.w700,
                        fontSize: scale.getScaledFont(9),
                      ),
                    ),
                  ),
                  if(vehicleModel.vehicleFilters!.ownerType != '')
                  DecoratedContainer(
                    padding: scale.getPadding(
                      horizontal: 5,
                      vertical: 3,
                    ),
                    borderRadius: 3,
                    fillColor: Colors.transparent,
                    child: Text(
                      '${vehicleModel.vehicleFilters!.ownerType}',
                      style: CustomTextStyle.txtPoppins12Black500.copyWith(
                        color: AppColors.secondaryLight,
                        fontWeight: FontWeight.w700,
                        fontSize: scale.getScaledFont(9),
                      ),
                    ),
                  ),
                ]
              ),
            ),
            /// TODO: Need to create the tiles just like the web
          ],
        ),
      ),
    );
  }
}
