import 'package:cars_and_alll/app/constants/assetConstant.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../shared/theme/custom_text_style.dart';
import '../../../../utils/scale_utility.dart';

class PostNewAddScreen extends StatelessWidget {
  const PostNewAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Nav Bar
                  Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Color(0xFFF7F3EA),
                      child:
                      const Icon(Icons.arrow_back, color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Post new Adds",
                      style: CustomTextStyle.txtPoppins12Black500.copyWith(
                        fontSize: scale.getScaledFont(20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),


                  // Vehicle Details Section
                  SvgPicture.asset(
                    AssetConstant.carIcon,
                    color: AppColors.secondaryLight,
                    height: scale.getScaledHeight(35),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Vehicle Details",
                    style: CustomTextStyle.txtPoppins12Black500.copyWith(
                      fontSize: scale.getScaledFont(12),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),


                  buildDropdownField("e.g. MH 01 AB 1234", "Enter Vehicle Number"),
                  buildDropdownField("Select Brand name", "Brand"),
                  buildDropdownField("Select model name", "Model"),
                  buildDropdownField("Select year", "Year"),
                  buildDropdownField("Select Variant", "Variant"),
                  buildTextField("e.g. MH 01 AB 1234", "Registration number"),
                  buildTextField("e.g. 25000", "Km Driven"),


                  const SizedBox(height: 16),
                  buildUploadField("Upload File"),
                  const SizedBox(height: 6),
                  Text(
                    "RC Document (Optional)",
                    style: CustomTextStyle.txtPoppins12Black500.copyWith(
                      fontSize: scale.getScaledFont(12),
                      fontWeight: FontWeight.w400,
                      color: AppColors.black828282,
                    ),
                  ),


                  const SizedBox(height: 30),
                  const Icon(Icons.camera_alt_outlined,
                    size: 30,
                    color: AppColors.secondaryLight,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Photos & Videos",
                    style: CustomTextStyle.txtPoppins12Black500.copyWith(
                      fontSize: scale.getScaledFont(12),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Photos",
                    style: CustomTextStyle.txtPoppins12Black500.copyWith(
                      fontSize: scale.getScaledFont(12),
                      fontWeight: FontWeight.w400,
                      color: AppColors.black828282,
                    ),
                  ),

                  const SizedBox(height: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildAddCarBox(),
                      buildAddCarBox(),
                      buildAddCarBox(),
                    ],
                  ),


                  const SizedBox(height: 16),
                  buildUploadField("Upload Videos"),
                  const SizedBox(height: 6),
                  Text(
                    "Videos (Optional)",
                    style: CustomTextStyle.txtPoppins12Black500.copyWith(
                      fontSize: scale.getScaledFont(12),
                      fontWeight: FontWeight.w400,
                      color: AppColors.black828282,
                    ),
                  ),


                  const SizedBox(height: 30),


                  // Pricing & Location
                  Row(
                    children: [
                      Icon(Icons.local_offer, color: Colors.amber),
                      SizedBox(width: 8),
                      Text(
                        "Pricing & Location",
                        style: CustomTextStyle.txtPoppins12Black500.copyWith(
                          fontSize: scale.getScaledFont(16),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),


                  buildTextField("e.g: ₹300000", "Asking Price"),
                  buildDropdownField("Negotiable", "Price Type"),
                  buildTextField("City/State", "Location"),
                  buildTextField("Describe your vehicle condition", "Description", maxLines: 4),


                  const SizedBox(height: 30),


                  Row(
                    children: [
                      Icon(Icons.person, color: Colors.amber),
                      SizedBox(width: 8),
                      Text(
                        "Contact Information",
                        style: CustomTextStyle.txtPoppins12Black500.copyWith(
                          fontSize: scale.getScaledFont(16),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),


                  buildTextField("Full Name", "Full Name"),
                  const SizedBox(height: 50),
                ],
              ),
            );
          },
        ),
      ),
    );
  }


  Widget buildDropdownField(String hint, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: 10,
            left: 10,
          ),
          child: DropdownButtonFormField2<String>(
            isDense: true,
            decoration: InputDecoration(
              isDense: true,
              suffixIcon: Container(
                padding: EdgeInsets.all(4),
                margin: EdgeInsets.only(
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
                  height: 13,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10),
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
                  color: Color(0xffBDBDBD),
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
            items: ["Option 1", "Option 2", "Option 3"].map((e) => DropdownMenuItem(value: e, child: Text(
              e,
              style: CustomTextStyle.txtPoppins10W400.copyWith(
                color: AppColors.black,
                fontSize: 10,
              ),
            ))).toList(),
            onChanged: (value) {},
            hint: null,
            buttonStyleData: ButtonStyleData(
            ),
            iconStyleData: IconStyleData(
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.black45,
              ),
              iconSize: 24,
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            menuItemStyleData: MenuItemStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            label,
            style: CustomTextStyle.txtPoppins12Black500.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.black828282,
            ),
          ),
        ]),
        const SizedBox(height: 16),
      ],
    );
  }


  Widget buildTextField(String hint, String label, {int maxLines = 1}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            maxLines: maxLines,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10),
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
                  color: Color(0xffBDBDBD),
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
          ),
          const SizedBox(height: 6),
          Text(label,
              style: const TextStyle(fontSize: 12, color: Colors.black54)),
          const SizedBox(height: 16),
        ],
      ),
    );
  }


  Widget buildUploadField(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(6),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.upload_file, color: Colors.black54),
          const SizedBox(width: 6),
          Text(label, style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }


  Widget buildAddCarBox() {
    return Container(
      width: 122,
      margin: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 10,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 30
      ),
      decoration: BoxDecoration(
        color: AppColors.secondaryLight.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.add,
            color: AppColors.secondaryLight,
            size: 36,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Add New Car',
            style: CustomTextStyle.txtPoppins12Black500.copyWith(
              color: AppColors.secondaryLight,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }

}
