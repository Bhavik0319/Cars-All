import 'dart:io';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cars_and_alll/app/data/api/api_client.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/pincode_model.dart';
import '../../../models/vehicle_detail_model.dart' hide VehicleFilters;
import '../../../routes/app_routes.dart';
import '../../../utils/customSnackBar.dart';
import '../model/post_vehicle_model.dart';

class PostNewAddController extends GetxController {

  PostVehicleModel postVehicleModel = PostVehicleModel();
  Rx<VehicleDetailModel> vehicleDetail = VehicleDetailModel().obs;
  final ImagePicker picker = ImagePicker();

  String vehicleId = "";
  RxString category = ''.obs;
  RxString subCategory = 'Choose sub-category'.obs;
  RxString transmission = ''.obs;
  RxString seatingCapacity = ''.obs;
  RxString owner = ''.obs;
  RxString bodyType = ''.obs;
  RxString fuelType = ''.obs;
  RxString priceTyp = ''.obs;

  TextEditingController priceController = TextEditingController();
  TextEditingController detailComment = TextEditingController();
  TextEditingController kmDriven = TextEditingController();
  TextEditingController vehicleNumber = TextEditingController();
  final TextEditingController pinCode = TextEditingController();
  var brandName = TextEditingController();
  var modelName = TextEditingController();
  var registrationYear = TextEditingController();
  var rtoState = TextEditingController();

  RxList<String> allSubCategories = <String>['Choose sub-category'].obs;

  final RegExp regexVehicleNo = RegExp(r'^[A-Z]{2}[0-9]{1,2}[A-Z]{1,3}[0-9]{4}$');

  RxList<PincodeModel> pinCodeList = <PincodeModel>[].obs;
  RxList<String> vehicleImages = <String>[].obs;

  Rx<PincodeModel> selectedPinCode = PincodeModel().obs;


  @override
  void onInit() {
    if(Get.arguments != null && Get.arguments['vehicleId'] != ''){
      ApiClient.to.getVehicleDetails(
        id: Get.arguments['vehicleId'],
        onSuccess: (res) {
          vehicleDetail.value = VehicleDetailModel.fromJson(res.body['data']);
          vehicleImages.value = vehicleDetail.value.images!;
          if(vehicleDetail.value.category! == 'ev') {
            category.value = vehicleDetail.value.category!.capitalize!;
          }else{
            category.value = vehicleDetail.value.category!.capitalizeFirst!;
          }
          subCategory.value = vehicleDetail.value.subCategory!.capitalizeFirst!;
          transmission.value = vehicleDetail.value.filters!.transmissionType!;
          seatingCapacity.value = vehicleDetail.value.filters!.seatingCapacity!;
          owner.value = vehicleDetail.value.filters!.ownerType!;
          bodyType.value = vehicleDetail.value.filters!.bodyType!;
          fuelType.value = vehicleDetail.value.filters!.fuelType!;
          priceTyp.value = vehicleDetail.value.priceType!;
          priceController.text = vehicleDetail.value.askingPrice!.toString();
          detailComment.text = vehicleDetail.value.description!;
          kmDriven.text = vehicleDetail.value.filters!.kmsDriven!.toString();
          vehicleNumber.text = vehicleDetail.value.rtoDetails!.rtoCode!;
          pinCode.text = vehicleDetail.value.location!.pincode!;
          selectedPinCode.value = PincodeModel(
            name: vehicleDetail.value.location!.localPlace!,
            circle: vehicleDetail.value.location!.localCircle!,
            division: vehicleDetail.value.location!.city!,
            district: vehicleDetail.value.location!.district!,
            state: vehicleDetail.value.location!.state!,
          );
          pinCodeList.add(selectedPinCode.value);
          postVehicleModel = PostVehicleModel(
            vehicleFilters: VehicleFilters(
              brand: vehicleDetail.value.filters!.brand,
              model: vehicleDetail.value.filters!.model,
              registrationYear: vehicleDetail.value.filters!.registrationYear,
            ),
            vehicleNumber: vehicleDetail.value.rtoDetails!.rtoCode,
          );
          rtoState.text = vehicleDetail.value.rtoDetails!.rtoState!;
          brandName.text = vehicleDetail.value.filters!.brand!;
          modelName.text = vehicleDetail.value.filters!.model!;
          registrationYear.text = vehicleDetail.value.filters!.registrationYear!.toString();

          if(category.value == 'Cars'){
            allSubCategories.value = ["Choose sub-category", "Cars", "Vintage Cars",'Luxury Cars'];
          } else if(category.value == 'Bikes'){
            allSubCategories.value = ["Choose sub-category", "Bikes", "Scooter", "Premium Bikes",'Luxury Bikes'];
          }else if(category.value == 'EV'){
            allSubCategories.value = ["Choose sub-category", "Electric Cars", 'Electric Bikes', 'Commercial EVs', 'Others'];
          }else if(category.value == 'Commercial'){
            allSubCategories.value = ["Choose sub-category", "Cars", 'Trucks', 'Flatbeds', 'LCVs', 'Buses','Others'];
          }else if(category.value == 'Machinery'){
            allSubCategories.value = ["Choose sub-category", "Tractors", 'Bulldozer', 'Excavators', 'Cranes', 'Forklift', 'Concrete Mixers', 'Harvesters','Others'];
          } else {
            allSubCategories.value = ["Choose sub-category"];
          }
        },
        onError: (res) {
          customSnackBar(
            type: AnimatedSnackBarType.error,
            message: res.body['message'],
          );
        },
      );
    }
    super.onInit();
  }

