import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cars_and_alll/app/data/api/api_client.dart';
import 'package:cars_and_alll/app/models/vehicle_model.dart';
import 'package:cars_and_alll/app/screens/filter/controller/filterController.dart';
import 'package:cars_and_alll/app/utils/customSnackBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../services/user.dart';
import '../../filter/enum/transmissionType.dart';

class ViewAllController extends GetxController{

  RxBool isLoading = false.obs;

  RxString initialCategory = "".obs;
  RxString selectedSubCategory = "".obs;
  RxBool isLux = false.obs;

  TextEditingController searchController = TextEditingController();

  RxList<String> initialSubCategory = <String>[].obs;
  RxList<String> allSubCategories = <String>[].obs;

  List<String> selectedBrandName = [];
  List<String> selectedModelName = [];
  List<String> selectedBodyType = [];
  List<String> selectedFuelType = [];
  List<String> selectedSittingCapacity = [];
  List<String> rtoCode = [];
  List<String> selectedNoOfOwner = <String>[];

  TransmissionType transmissionType = TransmissionType.MANUAL;
  SfRangeValues priceRange = SfRangeValues(0, 0);
  SfRangeValues hoursOperator = SfRangeValues(0, 0);
  SfRangeValues manufacturer = SfRangeValues(0, 0);
  SfRangeValues kmDriven = SfRangeValues(0, 0);

  RxList<VehicleModel> vehicles = <VehicleModel>[].obs;

  Map<String, dynamic> mockSubCategory = {
    "luxury-vehicles": {
      'subCategory': ["luxury", "premium"],
    },
    "cars": {
      'subCategory': ['cars', 'vintage', 'luxury'],
    },
    "bikes": {
      'subCategory': ['bikes', 'scooters', 'premium', 'vintage'],
    },
    "ev": {
      'subCategory': ['ev','ev cars', 'ev bikes', 'ev commercial'],
    },
    "commercial": {
      'subCategory': ['commercial', 'cars', 'trucks', 'lcvs', 'buses', 'flatbeds'],
    },
    "machinery": {
      'subCategory': ['machinery', 'tractors', 'bulldozers', 'excavators', 'cranes', 'harvesters', 'concrete-mixers', 'forklift'],
    },
  };

  String sortType = "latest";

  @override
  void onInit() {
    initialCategory.value = Get.arguments["category"];
    print(initialCategory.value);
    initialSubCategory.value = mockSubCategory[initialCategory.value]['subCategory']?? [];
    if(initialCategory.value == "luxury-vehicles"){
      isLux.value = true;
    } else {
      isLux.value = false;
    }
    selectedSubCategory.value = initialSubCategory.first;
    print(initialCategory.value);
    applyFilter();

    super.onInit();
  }

  loadInitial(){
    if(!isLux.value){
      Get.find<FilterController>().selectedBrandName.value = [...selectedBrandName];
      Get.find<FilterController>().selectedModelName.value = [...selectedModelName];
      Get.find<FilterController>().selectedBodyType.value = [...selectedBodyType];
      Get.find<FilterController>().selectedFuelType.value = [...selectedFuelType];
      Get.find<FilterController>().selectedNoOfOwner.value  = [...selectedNoOfOwner];
      Get.find<FilterController>().selectedSittingCapacity.value  = [...selectedSittingCapacity];
      Get.find<FilterController>().selectedRtoCodes.value  = [...rtoCode];

      Get.find<FilterController>().transmissionType.value = transmissionType;
      Get.find<FilterController>().priceRange.value = SfRangeValues(priceRange.start, priceRange.end);
      Get.find<FilterController>().manufacturer.value = SfRangeValues(manufacturer.start, manufacturer.end);
      Get.find<FilterController>().kmDriven.value = SfRangeValues(kmDriven.start, kmDriven.end);
    }
  }

  applyFilter(){
    isLoading.value = true;
    vehicles.clear();
    Map<String, dynamic> filters = {};

    if(!isLux.value){
      selectedBrandName = [...Get.find<FilterController>().selectedBrandName];
      selectedModelName = [...Get.find<FilterController>().selectedModelName];
      selectedBodyType = [...Get.find<FilterController>().selectedBodyType];
      selectedFuelType = [...Get.find<FilterController>().selectedFuelType];
      selectedNoOfOwner = [...Get.find<FilterController>().selectedNoOfOwner];
      selectedSittingCapacity = [...Get.find<FilterController>().selectedSittingCapacity];
      rtoCode = [...Get.find<FilterController>().selectedRtoCodes];
      transmissionType = Get.find<FilterController>().transmissionType.value;
      priceRange = SfRangeValues(Get.find<FilterController>().priceRange.value.start, Get.find<FilterController>().priceRange.value.end);
      manufacturer = SfRangeValues(Get.find<FilterController>().manufacturer.value.start, Get.find<FilterController>().manufacturer.value.end);
      kmDriven = SfRangeValues(Get.find<FilterController>().kmDriven.value.start, Get.find<FilterController>().kmDriven.value.end);
      hoursOperator = SfRangeValues(Get.find<FilterController>().hoursOperator.value.start, Get.find<FilterController>().hoursOperator.value.end);

      if(selectedBrandName.isNotEmpty){
        filters["Brand"] = selectedBrandName;
      }
      if(selectedModelName.isNotEmpty){
        filters["Model"] = selectedModelName;
      }
      if(selectedBodyType.isNotEmpty){
        filters["BodyType"] = selectedBodyType;
      }
      if(selectedFuelType.isNotEmpty){
        filters["FuelType"] = selectedFuelType;
      }
      if(selectedNoOfOwner.isNotEmpty){
        filters["Owner"] = selectedNoOfOwner;
      }
      if(selectedSittingCapacity.isNotEmpty){
        filters["SeatingCapacity"] = selectedSittingCapacity;
      }
      if(transmissionType != TransmissionType.MANUAL){
        filters["Transmission"] = [transmissionTypeToString(transmissionType)];
      }
      if(rtoCode.isNotEmpty){
        filters["RTO"] = rtoCode.map((e) => e.substring(0,4)).toList();
      }
      if(kmDriven.start != 0 || kmDriven.end != 0){
        filters["KmsDriven"] = {"min" : kmDriven.start, "max": kmDriven.end};
      }
      if(priceRange.start != 0 || priceRange.end != 0){
        filters["Price"] = {"min": priceRange.start, "max": priceRange.end};
      }
      if(manufacturer.start != 0 || manufacturer.end != 0){
        filters["Manufacturer"] = {"min": manufacturer.start, "max": manufacturer.end};
      }
      if((hoursOperator.start != 0 || hoursOperator.end != 0) && initialCategory.value == 'machinery'){
        filters["HoursOperator"] = {"min": hoursOperator.start, "max": hoursOperator.end};
      }
    }


    ApiClient.to.applyFilter(
      filter: {
        "category": isLux.value ? "" : initialCategory.value,
        "subcategory": isLux.value ? initialSubCategory.value : selectedSubCategory.value == initialSubCategory.first ? '' : selectedSubCategory.value,
        "filters": filters,
        "search": searchController.text,
        "sort": sortType,
        "pincode": UserStore.to.userLocation.value.pincode.toString(),
      },
      onSuccess: (res){
        for(var element in res.body["data"]){
          VehicleModel vehicle = VehicleModel.fromJson(element);
          vehicles.add(vehicle);
        }
        isLoading.value = false;
      },
      onError: (res) {
        isLoading.value = false;
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: res.body["message"],
        );
      },
    );
  }

}