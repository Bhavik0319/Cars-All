import 'dart:convert';
import 'package:cars_and_alll/app/models/userLocation_model.dart';
import 'package:cars_and_alll/app/routes/app_routes.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';
import 'storage.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  final _isLogin = false.obs;
  RxList<String> vehicles = <String>[].obs;
  RxString uid = ''.obs;
  RxBool autoFollowUp = false.obs;

  String userIdKey = 'userIdKey';
  String followUpKey = 'followUpKey';
  String vehicleListKey = 'vehicleListKey';
  String userLocationKey = 'userLocationKey';
  String userBearerToken = 'UserBearerToken';

  final user = UserModel().obs;
  Rx<UserLocationModel> userLocation = UserLocationModel().obs;

  bool get isLogin => _isLogin.value;

  UserModel get profile => user.value;

  bool get hasToken => uid.isNotEmpty;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getProfile();
    await getVehicleViews();
    getFollowUp();
    getUserLocation();
  }

  Future<void> getProfile() async {
    user.value = UserModel.fromJson(jsonDecode(StorageService.to.getString(userIdKey)));
    uid.value = user.value.id!;
  }
  Future<void> getVehicleViews() async {
    vehicles.value = StorageService.to.getList(vehicleListKey);
  }

  Future<void> saveProfile(Map<String, dynamic> profile) async {
    StorageService.to.setString(userIdKey, jsonEncode(profile));
    getProfile();
  }

  Future<void> onLogout() async {
    await StorageService.to.remove(userIdKey);
    await StorageService.to.remove(followUpKey);
    await StorageService.to.remove(vehicleListKey);
    _isLogin.value = false;
    uid.value = '';
    Get.offAllNamed(AppRoutes.loginWithPhone);
  }

  Future<void> setFollowUp(value) async {
    StorageService.to.setBool(followUpKey, value);
    autoFollowUp.value = value;
  }

  Future<void> getFollowUp() async {
    autoFollowUp.value = StorageService.to.getBool(followUpKey);
  }


  Future<void> addVehicleView(String vehicleId) async {
    if(!vehicles.any((element) => element == vehicleId)){
      vehicles.add(vehicleId);
      StorageService.to.setList(vehicleListKey, vehicles.value);
    }
  }

  Future<void> setUserLocation(UserLocationModel userLocationModel) async {
    userLocation.value = userLocationModel;
    StorageService.to.setString(userLocationKey, jsonEncode(userLocationModel.toJson()));
  }

  void getUserLocation() {
    if(StorageService.to.getString(userLocationKey) != "") {
      userLocation.value = UserLocationModel.fromJson(jsonDecode(StorageService.to.getString(userLocationKey)));
      print("Printing location==== ${userLocation.value}");
    }
  }

  getToken() {
    return StorageService.to.getString(userBearerToken);
  }

  Future<void> setToken(String token) async {
    await StorageService.to.setString(userBearerToken, token);
  }

}
