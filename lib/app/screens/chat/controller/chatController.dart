import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cars_and_alll/app/data/api/api_client.dart';
import 'package:cars_and_alll/app/models/sellerChatModel.dart';
import 'package:cars_and_alll/app/utils/customSnackBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../controller/home_nav_controller.dart';
import '../../../models/buyerChatModel.dart';

class ChatController extends GetxController with GetTickerProviderStateMixin {

  RxInt currentIndex = 0.obs;

  late TabController tabController;
  RefreshController refreshController = RefreshController(initialRefresh: true);


  RxList<SellerChatModel> sellerChat = <SellerChatModel>[].obs;
  RxList<BuyerChatModel> buyerChat = <BuyerChatModel>[].obs;

  RxBool isSellerChatLoading = true.obs;
  RxBool isBuyerChatLoading = true.obs;


  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      if (!tabController.indexIsChanging) {
        currentIndex.value = tabController.index;
        if(currentIndex.value == 1 && sellerChat.isEmpty){
          getSellerChat();
        }
      }
      Get.find<BottomNavController>().getUnseenChat();
    });
  }

  onRefresh() async{
    if(currentIndex.value == 0) {
      getBuyerChat();
    } else {
      getSellerChat();
    }
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  getSellerChat(){
    sellerChat.clear();
    isSellerChatLoading.value = true;
    ApiClient.to.getSellerChat(
      onSuccess: (res){
        for(var i in res.body["data"]){
          sellerChat.add(SellerChatModel.fromJson(i));
        }
        sellerChat.sort((a, b) {
          final dateA = a.messages!.last.createdAt ?? DateTime(0);
          final dateB = b.messages!.last.createdAt ?? DateTime(0);
          return dateB.compareTo(dateA);
        });

        isSellerChatLoading.value = false;
        refreshController.refreshCompleted();
      },
      onError: (res) {
        isSellerChatLoading.value = false;
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: 'Failed to fetch seller chat due to: ${res.body}',
        );
        refreshController.refreshFailed();
      },
    );
  }

  getBuyerChat(){
    buyerChat.clear();
    isBuyerChatLoading.value = true;
    ApiClient.to.getBuyerChat(
      onSuccess: (res){
        for(var i in res.body["data"]){
          buyerChat.add(BuyerChatModel.fromJson(i));
        }
        buyerChat.sort((a, b) {
          final dateA = a.messages!.last.createdAt ?? DateTime(0);
          final dateB = b.messages!.last.createdAt ?? DateTime(0);
          return dateB.compareTo(dateA);
        });
        isBuyerChatLoading.value = false;
        refreshController.refreshCompleted();
      },
      onError: (res) {
        isBuyerChatLoading.value = false;
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: 'Failed to fetch seller chat due to: ${res.body}',
        );
        refreshController.refreshFailed();
      },
    );
  }

}