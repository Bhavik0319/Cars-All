import 'dart:io';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cars_and_alll/app/constants/assetConstant.dart';
import 'package:cars_and_alll/app/screens/vehicle_details/controller/postNewAddController.dart';
import 'package:cars_and_alll/app/utils/customSnackBar.dart';
import 'package:cars_and_alll/app/widgets/decoratedContainer.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:cars_and_alll/shared/theme/custom_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../routes/app_routes.dart';
import '../../utils/scale_utility.dart';

class UploadVehicleImage extends GetView<PostNewAddController> {
  const UploadVehicleImage({super.key});


  Future<void> pickMultipleImagesFromCamera(ImageSource source) async {
    try {
      if(source == ImageSource.camera){
        final XFile? pickedFile = await controller.picker.pickImage(source: source);
        if (pickedFile != null) {
          controller.vehicleImages.add(pickedFile.path);
          Get.back();
        }
      } else {
        final List<XFile> pickedFile = await controller.picker.pickMultiImage(
          limit: 10,
          imageQuality: 60,
        );
        if (pickedFile.isNotEmpty) {
          for(var image in pickedFile) {
            controller.vehicleImages.add(image.path);
          }
          Get.back();
        }
      }
    } catch (e) {
      print("Error picking image from camera: $e");
    }
  }

  void showPickerOptions() {
    showModalBottomSheet(
      context: Get.context!,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () => pickMultipleImagesFromCamera(ImageSource.gallery),
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () => pickMultipleImagesFromCamera(ImageSource.camera),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Container(
          width: scale.fw,
          margin: scale.getMargin(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {

                },
                child: DecoratedContainer(
                  width: scale.getScaledWidth(250),
                  margin: scale.getMargin(
                    bottom: 20,
                  ),
                  fillColor: Colors.transparent,
                  padding: scale.getPadding(
                    horizontal: 15,
                    vertical: 12,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: scale.getScaledHeight(300),
                      maxWidth: scale.getScaledWidth(250),
                    ),
                    child: Obx(
                      () {
                        return controller.vehicleImages.isEmpty ? Text(
                          tr('select_images'),
                          textAlign: TextAlign.center,
                          style: CustomTextStyle.txtPoppins16Black500,
                        ) : Wrap(
                          spacing: 15,
                          runSpacing: 15,
                          alignment: WrapAlignment.center,
                          children: List.generate(controller.vehicleImages.length, (e) {
                            return GestureDetector(
                              child: controller.vehicleImages[e].startsWith('https') ? GestureDetector(
                                onTap: () {
                                  controller.vehicleImages.removeAt(e);
                                },
                                child: Container(
                                  height: scale.getScaledHeight(60),
                                  width: scale.getScaledWidth(60),
                                  alignment: Alignment.topLeft,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        controller.vehicleImages[e],
                                      ),
                                      fit: BoxFit.cover,
                                    )
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.primaryLight,
                                    radius: 8,
                                    child: Icon(
                                      Icons.close,
                                      color: AppColors.white,
                                      size: scale.getScaledFont(8),
                                    ),
                                  ),
                                ),
                              ) : Container(
                                height: scale.getScaledHeight(60),
                                width: scale.getScaledWidth(60),
                                alignment: Alignment.topLeft,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      image: FileImage(
                                        File(controller.vehicleImages[e]),
                                      ),
                                      fit: BoxFit.cover,
                                    )
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.vehicleImages.removeAt(e);
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.primaryLight,
                                    radius: 8,
                                    child: Icon(
                                      Icons.close,
                                      color: AppColors.white,
                                      size: scale.getScaledFont(8),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                      }
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if(controller.vehicleImages.length < 10) {
                    showPickerOptions();
                  }
                },
                child: DecoratedContainer(
                  width: scale.getScaledWidth(250),
                  margin: scale.getMargin(
                    bottom: 20,
                  ),
                  fillColor: AppColors.secondaryLight,
                  padding: scale.getPadding(
                    horizontal: 15,
                    vertical: 12,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset(
                        'assets/images/image_icon.png',
                        height: scale.getScaledHeight(23),
                      ),
                      SizedBox(
                        width: scale.getScaledWidth(65),
                      ),
                      Text(
                        tr('upload'),
                        textAlign: TextAlign.center,
                        style: CustomTextStyle.txtPoppins16Black500.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: scale.getMargin(
                  top: 50,
                ),
                width: scale.getScaledWidth(150),
                height: scale.getScaledHeight(40),
                child: ElevatedButton(
                  onPressed: () async {
                    if(controller.vehicleImages.isNotEmpty){
                      await controller.postVehicle();
                    }else {
                      customSnackBar(
                        type: AnimatedSnackBarType.error,
                        message: tr('select_images'),
                      );
                    }
                  },
                  child: Text(
                    tr('post'),
                    style: CustomTextStyle.txtPoppins16Black500.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                      fontSize: scale.getScaledFont(16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
