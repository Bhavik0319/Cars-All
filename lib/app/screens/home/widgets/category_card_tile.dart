
import 'package:cars_and_alll/app/models/vehicle_model.dart';
import 'package:cars_and_alll/app/routes/app_routes.dart';
import 'package:cars_and_alll/app/screens/home/controllers/home_controller.dart';
import 'package:cars_and_alll/app/screens/home/models/vehicle_brand_model.dart';
import 'package:cars_and_alll/app/utils/scale_utility.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:cars_and_alll/shared/theme/custom_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'vehicle_list_view_tile.dart';

class CategoryCardTile extends StatelessWidget {
  final ScalingUtility scale;
  final Map<String,List<VehicleModel>> allVehicles;
  final Function() onTapLatest;
  final Function() onViewAll;
  final String txt;
  const CategoryCardTile({super.key, required this.txt, required this.scale, required this.allVehicles, required this.onTapLatest, required this.onViewAll});

  @override
  Widget build(BuildContext context) {
    List<MapEntry<String, List<VehicleModel>>> entries = allVehicles.entries.toList();
    return DefaultTabController(
      length: entries.length,
      child: Container(
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: scale.getMargin(
                    left: 20,
                    top: 5,
                  ),
                  child: Text(
                    txt,
                    style: CustomTextStyle.txtPoppins12Black500.copyWith(
                      fontSize: scale.getScaledFont(14),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    onViewAll();
                  },
                  child: Padding(
                    padding: scale.getPadding(
                      right: 20,
                    ),
                    child: Text(
                      tr('view_all'),
                      style: CustomTextStyle.txtPoppins10W400.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: scale.getScaledFont(11),
                        color: AppColors.primaryLight,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: scale.getMargin(
                vertical: 5
              ),
              child: Divider(),
            ),
            if(entries.isEmpty)
              Container(
                padding: scale.getPadding(
                  vertical: 20,
                ),
                width: scale.fw,
                child: Column(
                  children: [
                    Lottie.asset(
                      "assets/images/no_data.json",
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
              ),
            if(entries.isNotEmpty)
            TabBar(
              labelStyle: CustomTextStyle.txtPoppins12Black500.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: scale.getScaledFont(11),
              ),
              unselectedLabelStyle: CustomTextStyle.txtPoppins12Black500.copyWith(
                fontWeight: FontWeight.w400,
              ),
              isScrollable: true,
              padding: scale.getPadding(
                left: 10
              ),
              dividerColor: AppColors.dividerColor,
              tabAlignment: TabAlignment.start,
              indicatorColor: AppColors.secondaryLight,
              unselectedLabelColor: Color(0xff202020),
              labelColor: AppColors.secondaryLight,
              tabs: List.generate(
                entries.length,
                (index) {
                  return Tab(
                    text: tr(entries[index].key.toLowerCase().split(' ').join("_")),
                  );
                },
              )
            ),
            if(entries.isNotEmpty)
            Container(
              height: scale.getScaledHeight(255),
              margin: scale.getMargin(
                left: 13,
                right: 20,
                top: 12,
                bottom: 24
              ),
              width: double.maxFinite,
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(
                  entries.length,
                  (index) {
                    return VehicleListViewTile(
                      vehicleModel: entries[index].value,
                    );
                  },
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
