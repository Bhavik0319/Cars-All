import 'package:flutter/material.dart' hide SearchController;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../shared/color/app_color.dart';
import '../../../shared/theme/custom_text_style.dart';
import '../../constants/assetConstant.dart';
import '../../utils/scale_utility.dart';
import '../home/widgets/vehicle_tile.dart';
import './controller/search_controller.dart';

class SearchScreen extends GetView<SearchController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {

    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Container(
          margin: scale.getMargin(
            horizontal: 10,
            vertical: 20,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        autofocus: true,
                        controller: controller.searchField,
                        decoration: InputDecoration(
                          isDense: true,
                          labelStyle: TextStyle(fontWeight: FontWeight.w600),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintStyle: CustomTextStyle.txtPoppins12White300.copyWith(
                            color: Color(0xff9095A0),
                            fontSize: scale.getScaledFont(12),
                            fontWeight: FontWeight.w500,
                          ),
                          focusColor: AppColors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: AppColors.backgroundColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: AppColors.backgroundColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: AppColors.backgroundColor),
                          ),
                          contentPadding: EdgeInsets.zero,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset(
                              AssetConstant.searchBarIcon,
                              height: 2,
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.searchField.clear();
                              controller.isSearched.value = false;
                            },
                            icon: Icon(Icons.close,
                              size: scale.getScaledFont(15),
                            ),
                          ),
                          hintText: 'Search "Cars"',
                        ),
                        onChanged: (val) {
                          if(val == ""){
                            controller.searchField.clear();
                            controller.isSearched.value = false;
                          }
                        },
                        onFieldSubmitted: (value) {
                          controller.search();
                        },
                        style: CustomTextStyle.txtPoppins12White300.copyWith(
                          color: AppColors.black,
                          fontSize: scale.getScaledFont(12),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: scale.getMargin(
                  top: 21,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Consumer(
                      builder: (context, ref, child) {
                        return Obx(
                          () {
                            return Text(
                              !controller.isSearched.value
                                  ? 'Recent'
                                  : 'Result for "${controller.searchField.text}"',
                              style: CustomTextStyle.txtPoppins12Black500,
                            );
                          }
                        );
                      }
                    ),
                    Consumer(
                      builder: (context, ref, child) {
                        return Obx(
                          () {
                            return Text(
                              !controller.isSearched.value
                                  ? 'Clear All'
                                  : '${controller.searchedVehicles.length} found',
                              style: !controller.isSearched.value
                                  ? CustomTextStyle.txtPoppins12Black500.copyWith(color: AppColors.primaryLight,)
                                  : CustomTextStyle.txtPoppins12Black500,
                            );
                          }
                        );
                      }
                    ),
                  ],
                ),
              ),
              Divider(
                color: AppColors.backgroundColor,
                height: 1,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    width: double.maxFinite,
                    margin: scale.getMargin(
                      top: 10,
                      bottom: 20,
                    ),
                    child: Obx(
                      () {
                        return (controller.searchedVehicles.isEmpty && controller.isSearched.value && !controller.isLoading.value)? Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: scale.getScaledHeight(50),
                              ),
                              Image.asset(
                                AssetConstant.emptySearch,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: scale.getPadding(
                                  top: 35,
                                ),
                                child: Text(
                                  'Not Found',
                                  style: CustomTextStyle.txtPoppins14Black700.copyWith(
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
                              Text(
                                'Sorry, the keyword you entered cannot be found. Please check again or search with another key.',
                                textAlign: TextAlign.center,
                                style: CustomTextStyle.txtPoppins12Black500,
                              )
                            ],
                          ),
                        ) : !controller.isSearched.value? ListView.builder(
                          itemCount: controller.recentSearch.value.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.recentSearch[index],
                                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                    color: Color(0xff202020).withOpacity(0.70),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    controller.removeRecentItem(index);
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    size: scale.getScaledFont(12),
                                  ),
                                )
                              ],
                            );
                          },
                        ) : (controller.searchedVehicles.isNotEmpty && controller.isSearched.value && !controller.isLoading.value) ? Wrap(
                          runSpacing: 10,
                          alignment: WrapAlignment.center,
                          children: List.generate(
                            controller.searchedVehicles.value.length,
                                (index) => VehicleTile(
                              vehicleModel: controller.searchedVehicles[index],
                            ),
                          ),
                        ) : controller.isLoading.value ?  const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.secondaryLight,
                          ),
                        ) : Container();
                      }
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
