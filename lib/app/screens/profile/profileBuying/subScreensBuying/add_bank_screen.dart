import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../shared/theme/custom_text_style.dart';
import '../../../../constants/assetConstant.dart';
import '../../../../utils/scale_utility.dart';

class AddBankScreen extends StatelessWidget {
  const AddBankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Container(
          margin: scale.getMargin(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
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
              SizedBox(
                height: scale.getScaledHeight(10),
              ),
              Text(
                'Add Bank Account',
                style: CustomTextStyle.txtPoppins12Black500.copyWith(
                  fontSize: scale.getScaledFont(20),
                ),
              ),
              Container(
                margin: scale.getMargin(
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          isDense: true,
                          labelStyle: TextStyle(fontWeight: FontWeight.w600),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintStyle: CustomTextStyle.txtPoppins12White300.copyWith(
                            color: Color(0xff9095A0),
                            fontSize: scale.getScaledFont(10),
                            fontWeight: FontWeight.w500,
                          ),
                          focusColor: AppColors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: AppColors.secondaryLight),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: AppColors.secondaryLight),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: AppColors.secondaryLight),
                          ),
                          contentPadding: EdgeInsets.zero,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              AssetConstant.searchBarIcon,
                              height: 2,
                              color: AppColors.black,
                            ),
                          ),
                          hintText: 'Search by bank name',
                        ),
                        style: CustomTextStyle.txtPoppins12White300.copyWith(
                          color: AppColors.black,
                          fontSize: scale.getScaledFont(10),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'All Banks',
                style: CustomTextStyle.txtPoppins12Black500.copyWith(
                  fontSize: scale.getScaledFont(14),
                ),
              ),
              SizedBox(
                height: scale.getScaledHeight(10),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: scale.getScaledFont(25),
                                  backgroundColor: AppColors.white,
                                  child: Image.asset(
                                    'assets/images/sbi_bank_icon.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: scale.getScaledWidth(10),
                                ),
                                Text(
                                  'State Bank of India',
                                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                    fontSize: scale.getScaledFont(16),
                                  ),
                                )
                              ],
                            ),
                            if(index == 0) CircleAvatar(
                              radius: scale.getScaledFont(10),
                              backgroundColor: AppColors.primaryLight,
                              child: Icon(
                                Icons.check,
                                color: AppColors.white,
                                size: scale.getScaledFont(12),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: scale.getMargin(
                            vertical: 10,
                          ),
                          child: Divider(
                            height: 1,
                            thickness: 1,
                          )
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
