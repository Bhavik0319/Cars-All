import 'package:get/get.dart';

import '../screens/chat/chatSpace/controller/chatSpaceController.dart';
class ChatSpaceBinding implements Bindings{

  @override
  void dependencies() {
    if(!Get.isPrepared<ChatSpaceController>()) {
      Get.put(ChatSpaceController());
    }
  }

}