import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cars_and_alll/app/screens/vehicle_details/controller/postNewAddController.dart';
import 'package:cars_and_alll/app/utils/customSnackBar.dart';
import 'package:cars_and_alll/app/widgets/decoratedContainer.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/color/app_color.dart';
import '../../../shared/theme/custom_text_style.dart';
import '../../routes/app_routes.dart';
import '../../utils/scale_utility.dart';

class EnterVehicleDetails extends GetView<PostNewAddController> {
  EnterVehicleDetails({super.key});

  final _formKey = GlobalKey<FormState>();

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
            vertical: 5,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                  Container(
                    child: Text(
                      tr('get_vehicle_details'),
                      style: CustomTextStyle.txtPoppins20W700.copyWith(
                        fontSize: scale.getScaledFont(22),
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(20),
                  ),

                  Text(
                    '${tr('category')}*',
                    style: CustomTextStyle.txtPoppins12Black500.copyWith(
                      fontSize: scale.getScaledFont(12),
                      color: AppColors.black828282,
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(5),
                  ),
                  Padding(
                    padding: scale.getPadding(right: 3),
                    child: Obx(
                      () {
                        return DropdownButtonFormField2<String>(
                          isDense: true,
                          decoration: InputDecoration(
                            isDense: true,
                            suffixIcon: Container(
                              padding: scale.getPadding(
                                  all: 4
                              ),
                              margin: scale.getMargin(
                                left: 10,
                                right: 10,
                                bottom: 10,
                                top: 10,
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Color(0xff808080)
                                  )
                              ),
                              child: Image.asset(
                                'assets/images/pencil_icon.png',
                                height: scale.getScaledHeight(13),
                              ),
                            ),
                            contentPadding: scale.getPadding(vertical: 10),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: Color(0xffBDBDBD),
                                width: 1,
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: Color(0xffBDBDBD),
                                width: 1,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: Color(0xffBDBDBD),
                                width: 1,
                              ),
                            ),
                          ),
                          items: ['Cars','Bikes','EV', 'Commercial', 'Machinery'].map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: CustomTextStyle.txtPoppins10W400.copyWith(
                                color: AppColors.black,
                                fontSize: scale.getScaledFont(10),
                              ),
                            ),
                          )).toList(),
                          onChanged: (value) {
                            controller.subCategory.value = "Choose sub-category";
                            if(value == 'Cars'){
                              controller.allSubCategories.value = ["Choose sub-category", "Cars", "Vintage Cars",'Luxury Cars'];
                            } else if(value == 'Bikes'){
                              controller.allSubCategories.value = ["Choose sub-category", "Bikes", "Scooter", "Premium Bikes",'Luxury Bikes'];
                            }else if(value == 'EV'){
                              controller.allSubCategories.value = ["Choose sub-category", "Electric Cars", 'Electric Bikes', 'Commercial EVs', "Others"];
                            }else if(value == 'Commercial'){
                              controller.allSubCategories.value = ["Choose sub-category", "Cars", 'Trucks', 'Flatbeds', 'LCVs', 'Buses',"Others"];
                            }else if(value == 'Machinery'){
                              controller.allSubCategories.value = ["Choose sub-category", "Tractors", 'Bulldozer', 'Excavators', 'Cranes', 'Forklift', 'Concrete Mixers', 'Harvesters', "Others"];
                            } else {
                              controller.allSubCategories.value = ["Choose sub-category"];
                            }
                            controller.category.value = value!;
                          },
                          hint: Text(
                            'Choose Category',
                            style: CustomTextStyle.txtPoppins10W400.copyWith(
                              fontSize: scale.getScaledFont(12),
                            ),
                          ),
                          buttonStyleData: ButtonStyleData(
                          ),
                          iconStyleData: IconStyleData(
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: scale.getScaledFont(24),
                          ),
                          dropdownStyleData: DropdownStyleData(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          menuItemStyleData: MenuItemStyleData(
                            padding: scale.getPadding(horizontal: 16),
                          ),
                          value: controller.category.value != '' ? controller.category.value : null,
                          validator: (value) {
                            if (controller.category.value == '') {
                              return 'Please select your category type.';
                            }
                            return null;
                          },
                        );
                      }
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(10),
                  ),
                  Text(
                    tr('sub_category'),
                    style: CustomTextStyle.txtPoppins12Black500.copyWith(
                      fontSize: scale.getScaledFont(12),
                      color: AppColors.black828282,
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(5),
                  ),
                  Padding(
                    padding: scale.getPadding(right: 3),
                    child: Obx(
                            () {
                          return DropdownButtonFormField2<String>(
                            isDense: true,
                            value: controller.subCategory.value,
                            decoration: InputDecoration(
                              isDense: true,
                              suffixIcon: Container(
                                padding: scale.getPadding(
                                    all: 4
                                ),
                                margin: scale.getMargin(
                                  left: 10,
                                  right: 10,
                                  bottom: 10,
                                  top: 10,
                                ),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Color(0xff808080)
                                    )
                                ),
                                child: Image.asset(
                                  'assets/images/pencil_icon.png',
                                  height: scale.getScaledHeight(13),
                                ),
                              ),
                              contentPadding: scale.getPadding(vertical: 10),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                  color: Color(0xffBDBDBD),
                                  width: 1,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                  color: Color(0xffBDBDBD),
                                  width: 1,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                  color: Color(0xffBDBDBD),
                                  width: 1,
                                ),
                              ),
                            ),
                            items: controller.allSubCategories.value.map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: CustomTextStyle.txtPoppins10W400.copyWith(
                                  color: AppColors.black,
                                  fontSize: scale.getScaledFont(10),
                                ),
                              ),
                            )).toList(),
                            onChanged: (value) {
                              controller.subCategory.value = value!;
                            },
                            buttonStyleData: ButtonStyleData(
                            ),
                            iconStyleData: IconStyleData(
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: scale.getScaledFont(24),
                            ),
                            dropdownStyleData: DropdownStyleData(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            menuItemStyleData: MenuItemStyleData(
                              padding: scale.getPadding(horizontal: 16),
                            ),
                            hint: Text(
                              'Choose sub-category',
                              style: CustomTextStyle.txtPoppins10W400.copyWith(
                                fontSize: scale.getScaledFont(12),
                              ),
                            ),
                          );
                        }
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(10),
                  ),
                  Text(
                    '${tr('brand')}*',
                    style: CustomTextStyle.txtPoppins12Black500.copyWith(
                      fontSize: scale.getScaledFont(12),
                      color: AppColors.black828282,
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(5),
                  ),
                  Padding(
                    padding: scale.getPadding(right: 3),
                    child: TextFormField(
                      controller: controller.brandName,
                      style: CustomTextStyle.txtPoppins14Black700.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.black828282,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffBDBDBD),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffBDBDBD),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Color(0xffBDBDBD),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Color(0xffBDBDBD),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(10),
                  ),
                  Text(
                    '${tr('model')}*',
                    style: CustomTextStyle.txtPoppins12Black500.copyWith(
                      fontSize: scale.getScaledFont(12),
                      color: AppColors.black828282,
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(5),
                  ),
                  Padding(
                    padding: scale.getPadding(right: 3),
                    child: TextFormField(
                      controller: controller.modelName,
                      style: CustomTextStyle.txtPoppins14Black700.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.black828282,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffBDBDBD),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffBDBDBD),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Color(0xffBDBDBD),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Color(0xffBDBDBD),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(10),
                  ),
                  Text(
                    '${tr('registration_year')} (1985-${DateTime.now().year})*',
                    style: CustomTextStyle.txtPoppins12Black500.copyWith(
                      fontSize: scale.getScaledFont(12),
                      color: AppColors.black828282,
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(5),
                  ),
                  Padding(
                    padding: scale.getPadding(right: 3),
                    child: TextFormField(
                      controller: controller.registrationYear,
                      enabled: false,
                      style: CustomTextStyle.txtPoppins14Black700.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.black828282,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffBDBDBD),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffBDBDBD),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Color(0xffBDBDBD),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Color(0xffBDBDBD),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(10),
                  ),
                  Text(
                    '${tr('fuel_type')}*',
                    style: CustomTextStyle.txtPoppins12Black500.copyWith(
                      fontSize: scale.getScaledFont(12),
                      color: AppColors.black828282,
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(5),
                  ),
                  Padding(
                    padding: scale.getPadding(right: 3),
                    child: Obx(
                      () {
                        return DropdownButtonFormField2<String>(
                          isDense: true,
                          decoration: InputDecoration(
                            isDense: true,
                            suffixIcon: Container(
                              padding: scale.getPadding(
                                  all: 4
                              ),
                              margin: scale.getMargin(
                                left: 10,
                                right: 10,
                                bottom: 10,
                                top: 10,
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Color(0xff808080)
                                  )
                              ),
                              child: Image.asset(
                                'assets/images/pencil_icon.png',
                                height: scale.getScaledHeight(13),
                              ),
                            ),
                            contentPadding: scale.getPadding(vertical: 10),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: Color(0xffBDBDBD),
                                width: 1,
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: Color(0xffBDBDBD),
                                width: 1,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: Color(0xffBDBDBD),
                                width: 1,
                              ),
                            ),
                          ),
                          items: ['Petrol', 'Diesel', 'CNG', 'Hybrid', 'Electric', 'LPG', 'Hydrogen' ].map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: CustomTextStyle.txtPoppins10W400.copyWith(
                                color: AppColors.black,
                                fontSize: scale.getScaledFont(10),
                              ),
                            ),
                          )).toList(),
                          validator: (value) {
                            if (controller.fuelType.value == '') {
                              return 'Please select your fuel type.';
                            }
                            return null;
                          },
                          value: controller.fuelType.value != "" ? controller.fuelType.value : null,
                          onChanged: (value) {
                            controller.fuelType.value = value!;
                          },
                          buttonStyleData: ButtonStyleData(
                          ),
                          iconStyleData: IconStyleData(
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: scale.getScaledFont(24),
                          ),
                          dropdownStyleData: DropdownStyleData(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          menuItemStyleData: MenuItemStyleData(
                            padding: scale.getPadding(horizontal: 16),
                          ),
                          hint: Text(
                            'Choose fuel type',
                            style: CustomTextStyle.txtPoppins10W400.copyWith(
                              fontSize: scale.getScaledFont(12),
                            ),
                          ),
                        );
                      }
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(10),
                  ),
                  Text(
                    '${tr('ownership')}*',
                    style: CustomTextStyle.txtPoppins12Black500.copyWith(
                      fontSize: scale.getScaledFont(12),
                      color: AppColors.black828282,
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(5),
                  ),
                  Padding(
                    padding: scale.getPadding(right: 3),
                    child: Obx(
                      () {
                        return DropdownButtonFormField2<String>(
                          isDense: true,
                          decoration: InputDecoration(
                            isDense: true,
                            suffixIcon: Container(
                              padding: scale.getPadding(
                                  all: 4
                              ),
                              margin: scale.getMargin(
                                left: 10,
                                right: 10,
                                bottom: 10,
                                top: 10,
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Color(0xff808080)
                                  )
                              ),
                              child: Image.asset(
                                'assets/images/pencil_icon.png',
                                height: scale.getScaledHeight(13),
                              ),
                            ),
                            contentPadding: scale.getPadding(vertical: 10),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: Color(0xffBDBDBD),
                                width: 1,
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: Color(0xffBDBDBD),
                                width: 1,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: Color(0xffBDBDBD),
                                width: 1,
                              ),
                            ),
                          ),
                          items: ['1st Owner', '2nd Owner', '3rd Owner', '4th Owner', '4+ Owner'].map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: CustomTextStyle.txtPoppins10W400.copyWith(
                                color: AppColors.black,
                                fontSize: scale.getScaledFont(10),
                              ),
                            ),
                          )).toList(),
                          validator: (value) {
                            if (controller.owner.value == '') {
                              return 'Please select your owner type.';
                            }
                            return null;
                          },
                          value: controller.owner.value != "" ? controller.owner.value : null,
                          onChanged: (value) {
                            controller.owner.value = value!;
                          },
                          buttonStyleData: ButtonStyleData(
                          ),
                          iconStyleData: IconStyleData(
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: scale.getScaledFont(24),
                          ),
                          dropdownStyleData: DropdownStyleData(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          menuItemStyleData: MenuItemStyleData(
                            padding: scale.getPadding(horizontal: 16),
                          ),
                          hint: Text(
                            'Choose owner type',
                            style: CustomTextStyle.txtPoppins10W400.copyWith(
                              fontSize: scale.getScaledFont(12),
                            ),
                          ),
                        );
                      }
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(10),
                  ),
                  Text(
                    '${tr('kms_driven')} (KM)*',
                    style: CustomTextStyle.txtPoppins12Black500.copyWith(
                      fontSize: scale.getScaledFont(12),
                      color: AppColors.black828282,
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(5),
                  ),
                  Padding(
                    padding: scale.getPadding(right: 3),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: controller.kmDriven,
                      style: CustomTextStyle.txtPoppins14Black700.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.black828282,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffBDBDBD),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffBDBDBD),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Color(0xffBDBDBD),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Color(0xffBDBDBD),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hint: Text(
                          'Enter value',
                          style: CustomTextStyle.txtPoppins10W400.copyWith(
                            fontSize: scale.getScaledFont(12),
                          ),
                        ),
                      ),
                      validator: (value){
                        if(controller.kmDriven.text == ''){
                          return "Enter Kms vlaue";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(10),
                  ),
                  Obx(
                    () {
                      return controller.category.value != "Cars" ? controller.category.value != "Machinery" ? Container() : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${tr('Hours Operated (hrs*)')}*',
                            style: CustomTextStyle.txtPoppins12Black500.copyWith(
                              fontSize: scale.getScaledFont(12),
                              color: AppColors.black828282,
                            ),
                          ),
                          SizedBox(
                            height: scale.getScaledHeight(5),
                          ),
                          Padding(
                            padding: scale.getPadding(right: 3),
                            child: Padding(
                              padding: scale.getPadding(right: 3),
                              child: TextFormField(
                                enabled: true,
                                controller: controller.hoursOperated,
                                keyboardType: TextInputType.number,
                                style: CustomTextStyle.txtPoppins14Black700.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black828282,
                                ),
                                decoration: InputDecoration(
                                  hint: Text(
                                    'Enter value',
                                    style: CustomTextStyle.txtPoppins10W400.copyWith(
                                      fontSize: scale.getScaledFont(12),
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xffBDBDBD),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xffBDBDBD),
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Color(0xffBDBDBD),
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Color(0xffBDBDBD),
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                validator: (value){
                                  if(controller.hoursOperated.text == ''){
                                    return "Enter hours value";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ) : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${tr('transmission')}*',
                            style: CustomTextStyle.txtPoppins12Black500.copyWith(
                              fontSize: scale.getScaledFont(12),
                              color: AppColors.black828282,
                            ),
                          ),
                          SizedBox(
                            height: scale.getScaledHeight(5),
                          ),
                          Padding(
                            padding: scale.getPadding(right: 3),
                            child: Obx(
                              () {
                                return DropdownButtonFormField2<String>(
                                  isDense: true,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    suffixIcon: Container(
                                      padding: scale.getPadding(
                                          all: 4
                                      ),
                                      margin: scale.getMargin(
                                        left: 10,
                                        right: 10,
                                        bottom: 10,
                                        top: 10,
                                      ),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Color(0xff808080)
                                          )
                                      ),
                                      child: Image.asset(
                                        'assets/images/pencil_icon.png',
                                        height: scale.getScaledHeight(13),
                                      ),
                                    ),
                                    contentPadding: scale.getPadding(vertical: 10),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: BorderSide(
                                        color: Color(0xffBDBDBD),
                                        width: 1,
                                      ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: BorderSide(
                                        color: Color(0xffBDBDBD),
                                        width: 1,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                        width: 1,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: BorderSide(
                                        color: Color(0xffBDBDBD),
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  items: ['Manual', 'Automatic'].map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: CustomTextStyle.txtPoppins10W400.copyWith(
                                        color: AppColors.black,
                                        fontSize: scale.getScaledFont(10),
                                      ),
                                    ),
                                  )).toList(),
                                  validator: (value) {
                                    if (controller.transmission.value == '' && controller.category.value == 'Cars') {
                                      return 'Please select your transmission type.';
                                    }
                                    return null;
                                  },
                                  value: controller.transmission.value != "" ? controller.transmission.value : null,
                                  onChanged: (value) {
                                    controller.transmission.value = value!;
                                  },
                                  buttonStyleData: ButtonStyleData(
                                  ),
                                  iconStyleData: IconStyleData(
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: scale.getScaledFont(24),
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                  menuItemStyleData: MenuItemStyleData(
                                    padding: scale.getPadding(horizontal: 16),
                                  ),
                                  hint: Text(
                                    'Choose transmission type',
                                    style: CustomTextStyle.txtPoppins10W400.copyWith(
                                      fontSize: scale.getScaledFont(12),
                                    ),
                                  ),
                                );
                              }
                            ),
                          ),
                          SizedBox(
                            height: scale.getScaledHeight(10),
                          ),
                          Text(
                            '${tr('body_type')}*',
                            style: CustomTextStyle.txtPoppins12Black500.copyWith(
                              fontSize: scale.getScaledFont(12),
                              color: AppColors.black828282,
                            ),
                          ),
                          SizedBox(
                            height: scale.getScaledHeight(5),
                          ),
                          Padding(
                            padding: scale.getPadding(right: 3),
                            child: Obx(
                              () {
                                return DropdownButtonFormField2<String>(
                                  isDense: true,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    suffixIcon: Container(
                                      padding: scale.getPadding(
                                          all: 4
                                      ),
                                      margin: scale.getMargin(
                                        left: 10,
                                        right: 10,
                                        bottom: 10,
                                        top: 10,
                                      ),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Color(0xff808080)
                                          )
                                      ),
                                      child: Image.asset(
                                        'assets/images/pencil_icon.png',
                                        height: scale.getScaledHeight(13),
                                      ),
                                    ),
                                    contentPadding: scale.getPadding(vertical: 10),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: BorderSide(
                                        color: Color(0xffBDBDBD),
                                        width: 1,
                                      ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: BorderSide(
                                        color: Color(0xffBDBDBD),
                                        width: 1,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                        width: 1,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: BorderSide(
                                        color: Color(0xffBDBDBD),
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  items: ['Hatchback', 'SUV', 'Sedan', 'Coupe', 'Convertible', 'MPV', 'Pickup', 'Van', 'Wagon', 'Crossover', 'Saloon', 'Estate', 'Roadster'].map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: CustomTextStyle.txtPoppins10W400.copyWith(
                                        color: AppColors.black,
                                        fontSize: scale.getScaledFont(10),
                                      ),
                                    ),
                                  )).toList(),
                                  validator: (value) {
                                    if (controller.bodyType.value == '' && controller.category.value == 'Cars') {
                                      return 'Please select your body type.';
                                    }
                                    return null;
                                  },
                                  value: controller.bodyType.value != "" ? controller.bodyType.value : null,
                                  onChanged: (value) {
                                    controller.bodyType.value = value!;
                                  },
                                  buttonStyleData: ButtonStyleData(
                                  ),
                                  iconStyleData: IconStyleData(
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: scale.getScaledFont(24),
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                  menuItemStyleData: MenuItemStyleData(
                                    padding: scale.getPadding(horizontal: 16),
                                  ),
                                  hint: Text(
                                    'Choose body type',
                                    style: CustomTextStyle.txtPoppins10W400.copyWith(
                                      fontSize: scale.getScaledFont(12),
                                    ),
                                  ),
                                );
                              }
                            ),
                          ),
                          SizedBox(
                            height: scale.getScaledHeight(10),
                          ),
                          Text(
                            '${tr('seating_capacity')}*',
                            style: CustomTextStyle.txtPoppins12Black500.copyWith(
                              fontSize: scale.getScaledFont(12),
                              color: AppColors.black828282,
                            ),
                          ),
                          SizedBox(
                            height: scale.getScaledHeight(5),
                          ),
                          Padding(
                            padding: scale.getPadding(right: 3),
                            child: Obx(
                              () {
                                return DropdownButtonFormField2<String>(
                                  isDense: true,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    suffixIcon: Container(
                                      padding: scale.getPadding(
                                          all: 4
                                      ),
                                      margin: scale.getMargin(
                                        left: 10,
                                        right: 10,
                                        bottom: 10,
                                        top: 10,
                                      ),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Color(0xff808080)
                                          )
                                      ),
                                      child: Image.asset(
                                        'assets/images/pencil_icon.png',
                                        height: scale.getScaledHeight(13),
                                      ),
                                    ),
                                    contentPadding: scale.getPadding(vertical: 10),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: BorderSide(
                                        color: Color(0xffBDBDBD),
                                        width: 1,
                                      ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: BorderSide(
                                        color: Color(0xffBDBDBD),
                                        width: 1,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: BorderSide(
                                        color: Colors.red,
                                        width: 1,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: BorderSide(
                                        color: Color(0xffBDBDBD),
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  items: ['2 Seater', '4 Seater', '5 Seater', '6 Seater', '7 Seater', '8 Seater'].map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: CustomTextStyle.txtPoppins10W400.copyWith(
                                        color: AppColors.black,
                                        fontSize: scale.getScaledFont(10),
                                      ),
                                    ),
                                  )).toList(),
                                  validator: (value) {
                                    if (controller.seatingCapacity.value == '' && controller.category.value == 'Cars') {
                                      return 'Please select your seating capacity.';
                                    }
                                    return null;
                                  },
                                  value: controller.seatingCapacity.value != "" ? controller.seatingCapacity.value : null,
                                  onChanged: (value) {
                                    controller.seatingCapacity.value = value!;
                                  },
                                  buttonStyleData: ButtonStyleData(
                                  ),
                                  iconStyleData: IconStyleData(
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: scale.getScaledFont(24),
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                  menuItemStyleData: MenuItemStyleData(
                                    padding: scale.getPadding(horizontal: 16),
                                  ),
                                  hint: Text(
                                    'Choose seating capacity',
                                    style: CustomTextStyle.txtPoppins10W400.copyWith(
                                      fontSize: scale.getScaledFont(12),
                                    ),
                                  ),
                                );
                              }
                            ),
                          ),
                        ],
                      );
                    }
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(10),
                  ),
                  DecoratedContainer(
                    width: scale.fw,
                    borderRadius: 6,
                    padding: scale.getPadding(
                      vertical: 4,
                      horizontal: 10
                    ),
                    child: Text(
                      tr('rto_details'),
                      textAlign: TextAlign.center,
                      style: CustomTextStyle.txtPoppins16Black500.copyWith(
                        color: AppColors.secondaryLight,
                        fontSize: scale.getScaledFont(14),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(10),
                  ),
                  Text(
                    tr('rto_code'),
                    style: CustomTextStyle.txtPoppins12Black500.copyWith(
                      fontSize: scale.getScaledFont(12),
                      color: AppColors.black828282,
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(5),
                  ),
                  Padding(
                    padding: scale.getPadding(right: 3),
                    child: Padding(
                      padding: scale.getPadding(right: 3),
                      child: TextFormField(
                        enabled: false,
                        controller: controller.vehicleNumber,
                        style: CustomTextStyle.txtPoppins14Black700.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.black828282,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffBDBDBD),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffBDBDBD),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xffBDBDBD),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xffBDBDBD),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(10),
                  ),
                  Text(
                    tr('rto_state'),
                    style: CustomTextStyle.txtPoppins12Black500.copyWith(
                      fontSize: scale.getScaledFont(12),
                      color: AppColors.black828282,
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(5),
                  ),
                  Padding(
                    padding: scale.getPadding(right: 3),
                    child: Padding(
                      padding: scale.getPadding(right: 3),
                      child: TextFormField(
                        enabled: false,
                        controller: controller.rtoState,
                        style: CustomTextStyle.txtPoppins14Black700.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.black828282,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffBDBDBD),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffBDBDBD),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xffBDBDBD),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xffBDBDBD),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(10),
                  ),
                  DecoratedContainer(
                    width: scale.fw,
                    borderRadius: 6,
                    padding: scale.getPadding(
                      vertical: 4,
                      horizontal: 10
                    ),
                    child: Text(
                      tr('price_details'),
                      textAlign: TextAlign.center,
                      style: CustomTextStyle.txtPoppins16Black500.copyWith(
                        color: AppColors.secondaryLight,
                        fontSize: scale.getScaledFont(14),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(10),
                  ),
                  Text(
                    '${tr('asking_price')}*',
                    style: CustomTextStyle.txtPoppins12Black500.copyWith(
                      fontSize: scale.getScaledFont(12),
                      color: AppColors.black828282,
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(5),
                  ),
                  Padding(
                    padding: scale.getPadding(right: 3),
                    child: Padding(
                      padding: scale.getPadding(right: 3),
                      child: TextFormField(
                        controller: controller.priceController,
                        style: CustomTextStyle.txtPoppins14Black700.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.black828282,
                        ),
                        decoration: InputDecoration(
                          hint: Text(
                            'Enter asking price',
                            style: CustomTextStyle.txtPoppins10W400.copyWith(
                              fontSize: scale.getScaledFont(12),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffBDBDBD),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffBDBDBD),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xffBDBDBD),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xffBDBDBD),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Colors.red,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        validator: (value){
                          if(controller.priceController.text == '' || int.tryParse(controller.priceController.text) == null){
                            return "Enter valid asking price";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(10),
                  ),
                  Text(
                    "${tr('price_type')}*",
                    style: CustomTextStyle.txtPoppins12Black500.copyWith(
                      fontSize: scale.getScaledFont(12),
                      color: AppColors.black828282,
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(5),
                  ),
                  Padding(
                    padding: scale.getPadding(right: 3),
                    child: Padding(
                      padding: scale.getPadding(right: 3),
                      child: Obx(
                        () {
                          return DropdownButtonFormField2<String>(
                            isDense: true,
                            decoration: InputDecoration(
                              isDense: true,
                              suffixIcon: Container(
                                padding: scale.getPadding(
                                    all: 4
                                ),
                                margin: scale.getMargin(
                                  left: 10,
                                  right: 10,
                                  bottom: 10,
                                  top: 10,
                                ),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Color(0xff808080)
                                    )
                                ),
                                child: Image.asset(
                                  'assets/images/pencil_icon.png',
                                  height: scale.getScaledHeight(13),
                                ),
                              ),
                              contentPadding: scale.getPadding(vertical: 10),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                  color: Color(0xffBDBDBD),
                                  width: 1,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                  color: Color(0xffBDBDBD),
                                  width: 1,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6),
                                borderSide: BorderSide(
                                  color: Color(0xffBDBDBD),
                                  width: 1,
                                ),
                              ),
                            ),
                            items: ['Negotiable', 'Non-Negotiable'].map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: CustomTextStyle.txtPoppins10W400.copyWith(
                                  color: AppColors.black,
                                  fontSize: scale.getScaledFont(10),
                                ),
                              ),
                            )).toList(),
                            validator: (value) {
                              if (controller.priceTyp.value == '') {
                                return 'Please select your price type.';
                              }
                              return null;
                            },
                            value: controller.priceTyp.value != "" ? controller.priceTyp.value : null,
                            onChanged: (value) {
                              controller.priceTyp.value = value!;
                            },
                            buttonStyleData: ButtonStyleData(
                            ),
                            iconStyleData: IconStyleData(
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.black45,
                              ),
                              iconSize: scale.getScaledFont(24),
                            ),
                            dropdownStyleData: DropdownStyleData(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            menuItemStyleData: MenuItemStyleData(
                              padding: scale.getPadding(horizontal: 16),
                            ),
                            hint: Text(
                              'Choose price type',
                              style: CustomTextStyle.txtPoppins10W400.copyWith(
                                fontSize: scale.getScaledFont(12),
                              ),
                            ),
                          );
                        }
                      ),
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(10),
                  ),
                  Text(
                    tr('add_more_details'),
                    style: CustomTextStyle.txtPoppins12Black500.copyWith(
                      fontSize: scale.getScaledFont(12),
                      color: AppColors.black828282,
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(5),
                  ),
                  Padding(
                    padding: scale.getPadding(right: 3),
                    child: Padding(
                      padding: scale.getPadding(right: 3),
                      child: TextFormField(
                        maxLines: 5,
                        controller: controller.detailComment,
                        style: CustomTextStyle.txtPoppins14Black700.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.black828282,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffBDBDBD),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffBDBDBD),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xffBDBDBD),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xffBDBDBD),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(10),
                  ),

                  Container(
                    margin: scale.getMargin(
                      bottom: 20,
                      top: 20,
                    ),
                    width: scale.fw,
                    height: scale.getScaledHeight(40),
                    child: ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          Get.toNamed(AppRoutes.pincodeSelection);
                        }
                      },
                      child: Text(
                        tr('next'),
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
        ),
      ),
    );
  }
}
