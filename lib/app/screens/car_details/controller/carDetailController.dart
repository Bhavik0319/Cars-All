import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cars_and_alll/app/data/api/api_client.dart';
import 'package:cars_and_alll/app/models/review_model.dart';
import 'package:cars_and_alll/app/models/user_model.dart';
import 'package:cars_and_alll/app/models/vehicle_model.dart';
import 'package:cars_and_alll/app/screens/home/controllers/home_controller.dart';
import 'package:cars_and_alll/app/services/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/theme/custom_text_style.dart';
import '../../../models/RatingBySellerModel.dart';
import '../../../models/vehicle_detail_model.dart';
import '../../../routes/app_routes.dart';
import '../../../utils/customSnackBar.dart';
import '../../../widgets/view_profile_popup.dart';

class CarDetailController extends GetxController {

  ScrollController scroll = ScrollController();
  PageController pageController = PageController();

  RxInt currentTab = 0.obs;
  RxString offerSelection = 'Select your offer'.obs;
  String vehicleId = "";
  RxBool isLoading = true.obs;
  RxBool isFavorite = false.obs;
  Rx<VehicleDetailModel> vehicleDetail = VehicleDetailModel().obs;
  RxList<VehicleModel> findBestCars = <VehicleModel>[].obs;
  Rx<ReviewSummary> reviewSummary = ReviewSummary().obs;

  RxInt totalRating = 0.obs;
  RxDouble averageRating = 0.0.obs;

  RxList<dynamic> breakdownStar = <dynamic>[].obs;


  List<String> offerList = [
    'Select your offer',
    'Offer 1',
    'Offer 2',
    'Offer 3',
    'Offer 4',
  ];


  RxString currentImage = "".obs;



  void changeTabIndex(int index){
    currentTab.value = index;
  }

  void changeOfferChoice(String? value) {
    offerSelection.value = value!;
  }

  @override
  void onInit() {
    super.onInit();
    vehicleId = Get.parameters["vehicleId"]?? "";
    UserStore.to.addVehicleView(vehicleId);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    isLoading.value = true;
    await getVehicleDetails();
    await getReviewDetails();
    await getShortFilter();
    isLoading.value = false;
    addRecentView();
  }

  getVehicleDetails() async {
    await ApiClient.to.getVehicleDetails(
      id: vehicleId,
      onSuccess: (res) {
        print('Printing onSuccess');
        vehicleDetail.value = VehicleDetailModel.fromJson(res.body['data']);
        print('Print vehicle images: ${vehicleDetail.value}');
        currentImage.value = vehicleDetail.value.images!.first;
        isFavorite.value = Get.find<HomeController>().wishlistVehicle.any((element) => element.vehicle!.id == vehicleDetail.value.id);
        getReviewDetails();
      },
      onError: (res) {
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: res.body["message"],
        );
      },
    );
  }

  getReviewDetails() async {
    print('Print user id for vehicle seller: ${vehicleDetail.value.user?.id}');
    await ApiClient.to.getRating(
      body: {
        "sellerId": vehicleDetail.value.user?.id?? '',
      },
      onSuccess: (res) {
        reviewSummary.value = ReviewSummary.fromJson(res.body["data"]);
      },
      onError: (res) {
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: res.body["message"],
        );
      },
    );
  }

  addToFavorite() async {
    isFavorite.value = true;
    await ApiClient.to.addToFavorite(
      body: {
        "vehicleId": vehicleId
      },
      onSuccess: (res) {
        Get.find<HomeController>().getWishlist();
      },
      onError: (res) {
        if(res.body['message'].toString().startsWith("Invalid Authentication")){
          Get.toNamed(AppRoutes.loginWithPhone);
        }else {
          customSnackBar(
            type: AnimatedSnackBarType.error,
            message: res.body["message"],
          );
        }
      },
    );
  }

  removeFavorite() async {
    var wishlistId = Get.find<HomeController>().wishlistVehicle.firstWhere((element) => element.vehicle!.id == vehicleDetail.value.id).id;
    isFavorite.value = false;
    await ApiClient.to.removeToFavorite(
      body: {
        "wishlistId": wishlistId
      },
      onSuccess: (res) {
        Get.find<HomeController>().getWishlist();
      },
      onError: (res) {
        if(res.body['message'].toString().startsWith("Invalid Authentication")){
          Get.toNamed(AppRoutes.loginWithPhone);
        }else {
          customSnackBar(
            type: AnimatedSnackBarType.error,
            message: res.body["message"],
          );
        }
      },
    );
  }

  Future<void> getShortFilter() async {
    print('Print category: ${vehicleDetail.value.category}');
    findBestCars.clear();
    await ApiClient.to.getShortFilter(
      arg: {
        "category": vehicleDetail.value.category!
      },
      onSuccess: (res) {
        for(var element in res.body["data"]){
          VehicleModel vehicle = VehicleModel.fromJson(element);
          findBestCars.value.add(vehicle);
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

  Future<void> addRecentView() async {
    await ApiClient.to.addRecentView(
      body: {
        "vehicleId": vehicleId
      },
      onSuccess: (res) {},
      onError: (res) {},
    );
  }

  void changeCurrentImage(String s) {
    currentImage.value = s;
  }

  getRating() {
    ApiClient.to.getAllRatingBySeller(
        onSuccess: (res) {
          totalRating.value = res.body["data"]["totalRatings"];
          averageRating.value = double.tryParse('${res.body["data"]["averageRating"]}')!;
          breakdownStar.value = res.body["data"]["breakdownStar"];
          Get.back();
          showDialog(
            context: Get.context!,
            builder: (BuildContext context) {
              return ViewProfilePopup(
                reviewSummary: reviewSummary.value,
                user: vehicleDetail.value.user!,
                averageRating: averageRating.value,
                totalRating: totalRating.value,
                breakdownStar: breakdownStar.value,
                onChat: () {
                  if(UserStore.to.uid.value == ""){
                    Get.toNamed(AppRoutes.loginWithPhone);
                  } else {
                    generateConversation();
                  }
                },
              );
            },
          );
        },
        onError: (res) {
          Get.back();
          customSnackBar(
            type: AnimatedSnackBarType.error,
            message: 'Failed to fetch performance overview due to: ${res.body}',
          );
        }
    );
  }

  generateConversation() async {
    Get.dialog(
        barrierDismissible: false,
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 20),
            Text(
              "Creating Conversation",
              style: CustomTextStyle.txtPoppins14Black700.copyWith(
                fontSize: 20,
                color: Colors.white,
              ),
            )
          ],
        )
    );
    await ApiClient.to.createConversation(
      body: {
        "sellerId": vehicleDetail.value.user!.id,
        "vehicleId": vehicleId,
      },
      onSuccess: (res) {
        Get.back();
        Get.toNamed(AppRoutes.buyersChatSpace, arguments: {"conversationId": res.body["data"]["_id"]});
      },
      onError: (res) {
        Get.back();
        if(res.body['message'].toString().startsWith("Invalid Authentication")){
          Get.toNamed(AppRoutes.loginWithPhone);
        }else {
          customSnackBar(
            type: AnimatedSnackBarType.error,
            message: res.body["message"],
          );
        }
      },
    );
  }

}