
import 'package:cars_and_alll/app/interfaces/user_interface.dart';
import 'package:cars_and_alll/app/utils/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../models/user_model.dart';

class UserController extends GetxController {

  late String uid;
  late String token;
  UserModel userProfile = UserModel();
  final Logger _logger = Logger('UserService');

  UserController() {
    getUser();
  }

  Future<void> getUser() async {
    _logger.log('No user present');
  }
}