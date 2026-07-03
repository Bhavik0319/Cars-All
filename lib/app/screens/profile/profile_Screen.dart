import 'package:cars_and_alll/app/routes/app_routes.dart';
import 'package:cars_and_alll/app/screens/profile/controller/controller.dart';
import 'package:cars_and_alll/app/screens/profile/profileBuying/profileBuying_Screen.dart';
import 'package:cars_and_alll/app/screens/profile/profileSelling/profileSelling_Screen.dart';
import 'package:cars_and_alll/app/services/user.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/scale_utility.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Scaffold(
      body: Column(
        children: [
          /// -- profile header
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xff636AE8),
                Color(0xff064ACB),
              ]),
            ),
            child: Padding(
              padding: scale.getPadding(left: 10, right: 10, bottom: 10),
              child: Column(
                children: [
                  SizedBox(height: scale.getScaledHeight(45),),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      /// -- Back Button
                      GestureDetector(
                        onTap: ()=> Get.back(),
                        child: Container(
                          height: scale.getScaledHeight(24),
                          width: scale.getScaledWidth(24),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child: Icon(Icons.arrow_back, color: Colors.white, size: 24,),
                        ),
                      ),

                      /// -- Profile Icon
                      GestureDetector(
                        onTap: (){},
                        child: CircleAvatar(
                          radius: scale.getScaledFont(20),
                          backgroundImage: NetworkImage(
                            UserStore.to.profile.userProfileImage![0],
                          ),
                        )
                      ),
                      /// -- Profile Information
                      SizedBox(width: scale.getScaledWidth(10),),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () {
                              return Text("${UserStore.to.user.value.userName}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),);
                            }
                          ),
                          Row(
                            children: [
                              Icon(Icons.wifi_calling_3_outlined, size: 20, color: Colors.white,),
                              SizedBox(width: scale.getScaledWidth(8),),
                              Obx(
                                () {
                                  return Text("+91 ${UserStore.to.user.value.userPhone}", style: TextStyle(color: Colors.white, fontSize: 14),);
                                }
                              ),
                            ],
                          ),
                          SizedBox(height: scale.getScaledHeight(2),),
                          Row(
                            children: [
                              Icon(Icons.mark_email_read_outlined, size: 20, color: Colors.white,),
                              SizedBox(width: scale.getScaledWidth(8),),
                              Obx(
                                () {
                                  return Text("${UserStore.to.user.value.userEmail}", style: TextStyle(color: Colors.white, fontSize: 14),);
                                }
                              ),
                            ],
                          ),
                          SizedBox(height: scale.getScaledHeight(2),),
                          // Row(
                          //   children: [
                          //     Icon(Icons.location_on_outlined, size: 20, color: Colors.white,),
                          //     SizedBox(width: scale.getScaledWidth(8),),
                          //     Text("${UserStore.to.profile.}", style: TextStyle(color: Colors.white, fontSize: 14),),
                          //   ],
                          // ),

                        ],
                      ),

                      /// -- Edit Button
                      Expanded(child: SizedBox(width: scale.getScaledWidth(10),)),
                      GestureDetector(
                        onTap: (){
                          Get.toNamed(AppRoutes.editProfileScreen);
                        },
                        child: SizedBox(
                          height: scale.getScaledHeight(34),
                          width: scale.getScaledWidth(34),
                          child: Icon(Icons.edit_outlined, color: Colors.white, size: 30,),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          /// -- Buying and Selling tab bar here...Tab Controller + TabBar
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
                        /// -- Buying Tab
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
                        /// -- Selling Tab
                        Tab(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.storefront, size: 24,),
                              Text(tr('selling'), style: TextStyle(fontWeight: FontWeight.bold, fontSize: scale.getScaledFont(16)),),
                              Icon(Icons.keyboard_arrow_right, size: 22, color: Colors.grey,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: controller.tabController,
                      children: [
                        /// -- Profile Buying Screen here...
                        ProfileBuyingScreen(),

                        /// -- Profile Selling Screen here...
                        ProfileSellingScreen(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
