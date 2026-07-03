import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class AddNewPostScreen extends StatelessWidget {
  const AddNewPostScreen({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController vehicleNumberController = TextEditingController();
    bool isSwitched = true;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 8.0, bottom: 8.0),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),

                /// -- Push Back Button
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Icon(Icons.arrow_back, size: 28, color: Colors.black, ),
                  ),
                ),
                SizedBox(height: 16),

                /// -- Post new Ads.
                Text("Post new Ads", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,color: Colors.black)),
                SizedBox(height: 10),

                /// -- Vehicle Details.
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: FaIcon(FontAwesomeIcons.car, color: Colors.orange, size: 20,),
                    ),
                    SizedBox(width: 10),
                    Text("Vehicle Details", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Colors.black),)
                  ],
                ),
                SizedBox(height: 10),

                /// -- Vehicle Number TextForm Field.
                Text("Enter Vehicle Number", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.grey.shade600),),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 1,),
                        borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "e.g: MH 01 AB 1234",
                    hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey.shade600),
                    suffixIcon: Icon(Icons.keyboard_arrow_down_rounded, size: 24, color: Colors.grey.shade600),
                  ),
                  maxLines: 1,
                  controller: vehicleNumberController,
                  cursorColor: Colors.grey.shade600,
                ),
                SizedBox(height: 10),
                Align(
                    alignment: Alignment.center,
                    child: Text("Or", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey.shade600),),
                ),

                /// -- Enter Manually
                SizedBox(height: 10),
                Text("Enter Manually", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Colors.black),),

                /// -- Brand
                SizedBox(height: 10),
                Text("Brand", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.grey.shade600),),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1,),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Select Brand name",
                    hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey.shade600),
                    suffixIcon: Icon(Icons.keyboard_arrow_down_rounded, size: 24, color: Colors.grey.shade600),
                  ),
                  maxLines: 1,
                  controller: vehicleNumberController,
                  cursorColor: Colors.grey.shade600,
                ),

                /// -- Model
                SizedBox(height: 10),
                Text("Model", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.grey.shade600),),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1,),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Select Model name",
                    hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey.shade600),
                    suffixIcon: Icon(Icons.keyboard_arrow_down_rounded, size: 24, color: Colors.grey.shade600),
                  ),
                  maxLines: 1,
                  controller: vehicleNumberController,
                  cursorColor: Colors.grey.shade600,
                ),
                SizedBox(height: 10),

                /// -- Year
                SizedBox(height: 10),
                Text("Year", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.grey.shade600),),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1,),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Select Year",
                    hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey.shade600),
                    suffixIcon: Icon(Icons.keyboard_arrow_down_rounded, size: 24, color: Colors.grey.shade600),
                  ),
                  maxLines: 1,
                  controller: vehicleNumberController,
                  cursorColor: Colors.grey.shade600,
                ),
                SizedBox(height: 10),

                /// -- Variant
                SizedBox(height: 10),
                Text("Variant", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.grey.shade600),),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1,),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Select Variant",
                    hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey.shade600),
                    suffixIcon: Icon(Icons.keyboard_arrow_down_rounded, size: 24, color: Colors.grey.shade600),
                  ),
                  maxLines: 1,
                  controller: vehicleNumberController,
                  cursorColor: Colors.grey.shade600,
                ),
                SizedBox(height: 10),

                /// -- Registration Number
                SizedBox(height: 10),
                Text("Registration number", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.grey.shade600),),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1,),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "e.g: MH 01 AB 1234",
                    hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey.shade600),
                    suffixIcon: Icon(Icons.keyboard_arrow_down_rounded, size: 24, color: Colors.grey.shade600),
                  ),
                  maxLines: 1,
                  controller: vehicleNumberController,
                  cursorColor: Colors.grey.shade600,
                ),
                SizedBox(height: 10),

                /// -- Km Driven
                SizedBox(height: 10),
                Text("Km Driven", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.grey.shade600),),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1,),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "e.g: 25000",
                    hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey.shade600),
                  ),
                  maxLines: 1,
                  controller: vehicleNumberController,
                  cursorColor: Colors.grey.shade600,
                ),
                SizedBox(height: 10),

                /// -- RC Document : File Upload (Optional)
                SizedBox(height: 10),
                Text("RC Document (Optional)", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.grey.shade600),),
                SizedBox(height: 10),
                InkWell(
                  onTap: (){
                    /// --  Logic to upload file here
                  },
                  child: DottedBorder(
                    options: RoundedRectDottedBorderOptions(radius: Radius.circular(10), color: Colors.grey.shade600),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0,top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.file_upload_outlined, size: 20, color: Colors.grey.shade600,),
                          SizedBox(width: 10),
                          Text("Upload File", style: TextStyle(fontSize: 18, color: Colors.grey.shade600),)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                /// -- Photos and Videos
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: FaIcon(FontAwesomeIcons.camera, color: Colors.orange, size: 20,),
                    ),
                    SizedBox(width: 10),
                    Text("Photos & Videos", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Colors.black),)
                  ],
                ),

                /// -- Photos (Optional)
                SizedBox(height: 10),
                Text("Photos", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.grey.shade600),),
                SizedBox(height: 10),
                SizedBox(
                  height: 160,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      reverse: false,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 160, height: 160,
                            decoration: BoxDecoration(
                              color: Colors.orange.shade100,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add, size: 50, color: Colors.orange,),
                                Text("Add New Car", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.orange),),
                              ],
                            ),
                          ),
                        );
                      },
                  ),
                ),

                /// -- Videos (Optional)
                SizedBox(height: 10),
                Text("Videos (Optional)", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.grey.shade600),),
                SizedBox(height: 10),
                InkWell(
                  onTap: (){
                    /// --  Logic to upload file here
                  },
                  child: DottedBorder(
                    options: RoundedRectDottedBorderOptions(radius: Radius.circular(10), color: Colors.grey.shade600),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0,top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.file_upload_outlined, size: 20, color: Colors.grey.shade600,),
                          SizedBox(width: 10),
                          Text("Upload Videos", style: TextStyle(fontSize: 18, color: Colors.grey.shade600),)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),

                /// --  Pricing & Location
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: FaIcon(FontAwesomeIcons.tag, color: Colors.orange, size: 20,),
                    ),
                    SizedBox(width: 10),
                    Text("Additional Details", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Colors.black),)
                  ],
                ),

                /// -- Asking Price
                SizedBox(height: 10),
                Text("Asking Price", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.grey.shade600),),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1,),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "e.g: Rs.25000",
                    hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey.shade600),
                  ),
                  maxLines: 1,
                  controller: vehicleNumberController,
                  cursorColor: Colors.grey.shade600,
                ),
                SizedBox(height: 10),

                /// -- Price Type
                SizedBox(height: 10),
                Text("Price Type", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.grey.shade600),),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1,),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Negotiation",
                    hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey.shade600),
                    suffixIcon: Icon(Icons.keyboard_arrow_down_rounded, size: 24, color: Colors.grey.shade600),
                  ),
                  maxLines: 1,
                  controller: vehicleNumberController,
                  cursorColor: Colors.grey.shade600,
                ),
                SizedBox(height: 10),

                /// -- Location
                SizedBox(height: 10),
                Text("Location", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.grey.shade600),),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1,),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "City/State",
                    hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey.shade600),
                  ),
                  maxLines: 1,
                  controller: vehicleNumberController,
                  cursorColor: Colors.grey.shade600,
                ),
                SizedBox(height: 10),

                /// -- Additional Details
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: Icon(Icons.menu_open_rounded, color: Colors.orange, size: 20,),
                    ),
                    SizedBox(width: 10),
                    Text("Additional Details", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Colors.black),)
                  ],
                ),

                /// -- Insurance Available : Toggle Button
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Insurance Available", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Colors.black),),
                    CupertinoSwitch(
                      value: isSwitched, // Current state of the switch
                      onChanged: (newValue) {},
                    ),
                  ],
                ),
                SizedBox(height: 10),

                /// -- First Owner : Toggle Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("First Owner", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Colors.black),),
                    CupertinoSwitch(
                      value: isSwitched, // Current state of the switch
                      onChanged: (newValue) {},
                    ),
                  ],
                ),
                SizedBox(height: 10),

                /// -- RTO Transferable : Toggle Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("RTO Transferrable", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Colors.black),),
                    CupertinoSwitch(
                      value: isSwitched, // Current state of the switch
                      onChanged: (newValue) {},
                    ),
                  ],
                ),
                SizedBox(height: 10),

                /// -- Description
                SizedBox(height: 10),
                Text("Description", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.grey.shade600),),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1,),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Describe your vehicle condition",
                    hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey.shade600),
                  ),
                  maxLines: 4,
                  controller: vehicleNumberController,
                  cursorColor: Colors.grey.shade600,
                ),
                Text("   0/500 characters", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.grey.shade600),),
                SizedBox(height: 10),

                /// -- contact Information
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: Icon(Icons.person_outline_rounded, color: Colors.orange, size: 20,),
                    ),
                    SizedBox(width: 10),
                    Text("Contact Information", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: Colors.black),)
                  ],
                ),

                /// -- Full Name
                SizedBox(height: 10),
                Text("Full Name", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.grey.shade600),),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1,),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Ravi Sharma",
                    hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey.shade600),
                  ),
                  maxLines: 1,
                  controller: vehicleNumberController,
                  cursorColor: Colors.grey.shade600,
                ),
                SizedBox(height: 10),

                /// -- Phone Number
                SizedBox(height: 10),
                Text("Phone Number", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.grey.shade600),),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1,),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "+91 1234567890",
                    hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey.shade600),
                  ),
                  maxLines: 1,
                  controller: vehicleNumberController,
                  cursorColor: Colors.grey.shade600,
                ),
                SizedBox(height: 10),

                /// -- Email ID
                SizedBox(height: 10),
                Text("Email ID", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.grey.shade600),),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600, width: 1,),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1,),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "abc@gmail.com",
                    hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey.shade600),
                  ),
                  maxLines: 1,
                  controller: vehicleNumberController,
                  cursorColor: Colors.grey.shade600,
                ),
                SizedBox(height: 30),

                /// -- Post Now Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: (){},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Post Now", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 22),),
                      )
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      )
    );
  }
}
