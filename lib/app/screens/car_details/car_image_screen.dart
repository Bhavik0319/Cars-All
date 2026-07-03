import 'package:cars_and_alll/app/constants/assetConstant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/color/app_color.dart';
import '../../utils/scale_utility.dart';

class CarImageScreen extends StatelessWidget {
  const CarImageScreen({super.key});

  @override
  Widget build(BuildContext context) {

    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          height: scale.fh,
          width: scale.fw,
          child: InteractiveViewer(
            boundaryMargin: EdgeInsets.all(1.0),
            minScale: 0.5,
            maxScale: 14.0,
            child: Image.network(
                Get.arguments['carImage'],
            ),
          ),
        ),
      ),
    );
  }
}
