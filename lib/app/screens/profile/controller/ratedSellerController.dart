import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cars_and_alll/app/data/api/api_client.dart';
import 'package:cars_and_alll/app/models/submittedRatingModel.dart';
import 'package:get/get.dart';

import '../../../utils/customSnackBar.dart';

class RatedSellerController extends GetxController{

  RxBool isLoading = true.obs;
  RxList<SubmittedRatedModel> submittedRating = <SubmittedRatedModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getRatingBySeller();
  }

  getRatingBySeller() {
    isLoading.value = true;
    ApiClient.to.getAllSubmittedRatingByUser(
      onSuccess: (res){
        for(var rating in res.body["data"]){
          SubmittedRatedModel submittedRatingModel = SubmittedRatedModel.fromJson(rating);
          submittedRating.add(submittedRatingModel);
        }
        isLoading.value = false;
      },
      onError: (res){
        isLoading.value = false;
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: res.body["message"],
        );
      },
    );
  }

}