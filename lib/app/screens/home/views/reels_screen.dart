import 'package:cars_and_alll/app/constants/assetConstant.dart';
import 'package:cars_and_alll/app/screens/home/controllers/reels_controller.dart';
import 'package:cars_and_alll/app/services/user.dart';
import 'package:cars_and_alll/app/utils/customImageView.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../shared/theme/custom_text_style.dart';
import '../../../utils/scale_utility.dart';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../widgets/textfield/custom_text_form_feild.dart';

class ReelsScreen extends GetView<ReelsController> {
  const ReelsScreen({super.key});

  Widget _actionButton(
        {IconData? icon,String? imageUrl, String? label, double size = 20, double btnSize = 30, Function? onTap}) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if(onTap != null) {
              onTap();
            }
          },
          child: Container(
            width: btnSize,
            height: btnSize,
            padding: imageUrl != null
                ? EdgeInsets.all(12)
                : null,
            child: icon != null
                ? Icon(icon, size: size, color: Colors.white)
                : Image.asset(
              imageUrl!,
            ),
          ),
        ),
        if (label != null)
          Text(
            label,
            style: const TextStyle(
                color: Colors.white70, fontSize: 12, height: 1.0),
          ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {

    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();
    // 📱 Get device dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        child: ClipRRect(
          child: SizedBox(
            width: screenWidth,
            height: screenHeight,
            child: Obx(
              () {
                return controller.isLoading.value ? Center(child: CircularProgressIndicator(
                  color: AppColors.secondaryLight,
                )) : controller.reels.value.isNotEmpty ? Stack(
                  children: [
                    PageView.builder(
                      itemCount: controller.reels.value.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index){
                        return Stack(
                          children: [
                            ReelVideoItem(
                              videoUrl: controller.reels[index].videoUrl!,
                            ),
                            Positioned(
                              bottom: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: scale.getPadding(
                                      top: 10,
                                      bottom: 20,
                                      right: 10,
                                      left: 10,
                                    ),
                                    margin: scale.getMargin(
                                      right: 20,
                                    ),
                                    width: scale.getScaledWidth(270),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          '${controller.reels[index].seller!.userName!} | ${controller.reels[index].vehicle!.location!.city!}',
                                          style: CustomTextStyle.txtPoppins16Black500.copyWith(
                                            color: AppColors.white,
                                            fontSize: scale.getScaledFont(16),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          controller.reels[index].caption!,
                                          style: CustomTextStyle.txtPoppins16Black500.copyWith(
                                            color: AppColors.white,
                                            fontSize: scale.getScaledFont(11),
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Column(
                                        children: [
                                          Obx(
                                            () {
                                              return _actionButton(
                                                  icon: !controller.reels[index].likedBy!.contains(UserStore.to.uid.value)
                                                    ? Icons.favorite_border
                                                    : Icons.favorite,
                                                btnSize: scale.getScaledFont(50),
                                                size: scale.getScaledFont(24),
                                                onTap: () {
                                                  controller.toggleLikeVideo(index);
                                                },
                                              );
                                            }
                                          ),
                                          Text(
                                            '${controller.reels[index].likedBy!.length}',
                                            style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: scale.getScaledFont(12),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: scale.getScaledHeight(5)),
                                      _actionButton(
                                        imageUrl: 'assets/images/chat_icon_reel.png',
                                        label: tr('comment'),
                                        btnSize: scale.getScaledFont(50),
                                        size: scale.getScaledFont(24),
                                        onTap: () {
                                          controller.getAllComments(index);
                                          Get.bottomSheet(
                                            Container(
                                              padding: scale.getPadding(
                                                horizontal: 15,
                                                vertical: 20,
                                              ),
                                              decoration: BoxDecoration(
                                                color: AppColors.backgroundColor,
                                                borderRadius: BorderRadiusGeometry.vertical(
                                                  top: Radius.circular(15),
                                                ),
                                              ),
                                              child: Obx(
                                                () {
                                                  return controller.isLoadingComments.value ? Center(
                                                    child: CircularProgressIndicator(
                                                      color: AppColors.secondaryLight,
                                                    ),
                                                  ) : Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Expanded(
                                                        child: ListView.builder(
                                                          shrinkWrap: true,
                                                          // reverse: true,
                                                          itemCount: controller.comments.value.length,
                                                          itemBuilder: (context, index){
                                                            return ListTile(
                                                              contentPadding: scale.getPadding(all: 6),
                                                              title: Text(
                                                                controller.comments[index].user!.userName!,
                                                                style: CustomTextStyle.txtPoppins14Black700.copyWith(
                                                                  fontSize: scale.getScaledFont(14),
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                              ),
                                                              subtitle: Text(
                                                                controller.comments[index].comment!,
                                                                style: CustomTextStyle.txtPoppins14Black700.copyWith(
                                                                  fontSize: scale.getScaledFont(12),
                                                                  fontWeight: FontWeight.w400,
                                                                ),
                                                              ),
                                                              leading: CircleAvatar(
                                                                radius: scale.getScaledFont(20),
                                                                backgroundImage: controller.comments[index].user!.profilePicture != ""
                                                                    ? NetworkImage(
                                                                  controller.comments[index].user!.profilePicture,
                                                                ) : AssetImage(
                                                                  AssetConstant.user,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: scale.getScaledHeight(15),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Expanded(
                                                            child: CustomTextFormField(
                                                              fillColor: Colors.transparent,
                                                              labelText: "",
                                                              controller: controller.commentText,
                                                              hintText: tr('add_comment'),
                                                              textStyle: CustomTextStyle.txtPoppins14Black700.copyWith(
                                                                fontWeight: FontWeight.w400,
                                                                fontSize: scale.getScaledFont(14),
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(width: 6),
                                                          GestureDetector(
                                                            onTap: () {
                                                              if(controller.commentText.text.isNotEmpty) {
                                                                controller.addComment(index);
                                                              }
                                                            },
                                                            child: CircleAvatar(
                                                              backgroundColor: Colors.blue,
                                                              radius: 22,
                                                              child: const Icon(
                                                                Icons.send,
                                                                color: Colors.white,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  );
                                                }
                                              ),
                                            ),
                                            backgroundColor: Colors.transparent,
                                            elevation: 0,
                                            enableDrag: true,
                                            isScrollControlled: false,
                                            isDismissible: false,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadiusGeometry.vertical(
                                                top: Radius.circular(6),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      SizedBox(height: scale.getScaledHeight(10)),
                                      _actionButton(
                                        imageUrl: 'assets/images/message_icon_reel.png',
                                        label: tr('chat'),
                                        btnSize: scale.getScaledFont(50),
                                        size: scale.getScaledFont(24),
                                        onTap: () {
                                          controller.generateConversation(index);
                                        },
                                      ),
                                      SizedBox(height: scale.getScaledHeight(10)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    Positioned(
                      top: 8,
                      left: 0,
                      right: 0,
                      child: SafeArea(
                        child: Padding(
                          padding: scale.getPadding(
                              horizontal: 8.0, vertical: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(Icons.arrow_back_ios,
                                    color: Colors.white, size: scale.getScaledFont(20)),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    tr('your_reels'),
                                    style: CustomTextStyle.txtPoppins18Black500.copyWith(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: scale.getScaledFont(18),
                                    )
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.camera_alt_outlined,
                                    color: Colors.white, size: scale.getScaledFont(22)),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ) : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      "assets/no_data.json",
                      width: 200,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                    Text(
                      tr('no_data_found'),
                      style: CustomTextStyle.txtPoppins14Black700,
                    )
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}


class ReelVideoItem extends StatefulWidget {
  final String videoUrl;
  const ReelVideoItem({super.key, required this.videoUrl});

  @override
  State<ReelVideoItem> createState() => _ReelVideoItemState();
}

class _ReelVideoItemState extends State<ReelVideoItem> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
          _controller.setLooping(true);
          _controller.play();
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.9),
      child: Center(
        child: _isInitialized
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(
            _controller,
          ),
        ) : const CircularProgressIndicator(color: Colors.white),
      ),
    );
  }
}
