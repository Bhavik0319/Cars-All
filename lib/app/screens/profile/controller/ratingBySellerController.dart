import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:get/get.dart';

import '../../../data/api/api_client.dart';
import '../../../models/RatingBySellerModel.dart';
import '../../../utils/customSnackBar.dart';

class RatingBySellerController extends GetxController{

  RxInt totalRating = 0.obs;
  RxDouble averageRating = 0.0.obs;
  RxBool isLoading = true.obs;

  RxList<dynamic> breakdownStar = <dynamic>[].obs;
  RxList<RatingStatusModel> ratings = <RatingStatusModel>[].obs;



  @override
  void onInit() {
    super.onInit();
    getRatingBySeller();
  }

  getRatingBySeller(){
    ratings.clear();
    breakdownStar.clear();
    ApiClient.to.getAllRatingBySeller(
        onSuccess: (res) {
          totalRating.value = res.body["data"]["totalRatings"];
          averageRating.value = double.tryParse('${res.body["data"]["averageRating"]}')!;
          breakdownStar.value = res.body["data"]["breakdownStar"];
          log(breakdownStar.toString());
          for(var data in res.body["rdata"]){
            ratings.add(RatingStatusModel.fromJson(data));
          }
          isLoading.value = false;
        },
        onError: (res) {
          customSnackBar(
            type: AnimatedSnackBarType.error,
            message: 'Failed to fetch performance overview due to: ${res.body}',
          );
        }
    );
  }
}