  bool verifyVehicleNumber() {
    return regexVehicleNo.hasMatch(vehicleNumber.text);
  }

  getPinCode(){
    pinCodeList.clear();
    Get.dialog(
        barrierDismissible: false,
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: AppColors.secondaryLight,
            ),
          ],
        )
    );
    ApiClient.to.getPinCode(
      pincode: pinCode.text,
      onSuccess: (res) {
        for(var data in res.body['data']){
          pinCodeList.add(PincodeModel.fromJson(data));
        }
        Get.back();
      },
      onError: (res) {
        Get.back();
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: res.body['message'],
        );
      },
    );
  }

  searchVehicleNumber() {
    Get.dialog(
        barrierDismissible: false,
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: AppColors.secondaryLight,
            ),
          ],
        )
    );

    ApiClient.to.searchVehicleNumber(
      vehicleNumber: vehicleNumber.text,
      onSuccess: (res){
        postVehicleModel = PostVehicleModel.fromJson(res.body["data"]);
        brandName.text = postVehicleModel.vehicleFilters!.brand!;
        modelName.text = postVehicleModel.vehicleFilters!.model!;
        registrationYear.text = postVehicleModel.vehicleFilters!.registrationYear!.toString();
        rtoState.text = postVehicleModel.vehicleLocation!.state!;
        Get.back();
        Get.toNamed(AppRoutes.enterVehicleDetails);
      },
      onError: (res) {
        Get.back();
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: res.body["message"],
        );
      }
    );
  }

  postVehicle() async {
    Get.dialog(
        barrierDismissible: false,
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: AppColors.secondaryLight,
            ),
          ],
        )
    );
    List<String> imageUrl = [];
    for(var image in vehicleImages.value){
      if(image.startsWith('https')){
        imageUrl.add(image);
      }else{
        imageUrl.add(await uploadProfilePhoto(File(image)));
      }
    }
    if(imageUrl.isNotEmpty){
      ApiClient.to.postVehicle(
        data: {
          "vehicleCategory": category.value.toLowerCase(),
          "vehicleSubCategory": subCategory.value.toLowerCase(),
          "vehicleNumber": vehicleNumber.text,
          "vehicleDescription": detailComment.text,
          "askingPrice": priceController.text,
          "priceType": priceTyp.value,
          "vehicleLocation": {
            "local_place": selectedPinCode.value.name,
            "local_circle": selectedPinCode.value.circle,
            "city": selectedPinCode.value.division,
            "district": selectedPinCode.value.district,
            "state": selectedPinCode.value.state,
            "pincode": pinCode.text,
          },
          "vehicleImages": imageUrl,
          "vehicleFilters": {
            "brand": postVehicleModel.vehicleFilters!.brand,
            "model": postVehicleModel.vehicleFilters!.model,
            "registrationYear": postVehicleModel.vehicleFilters!.registrationYear,
            "kmsDriven": kmDriven.text,
            "fuelType": fuelType.value,
            "transmissionType": category.value == 'Cars' ? transmission.value : '',
            "ownerType": owner.value,
            "bodyType": category.value == 'Cars' ? bodyType.value : '',
            "seatingCapacity": category.value == 'Cars' ? seatingCapacity.value : ''
          },
          "vehicle_rto_details": {
            "RTO_Code": vehicleNumber.text.substring(0, 4),
            "RTO_state": "STATE NAME",
            "RTO_number": "11111111",
            "RTO_address": "RTO DATA ADDRESS"
          }
        },
        onSuccess: (res) {
          Get.back();
          customSnackBar(
            type: AnimatedSnackBarType.success,
            message: res.body["message"],
          );
          Get.toNamed(AppRoutes.successErrorPostScreen);
        },
        onError: (res) {
          Get.back();
          customSnackBar(
            type: AnimatedSnackBarType.error,
            message: res.body["message"],
          );
        },
      );
    }else {
      Get.back();
      customSnackBar(
        type: AnimatedSnackBarType.error,
        message: "Failed to upload image",
      );
    }
  }

  Future<String> uploadProfilePhoto(File file) async {
    var res = await ApiClient.to.uploadUserProfile(file: file);
    if(res["success"]) {
      return res["imageUrls"][0];
    }
    return '';
  }


}