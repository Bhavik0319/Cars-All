import 'package:cars_and_alll/app/utils/scale_utility.dart';
import 'package:cars_and_alll/shared/color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PurchaseDetailsScreen extends StatelessWidget {
  const PurchaseDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScalingUtility scale = ScalingUtility(context: context)
      ..setCurrentDeviceSize();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: scale.getPadding(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: scale.getScaledHeight(36)),

              /// -- Back Button
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  height: scale.getScaledHeight(34),
                  width: scale.getScaledWidth(34),
                  decoration: BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 24,
                  ),
                ),
              ),

              /// -- Purchase Details and Car Image
              SizedBox(height: scale.getScaledHeight(10)),
              Text(
                "Purchase Details",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: scale.getScaledHeight(18),
                    fontWeight: FontWeight.w800),
              ),
              Stack(children: [
                /// -- Delivery Status
                Container(
                  height: scale.getScaledHeight(200),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage("assets/images/car.png"),
                          fit: BoxFit.cover)),
                ),

                /// -- Car Image
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(50)),
                    child: Padding(
                      padding: scale.getPadding(
                          left: 6, right: 6, top: 4, bottom: 4),
                      child: Text(
                        "Delivered",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: scale.getScaledFont(16)),
                      ),
                    ),
                  ),
                ),
              ]),

              /// -- Vehicle Information
              SizedBox(height: scale.getScaledHeight(10)),
              Text(
                "Vehicle Information",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: scale.getScaledHeight(14),
                    fontWeight: FontWeight.bold),
              ),
              Container(
                width: double.infinity,
                height: scale.getScaledHeight(80),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                    Border.all(color: Colors.orangeAccent, width: 1)),
                child: Padding(
                  padding: scale.getPadding(all: 8),
                  child: Column(
                    children: [
                      /// -- Model
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Model",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: scale.getScaledFont(12),
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Hyundai i20",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: scale.getScaledFont(12),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),

                      /// -- Fuel
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Fuel",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: scale.getScaledFont(12),
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Petrol",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: scale.getScaledFont(12),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),

                      /// -- Transmission
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Transmission",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: scale.getScaledFont(12),
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Manual",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: scale.getScaledFont(12),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),

                      /// -- VIN
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "VIN",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: scale.getScaledFont(12),
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "xxxxxxxxxx",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: scale.getScaledFont(12),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: scale.getScaledHeight(10)),

              /// -- thank you message
              Container(
                width: double.infinity,
                height: scale.getScaledHeight(70),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                    Border.all(color: Colors.orangeAccent, width: 1)),
                child: Column(
                  children: [
                    /// -- Thank you Container
                    Container(
                      width: double.infinity,
                      height: scale.getScaledHeight(30),
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /// -- Check mark icon
                          Icon(
                            Icons.check_circle_outline_rounded,
                            color: Colors.orangeAccent,
                            size: 18,
                          ),
                          /// -- Thank you Text.
                          SizedBox(width: scale.getScaledWidth(10)),
                          Text(
                            "Thank you. Contact Seller for a quick response.",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),

                    /// -- location
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.black,
                          size: 18,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Kapoor motors",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: scale.getScaledFont(12),
                              fontWeight: FontWeight.normal),
                        ),
                        Expanded(
                            child:
                            SizedBox(width: scale.getScaledWidth(10))),
                        Text(
                          "view",
                          style: TextStyle(fontSize: scale.getScaledFont(12)),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),

                    /// -- Contact
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Icon(
                          Icons.wifi_calling_3_outlined,
                          color: Colors.black,
                          size: 18,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "+91 123456790",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: scale.getScaledFont(12),
                              fontWeight: FontWeight.normal),
                        ),
                        Expanded(
                            child:
                            SizedBox(width: scale.getScaledWidth(10))),
                      ],
                    ),
                  ],
                ),
              ),

              /// -- Delivery Information
              SizedBox(height: scale.getScaledHeight(10)),
              Text(
                "Delivery Information",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: scale.getScaledHeight(14),
                    fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.delivery_dining_rounded,
                        color: Colors.black,
                        size: 22,
                      ),
                      SizedBox(width: scale.getScaledWidth(10)),
                      Text(
                        "Delivery Successfully",
                        style: TextStyle(
                            fontSize: scale.getScaledFont(16),
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: scale.getScaledWidth(30)),
                      Text(
                        "Your vehicle has been delivered successfully.",
                        style: TextStyle(
                            fontSize: scale.getScaledFont(12),
                            color: Colors.grey,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ],
              ),

              /// -- Delivery Address
              SizedBox(height: scale.getScaledHeight(10)),
              Text(
                "Delivery Address",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: scale.getScaledHeight(14),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Iris Watson",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: scale.getScaledHeight(12),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "606-3727 Ullamcoper",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: scale.getScaledHeight(12),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Roseville NH 11523",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: scale.getScaledHeight(12),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "(786) 713-8616",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: scale.getScaledHeight(12),
                    fontWeight: FontWeight.bold),
              ),

              /// -- Payment Information
              SizedBox(height: scale.getScaledHeight(10)),
              Text(
                "Payment Information",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: scale.getScaledHeight(14),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: scale.getScaledHeight(8)),
              Container(
                width: double.infinity,
                height: scale.getScaledHeight(128),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                    Border.all(color: Colors.orangeAccent, width: 1)),
                child: Padding(
                  padding: scale.getPadding(all: 4),
                  child: Column(
                    children: [
                      /// -- Component and Amount Title
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Component",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: scale.getScaledFont(14),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Amount",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: scale.getScaledFont(14),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                      /// -- Car price
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Car Price",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: scale.getScaledFont(12),
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Rs.45,00,000",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: scale.getScaledFont(12),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),

                      /// -- Registration
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Registration",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: scale.getScaledFont(12),
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Rs.1,25,000",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: scale.getScaledFont(12),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),

                      /// -- Insurance
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Insurance",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: scale.getScaledFont(12),
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Rs.85,000",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: scale.getScaledFont(12),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),

                      /// -- Accessories
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Accessories",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: scale.getScaledFont(12),
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Rs.45,000",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: scale.getScaledFont(12),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),

                      /// -- Mode of payment
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Mode of Payment",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: scale.getScaledFont(12),
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "UPI/EMI",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: scale.getScaledFont(12),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),

                      /// -- Divider
                      Divider(color: Colors.grey, endIndent: 5, indent: 5,),

                      /// -- Total
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "TOTAL",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: scale.getScaledFont(12),
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Rs.47,55,000",
                            style: TextStyle(
                                fontSize: scale.getScaledFont(14),
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              /// -- Download Invoice
              SizedBox(height: scale.getScaledHeight(20)),
              SizedBox(
                  height: scale.getScaledHeight(40),
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){}, child: Text("Download Invoice", style: TextStyle(fontSize: 16, color: Colors.white),))),

              /// -- Add Download Invoice button or section here if needed
              SizedBox(height: scale.getScaledHeight(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  /// -- Call Support
                  Expanded(
                    child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Colors.orangeAccent, width: 1)
                        ),
                        child: Padding(
                          padding: scale.getPadding(all: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.phone_in_talk_rounded, size: 22, color: AppColors.primaryLight,),
                              SizedBox(height: scale.getScaledWidth(10)),
                              Text("Call Support", style: TextStyle(fontSize: scale.getScaledFont(12), color: AppColors.primaryLight),)
                            ],
                          ),
                        ),
                    ),
                  ),
                  SizedBox(width: scale.getScaledWidth(20)),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: (){},
                      child: Padding(
                        padding: scale.getPadding(all: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.message_outlined, size: 22, color: Colors.white,),
                            SizedBox(width: scale.getScaledWidth(10)),
                            Text("Chat Support", style: TextStyle(fontSize: scale.getScaledFont(12), color: Colors.white),)
                          ],
                        ),
                      ),
                    ),
                  ),

                  /// -- Chat Support
                ],
              ),
              SizedBox(height: scale.getScaledHeight(20)),
            ],
          ),
        ),
      ),
    );
  }
}
