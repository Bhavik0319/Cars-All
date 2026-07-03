import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cars_and_alll/app/data/api/api_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../constants/assetConstant.dart';
import '../../../models/category_model.dart';
import '../../../utils/customSnackBar.dart';
import '../models/category_tile_model.dart';

class CategoryController extends GetxController{

  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxBool isLoading = true.obs;
  RxString selectedCategory = ''.obs;


  @override
  Future<void> onInit() async{
    await getAllCategories();
    isLoading.value = false;
    super.onInit();
  }


  updateSelectedCategory(String val) {
    selectedCategory.value = val;
  }

  Future<void> getAllCategories() async {
    await ApiClient.to.getAllCategory(
      onSuccess: (res) {
        for(var category in res.body['data']){
          allCategories.add(CategoryModel.fromJson(category));
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

}