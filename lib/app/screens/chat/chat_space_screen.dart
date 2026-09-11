import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cars_and_alll/app/models/conversationModel.dart';
import 'package:cars_and_alll/app/routes/app_routes.dart';
import 'package:cars_and_alll/app/screens/chat/chatSpace/controller/chatSpaceController.dart';
import 'package:cars_and_alll/app/services/user.dart';
import 'package:cars_and_alll/app/utils/customImageView.dart';
import 'package:cars_and_alll/app/utils/numberFormat.dart';
import 'package:cars_and_alll/app/utils/scale_utility.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:cars_and_alll/shared/theme/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/home_nav_controller.dart';
import '../../utils/customSnackBar.dart';
import '../../widgets/decoratedContainer.dart';

class ChatSpaceScreen extends GetView<ChatSpaceController> {
  const ChatSpaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      body: SafeArea(
        child: Obx(
          () {
            return Column(
              children: [
                Container(
                  color: AppColors.primaryLight,
                  padding: const EdgeInsets.only(left: 12, right: 10, bottom: 10),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await Get.find<BottomNavController>().getUnseenChat();
                          Get.back();
                        },
                        child: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      const SizedBox(width: 10),
                      if(!controller.isLoading.value)
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(AppRoutes.chatUserProfile);
                          },
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              controller.otherUser.value.userProfileImage!.first,
                            ),
                            radius: 20,
                          ),
                        ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.isLoading.value ? "" : "${controller.otherUser.value.userName}",
                              style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                color: Colors.white,
                                fontSize: scale.getScaledFont(14),
                              ),
                            ),
                            Text(
                              controller.isLoading.value ? "" : '${controller.topBar.value.vehicle!.filters!.brand} ${controller.topBar.value.vehicle!.filters!.model} \n ${formatWithCommas(controller.topBar.value.vehicle!.askingPrice)}',
                              style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                color: Colors.white,
                                fontSize: scale.getScaledFont(12),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: scale.getScaledHeight(5),
                            ),
                            !controller.isLoading.value ? controller.topBar.value.buyer!.id != UserStore.to.uid.value ?  Row(
                              children: [
                                Text(
                                  "Auto Follow Up",
                                  style: CustomTextStyle.txtPoppins12Black500.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: scale.getScaledFont(11),
                                  ),
                                ),
                                SizedBox(
                                  width: scale.getScaledWidth(5),
                                ),
                                SizedBox(
                                  height: scale.getScaledHeight(10),
                                  child: Obx(
                                    () {
                                      return Transform.scale(
                                        scale: 0.8, // Adjust this value (e.g., 0.7 or 0.8) to make it smaller
                                        child: Switch(
                                          padding: EdgeInsets.zero,
                                          value: controller.autoFollowUp.value,
                                          activeColor: AppColors.primaryLight,
                                          inactiveThumbColor: AppColors.white,
                                          activeTrackColor: Colors.white,
                                          inactiveTrackColor: Colors.transparent,
                                          onChanged: (val) {
                                            controller.autoFollowUp.value = val;
                                          },
                                          trackOutlineColor: WidgetStateProperty.all(const Color(0xffB4B4B4)),
                                        ),
                                      );
                                    }
                                  ),
                                )
                              ],
                            ) : Container() : Container(),
                          ],
                        ),
                      ),
                      GestureDetector(onTap: () async {
                        if(controller.otherUser.value.isPhoneShare?? false){
                          final Uri uri = Uri.parse('tel:+91${controller.otherUser.value.userPhone}');
                          try {
                            await launchUrl(uri);
                          } catch (e){
                            customSnackBar(
                                type: AnimatedSnackBarType.error,
                                message: "Could not make a call to ${controller.otherUser.value.userPhone}"
                            );
                          }
                        } else {
                          customSnackBar(
                              type: AnimatedSnackBarType.error,
                              message: "User has disabled phone number sharing."
                          );
                        }

                        // Get.toNamed(AppRoutes.callUser);
                      },child: const Icon(Icons.call, color: Colors.white)),
                    ],
                  ),
                ),
                // Chat body
                Expanded(
                  child: Container(
                    color: AppColors.backgroundColor,
                    child: controller.isLoading.value ? const Center(child: CircularProgressIndicator()) : Obx(
                      () {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.messages.value.length,
                          reverse: true,
                          padding: scale.getPadding(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          itemBuilder: (context, index){
                            return UserStore.to.uid.value == controller.messages[index].sender!.id ? SenderMessage(
                              conversationModel: controller.messages[index],
                              scale: scale,
                            ) : ReceiverMessage(
                              conversationModel: controller.messages[index],
                              scale: scale,
                            );
                          },
                        );
                      }
                    ),
                  ),
                ),
                
                Obx(
                  () {
                    return controller.showSold.value ? DecoratedContainer(
                      width: double.maxFinite,
                      borderRadius: 0,
                      borderColor: Colors.transparent,
                      child: Text(
                        "Vehicle has been sold",
                        textAlign: TextAlign.center,
                        style: CustomTextStyle.txtPoppins12Black500.copyWith(
                          fontSize: scale.getScaledFont(13),
                        ),
                      ),
                    ) : Container();
                  }
                ),
                // Quick Replies
                Obx(
                  () {
                    return controller.quickReply.value && !controller.showSold.value ? Container(
                      width: double.infinity,
                      color: AppColors.backgroundColor,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Quick replies",
                                style: CustomTextStyle.txtPoppins14Black700.copyWith(
                                  fontSize: scale.getScaledFont(14),
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.hideQuickReply();
                                },
                                child: Icon(
                                  Icons.close,
                                  color: AppColors.black,
                                  size: scale.getScaledFont(20),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: scale.getScaledHeight(5),
                          ),
                          Wrap(
                            runSpacing: 8,
                            children: [
                              _quickReplyButton("Is it still available?"),
                              _quickReplyButton("What is the lowest price?"),
                              _quickReplyButton("Can I schedule a test drive?"),
                              _quickReplyButton("Any major repair done?"),
                              _quickReplyButton("How many owners?"),
                            ],
                          ),
                        ],
                      ),
                    ) : Container();
                  }
                ),

                // Message input
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller.message,
                          enabled: !controller.showSold.value,
                          style: CustomTextStyle.txtPoppins14Black700.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            hintText: "Type your message",
                            hintStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 10,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                color: Colors.yellow.shade600,
                                width: 1.5,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                color: Colors.yellow.shade600,
                                width: 1.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                color: Colors.yellow.shade800,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      GestureDetector(
                        onTap: () {
                          controller.sendMessage(controller.message.text);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 22,
                          child: const Icon(Icons.send, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }


  Widget _quickReplyButton(String text) {
    return GestureDetector(
      onTap: () {
        controller.sendMessage(text);
      },
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

class SenderMessage extends StatelessWidget {
  final ConversationModel conversationModel;
  final ScalingUtility scale;

  const SenderMessage({required this.conversationModel, required this.scale, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            constraints: BoxConstraints(
              minWidth: 0,
              maxWidth: 260,
            ),
            padding: conversationModel.messageType == "IMAGE" ? EdgeInsets.only(
              bottom: 10,
            ) : const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(vertical: 7),
            decoration: BoxDecoration(
              color: conversationModel.messageType == "IMAGE" ? AppColors.white : AppColors.primaryLight,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                conversationModel.messageType == "IMAGE" ? Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                        path: Get.find<ChatSpaceController>().topBar.value.vehicle!.images!.first,
                      ),
                      SizedBox(
                        height: scale.getScaledHeight(5),
                      ),
                      Text(
                        '   ${Get.find<ChatSpaceController>().topBar.value.vehicle!.filters!.brand} ${Get.find<ChatSpaceController>().topBar.value.vehicle!.filters!.model}',
                        textAlign: TextAlign.start,
                        style: CustomTextStyle.txtPoppins14Black700.copyWith(
                          color: AppColors.black,
                          fontSize: scale.getScaledFont(14),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '   ${DateTime(conversationModel.createdAt!.year, conversationModel.createdAt!.month, conversationModel.createdAt!.day).isAtSameMomentAs(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)) ? DateFormat("hh:mm a").format(conversationModel.createdAt!) : DateFormat("dd MMM yy").format(conversationModel.createdAt!)}',
                        style: CustomTextStyle.txtPoppins14Black700.copyWith(
                          color: AppColors.black828282,
                          fontSize: scale.getScaledFont(12),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ) : Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      conversationModel.text ?? "",
                      textAlign: TextAlign.start,
                      style: CustomTextStyle.txtPoppins14Black700.copyWith(
                        color: AppColors.white,
                        fontSize: scale.getScaledFont(14),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      DateTime(conversationModel.createdAt!.year, conversationModel.createdAt!.month, conversationModel.createdAt!.day).isAtSameMomentAs(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)) ? DateFormat("hh:mm a").format(conversationModel.createdAt!) : DateFormat("dd MMM yy").format(conversationModel.createdAt!),
                      style: CustomTextStyle.txtPoppins14Black700.copyWith(
                        color: Colors.white54,
                        fontSize: scale.getScaledFont(12),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}

class ReceiverMessage extends StatelessWidget {
  final ConversationModel conversationModel;
  final ScalingUtility scale;

  const ReceiverMessage({required this.conversationModel, required this.scale, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            constraints: BoxConstraints(
              minWidth: 0,
              maxWidth: 260,
            ),
            padding: conversationModel.messageType == "IMAGE" ? EdgeInsets.only(
              bottom: 10,
            ) : const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(vertical: 7),
            decoration: BoxDecoration(
              color: conversationModel.messageType == "IMAGE" ? AppColors.white : AppColors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                conversationModel.messageType == "IMAGE" ? Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                        path: Get.find<ChatSpaceController>().topBar.value.vehicle!.images!.first,
                      ),
                      SizedBox(
                        height: scale.getScaledHeight(5),
                      ),
                      Text(
                        '   ${Get.find<ChatSpaceController>().topBar.value.vehicle!.filters!.brand} ${Get.find<ChatSpaceController>().topBar.value.vehicle!.filters!.model}',
                        textAlign: TextAlign.start,
                        style: CustomTextStyle.txtPoppins14Black700.copyWith(
                          color: AppColors.black,
                          fontSize: scale.getScaledFont(14),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '   ${DateTime(conversationModel.createdAt!.year, conversationModel.createdAt!.month, conversationModel.createdAt!.day).isAtSameMomentAs(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)) ? DateFormat("hh:mm a").format(conversationModel.createdAt!) : DateFormat("dd MMM yy").format(conversationModel.createdAt!)}',
                        style: CustomTextStyle.txtPoppins14Black700.copyWith(
                          color: AppColors.black828282,
                          fontSize: scale.getScaledFont(12),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ) : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      conversationModel.text ?? "",
                      textAlign: TextAlign.start,
                      style: CustomTextStyle.txtPoppins14Black700.copyWith(
                        color: AppColors.black,
                        fontSize: scale.getScaledFont(14),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      DateTime(conversationModel.createdAt!.year, conversationModel.createdAt!.month, conversationModel.createdAt!.day).isAtSameMomentAs(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)) ? DateFormat("hh:mm a").format(conversationModel.createdAt!) : DateFormat("dd MMM yy").format(conversationModel.createdAt!),
                      style: CustomTextStyle.txtPoppins14Black700.copyWith(
                        color: AppColors.black828282,
                        fontSize: scale.getScaledFont(12),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),

      ],
    );
  }
}




