import 'package:cars_and_alll/app/screens/home/models/category_tile_model.dart';
import 'package:cars_and_alll/app/utils/scale_utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../shared/color/app_color.dart';
import '../../../../shared/theme/custom_text_style.dart';
import '../../../models/category_model.dart';
import '../../../utils/customImageView.dart';

class CategoryTile extends StatelessWidget {
  final ScalingUtility scale;
  final CategoryModel category;
  final bool isSelected;
  const CategoryTile({required this.category, required this.scale, super.key, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: scale.getScaledWidth(100),
      height: scale.getScaledHeight(80),
      alignment: Alignment.center,
      padding: scale.getPadding(
        horizontal: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(6),
        color: Colors.white,
        image: category.categorySlug == "luxury-vehicles" ? DecorationImage(
          image: AssetImage(
            "assets/logo/lux_bg.jpg",
          ),
          fit: BoxFit.cover,
        ): null,
        border: Border.all(
          color: AppColors.secondaryLight
        )
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            path: category.categoryImage!.first,
            height: scale.getScaledHeight(30),
          ),
          SizedBox(
            width: 6,
          ),
          Text(
            tr(category.categoryName!.toLowerCase().replaceAll('& ', '').split(' ').join("_")),
            textAlign: TextAlign.center,
            style: CustomTextStyle.txtPoppins12Black500.copyWith(
              color: category.categorySlug == "luxury-vehicles" ? AppColors.secondaryLight : AppColors.black,
              fontSize: scale.getScaledFont(10),
            ),
          ),
        ],
      ),
    );
  }
}
