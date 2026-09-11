import 'dart:async';
import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cars_and_alll/app/constants/assetConstant.dart';
import 'package:cars_and_alll/app/data/api/api_client.dart';
import 'package:cars_and_alll/app/models/category_model.dart';
import 'package:cars_and_alll/app/models/reelsModel.dart';
import 'package:cars_and_alll/app/models/unseen_chat_model.dart';
import 'package:cars_and_alll/app/models/userLocation_model.dart';
import 'package:cars_and_alll/app/models/vehicle_model.dart';
import 'package:cars_and_alll/app/models/wishlist_model.dart';
import 'package:cars_and_alll/app/screens/home/models/category_tile_model.dart';
import 'package:cars_and_alll/app/services/user.dart';
import 'package:cars_and_alll/app/utils/customSnackBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../../shared/color/app_color.dart';
import '../../../controller/home_nav_controller.dart';
import '../../../data/api/socket_client.dart';
import '../../../models/pincode_model.dart';
import '../../../routes/app_routes.dart';

class HomeController extends GetxController{

  RxString selectedLocation = 'select_location'.obs;

  RxString selectedCategory = ''.obs;
  RxBool isLoading = true.obs;

  Rx<PincodeModel> selectedUserLocation = PincodeModel().obs;
  final TextEditingController pinCode = TextEditingController();
  RxList<PincodeModel> pinCodeList = <PincodeModel>[].obs;

  List<CategoryTileModel> topCategories = [
    CategoryTileModel('Cars', AssetConstant.carTile),
    CategoryTileModel('Bikes', AssetConstant.bikeTile),
    CategoryTileModel('Electric Vehicle', AssetConstant.evTile),
    CategoryTileModel('Commercial Vehicle', AssetConstant.commercialVehicleTile),
    CategoryTileModel('Heavy Machinery', AssetConstant.heavyMechaneryTile),
    CategoryTileModel('Parts & Accessories', AssetConstant.partsAccessories),
    CategoryTileModel('Services', AssetConstant.servicesTile),
    CategoryTileModel('Luxe', AssetConstant.luxeTile),
    CategoryTileModel('Coming Soon', AssetConstant.comingSoonTile),
  ];

  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;

  List<String> allServices = [
    'Financial Assistance',
    'CIBIL Score Check',
    'EMI Calculator',
    'Vehicle Insurance',
    'Compare Insurance Quotes',
    'RTO API',
    'Insurance',
    'Document Upload'
  ];

  List<String> allBrands = [];

  RxMap<String, List<VehicleModel>> allVehicles = <String, List<VehicleModel>>{}.obs;
  RxMap<String, List<VehicleModel>> allBikes = <String, List<VehicleModel>>{}.obs;
  RxMap<String, List<VehicleModel>> allEv = <String, List<VehicleModel>>{}.obs;
  RxMap<String, List<VehicleModel>> popularVehicles = <String, List<VehicleModel>>{}.obs;

  RxList<WishlistModel> wishlistVehicle = <WishlistModel>[].obs;

  RxList<ReelModel> reels = <ReelModel>[].obs;

  final SocketService _socket = SocketService.instance;
  SocketListener? _conversationUpdatedListener;
  SocketListener? _conversationSeenListener;


  @override
  Future<void> onInit() async{

    var permission = await Geolocator.checkPermission();

    if (permission != LocationPermission.always && permission != LocationPermission.whileInUse) {
      Geolocator.requestPermission();
    }
    await getAllCategories();
    await getAllVehicles();
    getWishlist();
    await getPopularVehicles();
    await getShorts();
    isLoading.value = false;
    _setupSocket();
    super.onInit();
  }

  RxInt chooseYourCarTab = 0.obs;

  void changeTap(int index) {
    chooseYourCarTab.value = index;
  }

  void navigateToService(int index) {
    switch(index){
      case 0:
        Get.toNamed(AppRoutes.financialAssistLandingScreen);
        break;
      case 1:
        Get.toNamed(AppRoutes.cibilLandingScreen);
        break;
      case 2:
        // Get.toNamed(AppRoutes.emiCalculatorScreen);
        break;
      case 3:
        Get.toNamed(AppRoutes.insuranceFormScreen);
        break;
      case 4:
        Get.toNamed(AppRoutes.compareInsuranceQuote);
        break;
      case 5:
        // Get.toNamed(AppRoutes.rto);
        break;
      case 6:
        Get.toNamed(AppRoutes.insuranceFormScreen);
        break;
      case 7:
        Get.toNamed(AppRoutes.uploadDocumentScreen);
        break;
      default: break;
    }
  }

