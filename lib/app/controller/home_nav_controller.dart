
import 'dart:developer';

import 'package:get/get.dart';
import 'package:super_tooltip/super_tooltip.dart';

import '../data/api/api_client.dart';
import '../models/unseen_chat_model.dart';

class BottomNavController extends GetxController {
  RxInt index = 0.obs;

  SuperTooltipController superTooltipController = SuperTooltipController();

  Rx<UnseenChatModel> unseenChat = UnseenChatModel().obs;

  void updateIndex(int index){
    this.index.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getUnseenChat() async {
    await ApiClient.to.getUnseen(
      onSuccess: (res) {
        unseenChat.value = UnseenChatModel.fromJson(res.body);
      },
      onError: (res) {
        log(res.toString());
      },
    );
  }
}
