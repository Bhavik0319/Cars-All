import 'package:cars_and_alll/app/controller/MyListingController.dart';
import 'package:cars_and_alll/app/screens/car_details/controller/carDetailController.dart';
import 'package:cars_and_alll/shared/theme/custom_text_style.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../shared/color/app_color.dart';
import '../models/user_model.dart';
import '../utils/scale_utility.dart';

class MarkAsSoldPopup extends StatefulWidget {
  final MyListingController controller;
  final String vehicleId;
  const MarkAsSoldPopup({required this.controller, required this.vehicleId, super.key});

  @override
  State<MarkAsSoldPopup> createState() => _MarkAsSoldPopupState();
}

class _MarkAsSoldPopupState extends State<MarkAsSoldPopup> {

  bool isSoldOutside = true;

  @override
  Widget build(BuildContext context) {

    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Where you sold your vehicle?",
              style: CustomTextStyle.txtPoppins14Black700.copyWith(
                fontSize: scale.getScaledFont(14),
              ),
            ),
            SizedBox(
              height: scale.getScaledHeight(10),
            ),
            DropdownButtonFormField2<String>(
              isDense: true,
              // value: ref.watch(insuranceFormController)!.registrationTypeSelection,
              decoration: InputDecoration(
                contentPadding: scale.getPadding(vertical: 10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Color(0xffBDBDBD),
                    width: 1,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Color(0xffBDBDBD),
                    width: 1,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Color(0xffBDBDBD),
                    width: 1,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Color(0xffBDBDBD),
                    width: 1,
                  ),
                ),
              ),
              hint: Text(
                '--Choose one--',
                style: CustomTextStyle.txtPoppins10W400.copyWith(
                  color: AppColors.black828282,
                  fontSize: scale.getScaledFont(14),
                ),
              ),
              items: ['Sold it somewhere', 'Sold it on CarsAndAll'].map((item) => DropdownMenuItem<String>(
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
                if(value == 'Sold it somewhere'){
                  setState(() {
                    isSoldOutside = true;
                  });
                }else{
                  setState(() {
                    isSoldOutside = false;
                  });
                }
              },
              buttonStyleData: ButtonStyleData(
                padding: scale.getPadding(right: 8),
              ),
              iconStyleData: IconStyleData(
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black45,
                ),
                iconSize: scale.getScaledFont(24),
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              menuItemStyleData: MenuItemStyleData(
                padding: scale.getPadding(horizontal: 16),
              ),
            ),
            SizedBox(
              height: scale.getScaledHeight(10),
            ),
            if(!isSoldOutside)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Find User",
                    style: CustomTextStyle.txtPoppins14Black700,
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(10),
                  ),
                  TypeAheadField<UserModel>(
                    controller: widget.controller.currentUser,
                    builder: (context, controller, focusNode) {
                      return TextField(
                        style: CustomTextStyle.txtPoppins12Black500.copyWith(
                          fontSize: scale.getScaledFont(12),
                          fontWeight: FontWeight.w400,
                        ),
                        controller: controller,
                        focusNode: focusNode,
                        decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'Search...'),
                      );
                    },
                    suggestionsCallback: (pattern) {
                      return widget.controller.allUsers.where((e) => e.userPhone!.startsWith(pattern)).toList();
                    },
                    itemBuilder: (context, suggestion) {
                      return ListTile(
                        title: Text(
                          '${suggestion.userPhone!} - ${suggestion.userName}',
                          style: CustomTextStyle.txtPoppins12Black500.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: scale.getScaledFont(12),
                          )
                        ),
                      );
                    },
                    onSelected: (suggestion) {
                      widget.controller.currentSelection = suggestion;
                      widget.controller.currentUser.text = suggestion.userPhone!;
                    },
                  ),
                  SizedBox(
                    height: scale.getScaledHeight(10),
                  ),
                ],
              ),
            SizedBox(
              height: scale.getScaledHeight(20),
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  if(!isSoldOutside) {
                    widget.controller.markAsSold(widget.vehicleId, widget.controller.currentSelection.id);
                  } else {
                    widget.controller.updateVehicleStatus(widget.vehicleId);
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: scale.getPadding(
                    vertical: 20,
                    horizontal: 20
                  ),
                ),
                child: Text(
                  "Submit",
                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                    color: AppColors.white,
                    fontSize: scale.getScaledFont(15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
