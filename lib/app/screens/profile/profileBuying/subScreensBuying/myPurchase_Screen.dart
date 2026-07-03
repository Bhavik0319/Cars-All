import 'package:cars_and_alll/app/screens/profile/profileBuying/subScreensBuying/purchaseDetails_Screen.dart';
import 'package:cars_and_alll/app/utils/scale_utility.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyPurchaseScreen extends StatelessWidget {
  const MyPurchaseScreen({super.key});

  @override
  Widget build(BuildContext context) {

    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: scale.getPadding(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// -- Margin Space
                SizedBox(height: scale.getScaledHeight(40)),

                /// -- Back Button
                GestureDetector(
                  onTap: ()=> Get.back(),
                  child: Container(
                    height: scale.getScaledHeight(34),
                    width: scale.getScaledWidth(34),
                    decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: Icon(Icons.arrow_back, color: Colors.black, size: 24,),
                  ),
                ),

                /// -- My Purchases
                Text("My purchase", style: TextStyle(color: Colors.black, fontSize: scale.getScaledFont(22)),),

                /// -- Search Bar and Filter Button
                SizedBox(height: scale.getScaledHeight(10)),
                Row(
                  children: [
                    /// -- Search Bar
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.orangeAccent, width: 1.5)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.orangeAccent, width: 1.5)
                          ),
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(Icons.search_rounded, size: 20, color: Colors.black,)
                        ),
                      ),
                    ),

                    /// -- Filter button
                    SizedBox(width: scale.getScaledWidth(10)),
                    Icon(Icons.filter_list_rounded, color: AppColors.primaryLight, size: 22,)
                  ],
                ),

                /// -- My Purchase Container : 1
                SizedBox(height: scale.getScaledHeight(10)),
                Column(
                  children: [
                    /// --- Car Image, Details and delivery status
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// -- Car Image
                        Container(
                          height: scale.getScaledHeight(100),
                          width: scale.getScaledWidth(100),
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/images/car.png"), fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10)
                          ),
                        ),

                        /// -- Car Details
                        SizedBox(width: scale.getScaledWidth(10),),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("BMW 3 Series 2024", style: TextStyle(color: Colors.black),),
                            Text("320i M Sport", style: TextStyle(color: Colors.black),),
                            Text("Color: Alpine White", style: TextStyle(color: Colors.black),),
                            Text("Order ID: #CAR2317", style: TextStyle(color: Colors.black),),
                            Text("Purchased On: 05-06-2025", style: TextStyle(color: Colors.black),),
                          ],
                        ),

                        /// -- Delivery Status
                        Expanded(child: SizedBox(width: scale.getScaledWidth(10))),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child: Padding(
                            padding: scale.getPadding(left: 6, right: 6, top: 4, bottom: 4),
                            child: Text("Delivered", style: TextStyle(color: Colors.white, fontSize: scale.getScaledFont(16)),),
                          ),
                        )
                      ],
                    ),

                    /// -- invoice and complaint details
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        /// -- Invoice Button
                        ElevatedButton(
                            onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orangeAccent
                            ),
                            child: Padding(
                              padding: scale.getPadding(left: 10, right: 10, top: 5, bottom: 5),
                              child: Row(
                                children: [
                                  Icon(Icons.file_upload_outlined, size: 16, color: Colors.white,),
                                  SizedBox(width: scale.getScaledWidth(10)),
                                  Text("Invoice", style: TextStyle(color: Colors.white, fontSize: scale.getScaledFont(16)),),
                                ],
                              ),
                            ),
                        ),

                        /// -- Complaint Button
                        SizedBox(width: scale.getScaledWidth(10)),
                        ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide(color: Colors.orangeAccent, width: 1)
                          ),
                          child: Padding(
                            padding: scale.getPadding(left: 10, right: 10, top: 5, bottom: 5),
                            child: Row(
                              children: [
                                Icon(Icons.warning_amber_rounded, size: 16, color: AppColors.primaryLight,),
                                SizedBox(width: scale.getScaledWidth(10)),
                                Text("Complaint", style: TextStyle(color: AppColors.primaryLight, fontSize: scale.getScaledFont(16)),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    /// -- View Details Button
                    SizedBox(height: scale.getScaledHeight(10)),
                    GestureDetector(
                      onTap: (){
                        /// -- Navigator to View Details Screen
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PurchaseDetailsScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("View Details", style: TextStyle(fontSize: scale.getScaledFont(16))),
                          SizedBox(width: scale.getScaledWidth(8)),
                          Icon(Icons.arrow_forward_rounded, size: 16, color: AppColors.primaryLight,),
                        ],
                      ),
                    ),

                  ],
                ),

                /// -- Divider
                SizedBox(height: scale.getScaledHeight(12)),
                Divider(color: Colors.grey, thickness: 1,indent: 5, endIndent: 5,),
                SizedBox(height: scale.getScaledHeight(12)),

                /// -- My Purchase Container : 2
                Column(
                  children: [
                    /// --- Car Image, Details and delivery status
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// -- Car Image
                        Container(
                          height: scale.getScaledHeight(100),
                          width: scale.getScaledWidth(100),
                          decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("assets/images/car.png"), fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),

                        /// -- Car Details
                        SizedBox(width: scale.getScaledWidth(10),),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("BMW 3 Series 2024", style: TextStyle(color: Colors.black),),
                            Text("320i M Sport", style: TextStyle(color: Colors.black),),
                            Text("Color: Alpine White", style: TextStyle(color: Colors.black),),
                            Text("Order ID: #CAR2317", style: TextStyle(color: Colors.black),),
                            Text("Purchased On: 05-06-2025", style: TextStyle(color: Colors.black),),
                          ],
                        ),

                        /// -- Delivery Status
                        Expanded(child: SizedBox(width: scale.getScaledWidth(10))),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: Padding(
                            padding: scale.getPadding(left: 6, right: 6, top: 4, bottom: 4),
                            child: Text("Delivered", style: TextStyle(color: Colors.white, fontSize: scale.getScaledFont(16)),),
                          ),
                        )
                      ],
                    ),

                    /// -- invoice and complaint details
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        /// -- Invoice Button
                        ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orangeAccent
                          ),
                          child: Padding(
                            padding: scale.getPadding(left: 10, right: 10, top: 5, bottom: 5),
                            child: Row(
                              children: [
                                Icon(Icons.file_upload_outlined, size: 16, color: Colors.white,),
                                SizedBox(width: scale.getScaledWidth(10)),
                                Text("Invoice", style: TextStyle(color: Colors.white, fontSize: scale.getScaledFont(16)),),
                              ],
                            ),
                          ),
                        ),

                        /// -- Complaint Button
                        SizedBox(width: scale.getScaledWidth(10)),
                        ElevatedButton(
                          onPressed: (){},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide(color: Colors.orangeAccent, width: 1)
                          ),
                          child: Padding(
                            padding: scale.getPadding(left: 10, right: 10, top: 5, bottom: 5),
                            child: Row(
                              children: [
                                Icon(Icons.warning_amber_rounded, size: 16, color: AppColors.primaryLight,),
                                SizedBox(width: scale.getScaledWidth(10)),
                                Text("Complaint", style: TextStyle(color: AppColors.primaryLight, fontSize: scale.getScaledFont(16)),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    /// -- View Details Button
                    SizedBox(height: scale.getScaledHeight(10)),
                    GestureDetector(
                      onTap: (){
                        /// -- Navigator to View Details Screen
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PurchaseDetailsScreen()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("View Details", style: TextStyle(fontSize: scale.getScaledFont(16))),
                          SizedBox(width: scale.getScaledWidth(8)),
                          Icon(Icons.arrow_forward_rounded, size: 16, color: AppColors.primaryLight,),
                        ],
                      ),
                    ),

                  ],
                ),

                /// -- Divider
                SizedBox(height: scale.getScaledHeight(12)),
                Divider(color: Colors.grey, thickness: 1,indent: 5, endIndent: 5,),
                SizedBox(height: scale.getScaledHeight(12)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
