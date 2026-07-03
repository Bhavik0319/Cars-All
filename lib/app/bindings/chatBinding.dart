import 'package:cars_and_alll/app/controller/auth_controller.dart';
import 'package:get/get.dart';

import '../screens/chat/controller/chatController.dart';

class ChatBinding implements Bindings{

  @override
  void dependencies() {
    if(!Get.isPrepared<ChatController>()) {
      Get.put(ChatController());
    }
  }

}