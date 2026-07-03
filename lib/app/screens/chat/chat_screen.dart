import 'package:cars_and_alll/app/controller/home_nav_controller.dart';
import 'package:cars_and_alll/app/routes/app_routes.dart';
import 'package:cars_and_alll/app/services/user.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:cars_and_alll/shared/theme/custom_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../models/unseen_chat_model.dart';
import '../../utils/scale_utility.dart';
import 'controller/chatController.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            /// -- profile header
            Container(
              width: double.infinity,
              child: Padding(
                padding: scale.getPadding(left: 10, right: 10, bottom: 10),
                child: Column(
                  children: [
                    Text(
                      tr('chat'),
                      style: CustomTextStyle.txtPoppins16Black500.copyWith(
                        fontSize: scale.getScaledFont(20),
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryLight,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: TabBar(
                         controller: controller.tabController,
                        labelColor: Colors.orange,
                        unselectedLabelColor: Colors.grey,
                        indicatorColor: Colors.transparent,
                        padding: scale.getPadding(
                          top: 5,
                        ),
                        dividerColor: Colors.black12,
                        tabs: [
                          Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.person_outline_rounded, size: 24,),
                                Text(tr("buying"), style: TextStyle(fontWeight: FontWeight.bold, fontSize: scale.getScaledFont(16)),),
                                Icon(Icons.keyboard_arrow_right, size: 22, color: Colors.grey,),
                              ],
                            ),
                          ),
                          Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                  'assets/images/shop_icon.png',
                                  height: 20,
                                ),
                                Text(
                                  tr("selling"),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: scale.getScaledFont(16),
                                  ),
                                ),
                                Icon(Icons.keyboard_arrow_right, size: 22, color: Colors.grey,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SmartRefresher(
                        enablePullDown: true,
                        enablePullUp: false,
                        header: WaterDropMaterialHeader(
                          backgroundColor: AppColors.secondaryLight,
                          distance: 30,
                        ),
                        controller: controller.refreshController,
                        onRefresh: controller.onRefresh,
                        child: TabBarView(
                          controller: controller.tabController,
                          children: [
                            Container(
                              margin: scale.getMargin(
                                bottom: 20,
                              ),
                              child: SingleChildScrollView(
                                child: Obx(
                                  () {
                                    return Column(
                                      children: [
                                        ListView.separated(
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemCount: controller.buyerChat.length,
                                          itemBuilder: (context, index){
                                            return ListTile(
                                              onTap: () {
                                                Get.toNamed(AppRoutes.buyersChatSpace, arguments: {"conversationId" : controller.buyerChat[index].id});
                                              },
                                              title: Text(
                                                '${controller.buyerChat[index].seller!.userName}',
                                                style: CustomTextStyle.txtPoppins12Black500,
                                              ),
                                              subtitle: Text(
                                                '${controller.buyerChat[index].vehicle!.filters!.brand} ${controller.buyerChat[index].vehicle!.filters!.model}',
                                                style: CustomTextStyle.txtPoppins12Black500,
                                              ),
                                              trailing: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.end, // Aligns items to the right side
                                                children: [
                                                  Text(
                                                    DateTime(
                                                        controller.buyerChat[index].messages!.last.createdAt!.year,
                                                        controller.buyerChat[index].messages!.last.createdAt!.month,
                                                        controller.buyerChat[index].messages!.last.createdAt!.day
                                                    ).isAtSameMomentAs(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day))
                                                        ? DateFormat("hh:mm a").format(controller.buyerChat[index].messages!.last.createdAt!)
                                                        : DateFormat("dd MMM yy").format(controller.buyerChat[index].messages!.last.createdAt!),
                                                    style: CustomTextStyle.txtPoppins12Black500,
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Obx(() {
                                                    var navController = Get.find<BottomNavController>();
                                                    List<ChatRoom> buyerChat = navController.unseenChat.value.data!.where((e) => e.buyerId!.id == controller.buyerChat[index].buyer!.id).toList();

                                                    int totalUnseen = buyerChat.fold(0, (sum, room) {
                                                      int unseenInRoom = room.messages?.where((m) => m.senderId?.id != UserStore.to.uid.value).length ?? 0;
                                                      return sum + unseenInRoom;
                                                    });
                                                    return totalUnseen > 0 ? Container(
                                                      padding: const EdgeInsets.all(6),
                                                      decoration: const BoxDecoration(
                                                        color: Colors.red,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Text(
                                                        '$totalUnseen',
                                                        style: const TextStyle(color: Colors.white, fontSize: 10),
                                                      ),
                                                    ) : const SizedBox.shrink();
                                                  }),
                                                ],
                                              ),
                                              leading: CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                  controller.buyerChat[index].seller!.userProfileImage![0],
                                                ),
                                              ),
                                            );
                                          }, separatorBuilder: (BuildContext context, int index) {
                                            return Container(
                                              margin: scale.getMargin(
                                                horizontal: 20,
                                              ),
                                              child: Divider(
                                                color: Color(0xffF2F4F7),
                                              ),
                                            );
                                        },
                                        )
                                      ],
                                    );
                                  }
                                ),
                              ),
                            ),
                            Container(
                              margin: scale.getMargin(
                                bottom: 20,
                              ),
                              child: SingleChildScrollView(
                                child: Obx(
                                  () {
                                    return Column(
                                      children: [
                                        ListView.separated(
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemCount: controller.sellerChat.value.length,
                                          itemBuilder: (context, index){
                                            return ListTile(
                                              onTap: () {
                                                Get.toNamed(AppRoutes.sellersChatSpace, arguments: {"conversationId" : controller.sellerChat[index].id});
                                              },
                                              title: Text(
                                                '${controller.sellerChat[index].buyer!.userName}',
                                                style: CustomTextStyle.txtPoppins12Black500,
                                              ),
                                              subtitle: Text(
                                                '${controller.sellerChat[index].vehicle!.filters!.brand} ${controller.sellerChat[index].vehicle!.filters!.model}',
                                                style: CustomTextStyle.txtPoppins12Black500,
                                              ),
                                              trailing: Column(
                                                children: [
                                                  Text(
                                                    DateTime(controller.sellerChat[index].messages!.last.createdAt!.year, controller.sellerChat[index].messages!.last.createdAt!.month, controller.sellerChat[index].messages!.last.createdAt!.day).isAtSameMomentAs(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)) ? DateFormat("hh:mm a").format(controller.sellerChat[index].messages!.last.createdAt!) : DateFormat("dd MMM yy").format(controller.sellerChat[index].messages!.last.createdAt!),
                                                    style: CustomTextStyle.txtPoppins12Black500,
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Obx(() {
                                                    var navController = Get.find<BottomNavController>();
                                                    List<ChatRoom> buyerChat = navController.unseenChat.value.data!.where((e) => e.sellerId!.id == controller.sellerChat[index].seller!.id).toList();

                                                    int totalUnseen = buyerChat.fold(0, (sum, room) {
                                                      int unseenInRoom = room.messages?.where((m) => m.senderId?.id != UserStore.to.uid.value).length ?? 0;
                                                      return sum + unseenInRoom;
                                                    });
                                                    return totalUnseen > 0 ? Container(
                                                      padding: const EdgeInsets.all(6),
                                                      decoration: const BoxDecoration(
                                                        color: Colors.red,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Text(
                                                        '$totalUnseen',
                                                        style: const TextStyle(color: Colors.white, fontSize: 10),
                                                      ),
                                                    ) : const SizedBox.shrink();
                                                  }),
                                                ],
                                              ),
                                              leading: CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                  controller.sellerChat[index].buyer!.userProfileImage![0],
                                                ),
                                              ),
                                            );
                                          }, separatorBuilder: (BuildContext context, int index) {
                                          return Container(
                                            margin: scale.getMargin(
                                              horizontal: 20,
                                            ),
                                            child: Divider(
                                              color: Color(0xffF2F4F7),
                                            ),
                                          );
                                        },
                                        )
                                      ],
                                    );
                                  }
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
