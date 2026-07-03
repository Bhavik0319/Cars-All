import 'package:cars_and_alll/app/controller/auth_controller.dart';
import 'package:cars_and_alll/app/controller/home_nav_controller.dart';
import 'package:cars_and_alll/app/controller/user_controller.dart';
import 'package:cars_and_alll/app/data/api/api_client.dart';
import 'package:cars_and_alll/app/interfaces/auth_interface.dart';
import 'package:cars_and_alll/app/repository/auth_repo.dart';
import 'package:cars_and_alll/app/repository/user_repo.dart';
import 'package:cars_and_alll/app/screens/cibil/controller/cibilController.dart';
import 'package:cars_and_alll/app/screens/filter/controller/filterController.dart';
import 'package:cars_and_alll/app/screens/home/controllers/home_controller.dart';
import 'package:cars_and_alll/app/screens/home/controllers/serviceController.dart';
import 'package:cars_and_alll/app/screens/insurance/controller/insuranceFormController.dart';
import 'package:cars_and_alll/app/screens/payment/controller/paymentController.dart';
import 'package:cars_and_alll/app/screens/search/controller/search_controller.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../interfaces/user_interface.dart';
import '../screens/car_details/controller/carDetailController.dart';
import '../screens/car_details/controller/emiController.dart';
import '../screens/financialAssistance/controller/financialAssistController.dart';
import '../screens/home/controllers/category_controller.dart';
import '../utils/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {


  Get.put(BottomNavController());

  /// Network Connectivity Services
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton(() => NetworkInfo(sl()));

  ///Provider Controller
  Get.lazyPut(() => AuthController());
  Get.lazyPut(() => UserController());
  Get.lazyPut(() => HomeController());
  Get.lazyPut(() => ServiceController());
  Get.lazyPut(() => CategoryController());
  Get.lazyPut(() => SearchController());
  Get.lazyPut(() => CarDetailController());
  // Get.lazyPut(() => FilterController(), fenix: true);
  Get.lazyPut(() => EmiController());
  Get.lazyPut(() => PaymentController());
  Get.lazyPut(() => InsuranceFormController());
  Get.lazyPut(() => FinancialAssistController());
  Get.lazyPut(() => CibilController());

}