import 'dart:developer';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cars_and_alll/app/data/api/api_client.dart';
import 'package:cars_and_alll/app/models/conversationModel.dart';
import 'package:cars_and_alll/app/services/user.dart';
import 'package:cars_and_alll/app/utils/customSnackBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/api/socket_client.dart';
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


  // Read-receipt tracking, kept up to date by the `conversationSeen` socket
  // event (populated from topBar.value on initial fetch too).

  Rxn<DateTime> lastSeenByBuyer = Rxn<DateTime>();
  Rxn<DateTime> lastSeenBySeller = Rxn<DateTime>();

  final SocketService _socket = SocketService.instance;
  SocketListener? _newMessageListener;
  SocketListener? _conversationSeenListener;
  bool _joinedRoom = false;


  @override
  void onInit() {
    super.onInit();
    conversationId = Get.arguments["conversationId"]?? "";
    _setupSocket();
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

  void _setupSocket() {
    if (conversationId.isEmpty) return;

    _socket.connect();
    _socket.joinConversation(conversationId);
    _joinedRoom = true;

    _newMessageListener = _socket.onNewMessage((data) {
      final latestRaw = data['latestMessage'];
      if (latestRaw == null) return;
      log(data.toString());
      final incoming = ConversationModel.fromJson(latestRaw);

      messages.insert(0, incoming);

      final rest = data['restObject'];
      if (rest != null) {
        if (rest['autoFollowUp'] != null) {
          autoFollowUp.value = rest['autoFollowUp'] as bool;
        }
        if (rest['lastSeenByBuyer'] != null) {
          lastSeenByBuyer.value = DateTime.tryParse(rest['lastSeenByBuyer']);
        }
        if (rest['lastSeenBySeller'] != null) {
          lastSeenBySeller.value = DateTime.tryParse(rest['lastSeenBySeller']);
        }
      }

      // Notify only when the incoming message is from the other party.
      final isFromOtherUser = incoming.sender?.id != UserStore.to.uid.value;
      if (isFromOtherUser) {
        customSnackBar(
          type: AnimatedSnackBarType.success,
          message: "New message from ${otherUser.value.userName ?? 'user'}",
        );
      }
    });

    _conversationSeenListener = _socket.onConversationSeen((data) {
      if (data['conversationId'] != conversationId) return;
      if (data['lastSeenByBuyer'] != null) {
        lastSeenByBuyer.value = DateTime.tryParse(data['lastSeenByBuyer']);
      }
      if (data['lastSeenBySeller'] != null) {
        lastSeenBySeller.value = DateTime.tryParse(data['lastSeenBySeller']);
      }
    });
  }

  @override
  void onClose() {
    if (_newMessageListener != null) {
      _socket.offNewMessage(_newMessageListener);
    }
    if (_conversationSeenListener != null) {
      _socket.offConversationSeen(_conversationSeenListener);
    }
    if (_joinedRoom && conversationId.isNotEmpty) {
      _socket.leaveConversation(conversationId);
    }
    message.dispose();
    super.onClose();
  }
}