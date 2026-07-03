import 'package:cars_and_alll/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../shared/color/app_color.dart';
import '../../../../../shared/theme/custom_text_style.dart';
import '../../../../utils/scale_utility.dart';
import '../../../../widgets/decoratedContainer.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Container(
          margin: scale.getMargin(
            left: 20,
            right: 20,
            bottom: 20,
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
                'Payment Methods',
                style: CustomTextStyle.txtPoppins12Black500.copyWith(
                  fontSize: scale.getScaledFont(24),
                ),
              ),
              SizedBox(
                height: scale.getScaledHeight(10),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.addBankScreen);
                    },
                    child: DecoratedContainer(
                      width: scale.getScaledWidth(145),
                      height: scale.getScaledHeight(100),
                      borderRadius: 6,
                      padding: scale.getPadding(
                        all: 10,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: scale.getScaledFont(15),
                            backgroundColor: AppColors.primaryLight,
                            child: Image.asset(
                              'assets/images/bank_icon.png',
                              height: scale.getScaledHeight(13),
                            ),
                          ),
                          SizedBox(
                            height: scale.getScaledHeight(8),
                          ),
                          Text(
                            'Bank Account',
                            style: CustomTextStyle.txtPoppins12Black500.copyWith(
                              fontSize: scale.getScaledFont(13),
                              color: AppColors.primaryLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.addCardScreen);
                    },
                    child: DecoratedContainer(
                      width: scale.getScaledWidth(145),
                      height: scale.getScaledHeight(100),
                      borderRadius: 6,
                      padding: scale.getPadding(
                        all: 10,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: scale.getScaledFont(15),
                            backgroundColor: AppColors.primaryLight,
                            child: Image.asset(
                              'assets/images/card_icon.png',
                              height: scale.getScaledHeight(13),
                            ),
                          ),
                          SizedBox(
                            height: scale.getScaledHeight(8),
                          ),
                          Text(
                            'Saved Cards',
                            style: CustomTextStyle.txtPoppins12Black500.copyWith(
                              fontSize: scale.getScaledFont(13),
                              color: AppColors.primaryLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: scale.getScaledHeight(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DecoratedContainer(
                    width: scale.getScaledWidth(145),
                    height: scale.getScaledHeight(100),
                    borderRadius: 6,
                    padding: scale.getPadding(
                      all: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: scale.getScaledFont(15),
                          backgroundColor: AppColors.primaryLight,
                          child: Image.asset(
                            'assets/images/upi_icon.png',
                            height: scale.getScaledHeight(13),
                          ),
                        ),
                        SizedBox(
                          height: scale.getScaledHeight(8),
                        ),
                        Text(
                          'Saved UPI',
                          style: CustomTextStyle.txtPoppins12Black500.copyWith(
                            fontSize: scale.getScaledFont(13),
                            color: AppColors.primaryLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  DecoratedContainer(
                    width: scale.getScaledWidth(145),
                    height: scale.getScaledHeight(100),
                    borderRadius: 6,
                    padding: scale.getPadding(
                      all: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: scale.getScaledFont(15),
                          backgroundColor: AppColors.primaryLight,
                          child: Image.asset(
                            'assets/images/gift_icon.png',
                            height: scale.getScaledHeight(13),
                          ),
                        ),
                        SizedBox(
                          height: scale.getScaledHeight(8),
                        ),
                        Text(
                          'Gift Cards',
                          style: CustomTextStyle.txtPoppins12Black500.copyWith(
                            fontSize: scale.getScaledFont(13),
                            color: AppColors.primaryLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: scale.getScaledHeight(20),
              ),
              Text(
                'Saved Methods',
                style: CustomTextStyle.txtPoppins12Black500.copyWith(
                  fontSize: scale.getScaledFont(14),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return DecoratedContainer(
                      margin: scale.getMargin(
                        vertical: 5,
                      ),
                      padding: scale.getPadding(all: 10),
                      fillColor: Colors.transparent,
                      borderRadius: 6,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  DecoratedContainer(
                                    padding: scale.getPadding(all: 10),
                                    fillColor: Color(0xffF2E0AE),
                                    borderColor: Colors.transparent,
                                    child: Image.asset(
                                      'assets/images/upi_icon.png',
                                      color: AppColors.primaryLight,
                                      height: scale.getScaledHeight(13),
                                    ),
                                  ),
                                  SizedBox(
                                    width: scale.getScaledWidth(10),
                                  ),
                                  SizedBox(
                                    width: scale.getScaledWidth(180),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'abc@upi',
                                          style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                            fontSize: scale.getScaledFont(13),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          'UPI',
                                          style: CustomTextStyle.txtPoppins10W400.copyWith(
                                            color: Color(0xff808080),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              DecoratedContainer(
                                padding: scale.getPadding(
                                  horizontal: 8,
                                  vertical: 2,
                                ),
                                borderColor: Colors.transparent,
                                fillColor: AppColors.greenCheckColor,
                                child: Text(
                                  'Default',
                                  style: CustomTextStyle.txtPoppins10W400.copyWith(
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: scale.getMargin(
                              top: 14,
                              bottom: 4,
                            ),
                            child: Divider(
                              thickness: 1,
                              height: 1,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              Text(
                                'Set as Default',
                                style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                  color: AppColors.primaryLight
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    );
                  }
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
