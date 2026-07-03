
import 'dart:developer';

import 'package:cars_and_alll/app/constants/assetConstant.dart';
import 'package:cars_and_alll/app/routes/app_routes.dart';
import 'package:cars_and_alll/app/services/user.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';
import '../../shared/color/app_color.dart';
import '../constants/text_data.dart';
import '../services/storage.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {

  @override
  void initState() {

    Future.delayed(Duration(seconds: 3), () {
      log("token is ${StorageService.to.getString(ConstantData.userBearerToken)}");
      log("user is ${UserStore.to.profile.id}");
      if(StorageService.to.getString("language") == '') {
        Get.offAllNamed(AppRoutes.getStarted);
      }else{
        Get.offAllNamed(AppRoutes.homeNav);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      color: AppColors.backgroundColor,
      child: Center(
        child: Image.asset(
          AssetConstant.appSplashLogo,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
