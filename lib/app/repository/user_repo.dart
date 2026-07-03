import 'package:cars_and_alll/app/data/api/api_client.dart';
import 'package:cars_and_alll/app/data/api/api_routes.dart';
import 'package:cars_and_alll/app/services/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/text_data.dart';
import '../interfaces/user_interface.dart';

class UserRepo implements UserInterface {

  @override
  removeUserSession() {
    StorageService.to.remove(ConstantData.userIdKey);
    StorageService.to.remove(ConstantData.userBearerToken);
  }

  @override
  getUserId() {
    return StorageService.to.getString(ConstantData.userIdKey)?? '';
  }

  @override
  getUserToken() {
    return StorageService.to.getString(ConstantData.userBearerToken)?? '';
  }
}