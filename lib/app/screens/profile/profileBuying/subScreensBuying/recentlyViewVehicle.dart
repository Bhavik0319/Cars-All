import 'package:cars_and_alll/app/screens/profile/controller/recentlyViewController.dart';
import 'package:cars_and_alll/shared/theme/custom_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../shared/color/app_color.dart';
import '../../../../utils/scale_utility.dart';
import '../../../home/widgets/vehicle_tile.dart';

class RecentlyViewVehicle extends GetView<RecentlyViewController> {
  const RecentlyViewVehicle({super.key});

  @override
  Widget build(BuildContext context) {

    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: scale.getPadding(left: 20),
              child: GestureDetector(
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
            ),
            SizedBox(
              height: scale.getScaledHeight(10),
            ),
            Padding(
              padding: scale.getPadding(left: 20),
              child: Text(
                tr('recently_viewed'),
                style: CustomTextStyle.txtPoppins12Black500.copyWith(
                  fontSize: scale.getScaledFont(20),
                ),
              ),
            ),
            SizedBox(
              height: scale.getScaledHeight(15),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                    width: scale.fw,
                    child: Obx(
                            () {
                          return controller.isLoading.value ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.secondaryLight,
                            ),
                          ) : Wrap(
                            runSpacing: 5,
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: List.generate(
                              controller.vehicles.value.length,
                                  (index) => VehicleTile(
                                vehicleModel: controller.vehicles[index],
                              ),
                            ),
                          );
                        }
                    )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
