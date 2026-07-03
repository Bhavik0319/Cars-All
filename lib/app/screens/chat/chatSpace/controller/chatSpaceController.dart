import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cars_and_alll/app/data/api/api_client.dart';
import 'package:cars_and_alll/app/models/conversationModel.dart';
import 'package:cars_and_alll/app/services/user.dart';
import 'package:cars_and_alll/app/utils/customSnackBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../models/buyerChatModel.dart';

class ChatSpaceController extends GetxController {

  String conversationId = "";
  RxBool isLoading = true.obs;
  RxBool quickReply = false.obs;

  TextEditingController message = TextEditingController();

  RxList<ConversationModel> messages = <ConversationModel>[].obs;
  Rx<InquiryModel> topBar = InquiryModel().obs;

  Rx<UserProfile> otherUser = UserProfile().obs;

  RxBool autoFollowUp = false.obs;

  @override
  void onInit() {
    super.onInit();
    conversationId = Get.arguments["conversationId"]?? "";
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    await getConversation();
  }

  getConversation(){
    messages.clear();
    ApiClient.to.getMessageByConversation(
      conversationId: conversationId,
      onSuccess: (res){
        for(var message in res.body["data"]){
          messages.add(ConversationModel.fromJson(message));
        }
        messages.sort((a, b) {
          final dateA = a.createdAt ?? DateTime(0);
          final dateB = b.createdAt ?? DateTime(0);
          return dateB.compareTo(dateA);
        });
        topBar.value = InquiryModel.fromJson(res.body["topbardata"]);
        autoFollowUp.value = topBar.value.autoFollowUp!;
        if(topBar.value.seller!.id == UserStore.to.uid.value){
          quickReply.value = false;
        } else {
          quickReply.value = true;
        }
        otherUser.value = (topBar.value.seller!.id == UserStore.to.uid.value ? topBar.value.buyer : topBar.value.seller)!;
        isLoading.value = false;
      },
      onError: (res){
        isLoading.value = false;
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: "Failed to fetch conversation: ${res.body}",
        );
      },
    );
  }

  void hideQuickReply() {
    quickReply.value = false;
  }

  sendMessage(String text) {
    if(text.isNotEmpty){
      ApiClient.to.sendMessage(
        body: {
          "conversationId": conversationId,
          "senderRole": topBar.value.seller!.id == UserStore.to.uid.value ? "SELLER" : "BUYER",
          "messageType": "TEXT",
          "text": text,
        },
        onSuccess: (res) {
          message.clear();
          messages.insert(0, ConversationModel.fromJson(res.body["data"]['latestMessage']));
          log("RECEIVING DATA" + res.body["data"].toString());
          log(messages.first.toString());
        },
        onError: (res) {
          customSnackBar(
            type: AnimatedSnackBarType.error,
            message: "Failed to send message: ${res.body}",
          );
        },
      );
    } else {
      customSnackBar(
        type: AnimatedSnackBarType.error,
        message: "Message cannot be empty",
      );
    }
  }
}