  Future<void> getAllCategories() async {
    allCategories.clear();
    await ApiClient.to.getAllCategory(
      onSuccess: (res) {
        for(var category in res.body['data']){
          allCategories.add(CategoryModel.fromJson(category));
        }
        allCategories.add(CategoryModel(categoryName: "Coming Soon", categoryImage: [AssetConstant.comingSoonTile]));
      },
      onError: (res) {
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: res.body["message"],
        );
      },
    );
  }


  Future<void> getAllVehicles() async {
    await ApiClient.to.getAllVehicles(
      onSuccess: (res) {
        for(var element in res.body["data"]){
          VehicleModel vehicle = VehicleModel.fromJson(element);
          if (allVehicles.containsKey(vehicle.vehicleCategory)) {
            allVehicles[vehicle.vehicleCategory]!.add(vehicle);
            if(vehicle.vehicleCategory == "bikes"){
              if(!allBikes.containsKey("All Bikes")){
                allBikes["All Bikes"] = [vehicle];
              }else{
                allBikes["All Bikes"]?.add(vehicle);
              }
              if(!allBikes.containsKey(vehicle.vehicleSubCategory) && vehicle.vehicleSubCategory != ""){
                allBikes[vehicle.vehicleSubCategory!] = [vehicle];
              }else{
                allBikes[vehicle.vehicleSubCategory!]?.add(vehicle);
              }
            } else if(vehicle.vehicleCategory == "ev") {
              if(!allEv.containsKey(vehicle.vehicleSubCategory)){
                allEv[vehicle.vehicleSubCategory!] = [vehicle];
              }else{
                allEv[vehicle.vehicleSubCategory!]?.add(vehicle);
              }
            }
          } else {
            allVehicles[vehicle.vehicleCategory!] = [vehicle];
          }
        }
      },
      onError: (res) {
        log(res.toString());
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: res.body["message"],
        );
      },
    );
  }

  Future<void> getPopularVehicles() async {
    popularVehicles.clear();
    await ApiClient.to.getShortFilter(
      arg: {
        "popular": 'true'
      },
      onSuccess: (res) {
        for(var element in res.body["data"]){
          VehicleModel vehicle = VehicleModel.fromJson(element);
          if (popularVehicles.containsKey('Popular ${vehicle.vehicleCategory!}')) {
            popularVehicles['Popular ${vehicle.vehicleCategory!}']!.add(vehicle);
          } else {
            popularVehicles['Popular ${vehicle.vehicleCategory!}'] = [vehicle];
          }
        }
      },
      onError: (res) {
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: res.body["message"],
        );
      },
    );
  }

  Future<void> getWishlist() async {
    wishlistVehicle.clear();
    await ApiClient.to.getWishlist(
      onSuccess: (res) {
        for(var element in res.body["data"]){
          WishlistModel vehicle = WishlistModel.fromJson(element);
          wishlistVehicle.add(vehicle);
        }
      },
      onError: (res) {
        // customSnackBar(
        //   type: AnimatedSnackBarType.error,
        //   message: res.body.toString(),
        // );
      },
    );
  }



  getPinCode(){
    pinCodeList.clear();

    ApiClient.to.getPinCode(
      pincode: pinCode.text,
      onSuccess: (res) {
        for(var data in res.body['data']){
          pinCodeList.value.add(PincodeModel.fromJson(data));
        }
        pinCodeList.refresh();
      },
      onError: (res) {
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: res.body['message'],
        );
      },
    );
  }

  setUserLocation(int? index){
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
    selectedUserLocation.value = pinCodeList.value[index!];
    var userModel = UserLocationModel.fromJson({
      "name": selectedUserLocation.value.name,
      "district": selectedUserLocation.value.district,
      "state": selectedUserLocation.value.state,
      "pincode": int.parse(pinCode.text),
    });
    print(userModel);
    UserStore.to.setUserLocation(userModel);
    pinCodeList.clear();
    pinCode.clear();
    selectedUserLocation.value = PincodeModel();
    Get.back();
    Get.back();
  }

  Future<void> getShorts() async {
    reels.clear();
    await ApiClient.to.getShortReels(
      onSuccess: (res) {
        for(var element in res.body["data"]){
          ReelModel post = ReelModel.fromJson(element);
          reels.add(post);
        }
      },
      onError: (res) {
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: res.body["message"],
        );
      },
    );
  }

  getCurrentLocation() async {
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
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      customSnackBar(
        type: AnimatedSnackBarType.error,
        message: 'Location services are disabled.',
      );
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: 'Location permissions are denied.',
        );
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      customSnackBar(
        type: AnimatedSnackBarType.error,
        message: 'Location permissions are permanently denied, we cannot request permissions.',
      );
      return;
    }
    UserStore.to.setUserLocation(
      await convertCoordinatesToAddress(
          await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.high,
          ),
        )
      )
    );
    pinCodeList.clear();
    pinCode.clear();
    selectedUserLocation.value = PincodeModel();
    Get.back();
    Get.back();
  }

  Future<UserLocationModel> convertCoordinatesToAddress(position) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isNotEmpty) {
      Placemark place = placemarks.first;

      return UserLocationModel(
        name: place.street ?? place.name ?? '',
        district: place.subAdministrativeArea ?? place.locality ?? '',
        state: place.administrativeArea ?? '',
        pincode: int.tryParse(place.postalCode ?? '') ?? 0,
      );
    } else {
      customSnackBar(
        type: AnimatedSnackBarType.error,
        message: 'No address found for these coordinates.',
      );
      throw Exception("No address found for these coordinates.");
    }
  }

  void _setupSocket() {
    Get.find<BottomNavController>().getUnseenChat();
    _socket.connect();
    _conversationUpdatedListener = _socket.onConversationUpdated((data) {
      Get.find<BottomNavController>().getUnseenChat();
    });
    _conversationSeenListener = _socket.onConversationSeen((data) {
      Get.find<BottomNavController>().getUnseenChat();
    });
  }

  @override
  void onClose() {
    _socket.disconnect();
    if (_conversationUpdatedListener != null) {
      _socket.offConversationUpdated(_conversationUpdatedListener);
    }
    if (_conversationSeenListener != null) {
      _socket.offConversationSeen(_conversationSeenListener);
    }
    super.onClose();
  }

}
