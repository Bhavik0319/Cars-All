import 'package:cars_and_alll/app/constants/assetConstant.dart';
import 'package:cars_and_alll/app/widgets/decoratedContainer.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../shared/theme/custom_text_style.dart';
import '../utils/scale_utility.dart';

class ServiceHistoryTile extends StatelessWidget {
  const ServiceHistoryTile({super.key});

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return DecoratedContainer(
      padding: scale.getPadding(
        top: 10,
        left: 10,
        right: 10,
        bottom: 12,
      ),
      margin: scale.getMargin(
        bottom: 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        AssetConstant.serviceIcon,
                      ),
                      SizedBox(
                        width: scale.getScaledWidth(11),
                      ),
                      Text(
                        '12-APRL-2025',
                        style: CustomTextStyle.txtPoppins14Black700.copyWith(
                          fontSize: scale.getScaledFont(14),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  Text(
                    'AutoFix Center, Pune',
                    style: CustomTextStyle.txtPoppins14Black700.copyWith(
                      fontSize: scale.getScaledFont(10),
                      fontWeight: FontWeight.w500,
                      color: Color(0xff6C6C6C),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '₹3000',
                    style: CustomTextStyle.txtPoppins14Black700.copyWith(
                      fontSize: scale.getScaledFont(14),
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryLight,
                    ),
                  ),
                  DecoratedContainer(
                    padding: scale.getPadding(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    borderColor: Colors.transparent,
                    fillColor: AppColors.greenCheckColor,
                    child: Text(
                      'Completed',
                      style: CustomTextStyle.txtPoppins10W400.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            'Odometer: 2.5 km',
            style: CustomTextStyle.txtPoppins14Black700.copyWith(
              fontSize: scale.getScaledFont(10),
              fontWeight: FontWeight.w500,
              color: Color(0xff6C6C6C),
            ),
          ),
          SizedBox(
            height: scale.getScaledHeight(12),
          ),
          Text(
            'Services:',
            style: CustomTextStyle.txtPoppins14Black700.copyWith(
              fontSize: scale.getScaledFont(10),
              fontWeight: FontWeight.w500,
              color: AppColors.black2020,
            ),
          ),
          Text(
            'Oil Change, AC Check',
            style: CustomTextStyle.txtPoppins14Black700.copyWith(
              fontSize: scale.getScaledFont(10),
              fontWeight: FontWeight.w500,
              color: Color(0xff6C6C6C),
            ),
          ),
          SizedBox(
            height: scale.getScaledHeight(12),
          ),
          Row(
            children: [
              Icon(
                Icons.file_download_outlined,
                color: AppColors.primaryLight,
                size: scale.getScaledFont(15),
              ),
              Text(
                'Download Invoice',
                style: CustomTextStyle.txtPoppins14Black700.copyWith(
                  fontSize: scale.getScaledFont(10),
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryLight,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
