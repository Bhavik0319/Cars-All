import 'dart:io';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cars_and_alll/app/models/user_model.dart';
import 'package:cars_and_alll/app/services/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/api/api_client.dart';
import '../../../utils/customSnackBar.dart';

class EditProfileController extends GetxController {

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController websiteController = TextEditingController();

  Rx<File>? selectedImage = File("").obs;
  final ImagePicker _picker = ImagePicker();

  var emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  void onInit() {
    nameController.text = UserStore.to.profile.userName!;
    phoneController.text = UserStore.to.profile.userPhone!;
    emailController.text = UserStore.to.profile.userEmail!;
    bioController.text = UserStore.to.profile.userBio!;
    websiteController.text = UserStore.to.profile.userWebsite!;
    super.onInit();
  }

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      selectedImage!.value = File(pickedFile.path);
    }
    Get.back();
  }

  // The Bottom Sheet UI
  void showPickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Gallery'),
                onTap: () => _pickImage(ImageSource.gallery),
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () => _pickImage(ImageSource.camera),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<String> uploadProfilePhoto(File file) async {
    var res = await ApiClient.to.uploadUserProfile(file: file);
    if(res["success"]) {
      return res["imageUrls"][0];
    } else {
      return "";
    }
  }

  updateProfile() async {
    if(selectedImage!.value.path != ""){
      var url = await uploadProfilePhoto(selectedImage!.value);
      if(url.isNotEmpty){
        UserStore.to.profile.userProfileImage = [url];
      } else {
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: 'Failed to update profile',
        );
      }
    }
    ApiClient.to.updateProfile(
      body: {
        "userProfileImage": UserStore.to.profile.userProfileImage,
        "isPhoneShare": true,
        "userWebsite": websiteController.text,
        "userBio": bioController.text,
        "otherProfileDetails": {
          "facebook": "https://facebook.com/user",
          "instagram": "https://instagram.com/user"
        },
        "userType": UserStore.to.profile.userType,
      },
      onSuccess: (res) {
        UserStore.to.saveProfile(res.body["data"]);
        customSnackBar(
          type: AnimatedSnackBarType.success,
          message: 'Profile updated successfully',
        );
        Get.back();
      },
      onError: (res) {
        customSnackBar(
          type: AnimatedSnackBarType.error,
          message: 'Failed to update profile',
        );
      },
    );
  }
}