import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:cars_and_alll/shared/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customSnackBar({
  required String message,
  required AnimatedSnackBarType type,
  Color? customColor, // Optional override for background
}) {
  AnimatedSnackBar(
    duration: const Duration(seconds: 4),
    mobileSnackBarPosition: MobileSnackBarPosition.bottom,
    mobilePositionSettings: const MobilePositionSettings(
      bottomOnAppearance: 30,
    ),
    builder: (context) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: customColor ?? _getBackgroundColor(type),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.secondaryLight,
          ),
          // boxShadow: const [
          //   BoxShadow(
          //     color: Colors.black26,
          //     blurRadius: 10,
          //     offset: Offset(0, 4),
          //   ),
          // ],
        ),
        child: Row(
          children: [
            _getIcon(type),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: CustomTextStyle.txtPoppins14Black700.copyWith(
                  color: type == AnimatedSnackBarType.success
                      ? Colors.white
                      : AppColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      );
    },
  ).show(Get.context!);
}

// Helper: Background Colors
Color _getBackgroundColor(AnimatedSnackBarType type) {
  switch (type) {
    case AnimatedSnackBarType.success: return const Color(0xFF2E7D32); // Deep Green
    case AnimatedSnackBarType.error: return AppColors.backgroundColor;   // Deep Red
    case AnimatedSnackBarType.warning: return const Color(0xFFFFA000); // Amber
    case AnimatedSnackBarType.info: return const Color(0xFF1976D2);
  }
}

// Helper: Icons
Widget _getIcon(AnimatedSnackBarType type) {
  IconData iconData;
  switch (type) {
    case AnimatedSnackBarType.success: iconData = Icons.check_circle_outline; break;
    case AnimatedSnackBarType.error: iconData = Icons.error_outline; break;
    case AnimatedSnackBarType.warning: iconData = Icons.warning_amber_rounded; break;
    default: iconData = Icons.info_outline;
  }
  return Icon(
      iconData, color: type == AnimatedSnackBarType.success
      ? Colors.white
      : AppColors.black,
    size: 22,
  );
}