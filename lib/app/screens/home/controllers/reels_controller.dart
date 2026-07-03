import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cars_and_alll/app/models/comment_model.dart';
import 'package:cars_and_alll/app/routes/app_routes.dart';
import 'package:cars_and_alll/app/services/user.dart';
import 'package:cars_and_alll/shared/theme/custom_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api/api_client.dart';
import '../../../models/reelsModel.dart';
import '../../../utils/customSnackBar.dart';

class ReelsController extends GetxController {

  RxBool isLoading = true.obs;
  RxBool isLoadingComments = false.obs;

  RxList<ReelModel> reels = <ReelModel>[].obs;
  RxList<CommentModel> comments = <CommentModel>[].obs;

  TextEditingController commentText = TextEditingController();


  @override
  Future<void> onInit() async {
    await getShorts();
    super.onInit();
  }


  Future<void> getShorts() async {
    log("message");
    await ApiClient.to.getShortReels(
      onSuccess: (res) {
        for(var element in res.body["data"]){
          ReelModel post = ReelModel.fromJson(element);
          reels.add(post);
        }
        log(reels.toString());
        isLoading.value = false;
      },
      onError: (res) {
        isLoading.value = false;
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: res.body["message"],
        );
      },
    );
  }

  toggleLikeVideo(index) async {
    if(reels[index].likedBy!.contains(UserStore.to.uid.value)){
      reels[index].likedBy!.remove(UserStore.to.uid.value);
    }else{
      reels[index].likedBy!.add(UserStore.to.uid.value);
    }
    reels.refresh();
    await ApiClient.to.toggleLikeButton(
      id: reels[index].id!,
      onSuccess: (res) {},
      onError: (res) {
        if(res.body['message'].toString().startsWith("Invalid Authentication")){
          Get.toNamed(AppRoutes.loginWithPhone);
        }else {
          customSnackBar(
            type: AnimatedSnackBarType.error,
            message: res.body["message"],
          );
        }
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: res.body['message'],
        );
      },
    );
  }

  addComment(index) async {
    await ApiClient.to.addComment(
      req: {
        "comment": commentText.text
      },
      id: reels[index].id!,
      onSuccess: (res) {
        comments.insert(0, CommentModel.fromJson(res.body["data"].first));
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
      }
    );
    commentText.clear();
  }

  getAllComments(index) async {
    isLoadingComments.value = true;
    comments.clear();
    await ApiClient.to.getAllComments(
      id: reels[index].id!,
      onSuccess: (res) {
        for(var element in res.body["data"]) {
          CommentModel comment = CommentModel.fromJson(element);
          comments.add(comment);
        }
        isLoadingComments.value = false;
      },
      onError: (res) {
        isLoadingComments.value = false;
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: res.body['message'],
        );
      },
    );
  }


  generateConversation(index) async {
    log("creating conversation----------------------------");
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
        "sellerId": reels[index].seller!.id,
        "vehicleId": reels[index].vehicle!.id,
      },
      onSuccess: (res) {
        Get.back();
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