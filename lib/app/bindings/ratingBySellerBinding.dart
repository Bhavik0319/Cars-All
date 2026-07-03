import 'package:get/get.dart';

import '../screens/profile/controller/ratingBySellerController.dart';

class RatingBySellerBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(RatingBySellerController());
  }

}