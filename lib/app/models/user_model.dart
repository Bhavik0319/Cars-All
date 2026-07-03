import 'dart:convert';

class UserModel {
  final String? id;
  final String? userName;
  List<String>? userProfileImage;
  final String? userEmail;
  final String? userPhone;
  bool? isPhoneShare;
  final String? userWebsite;
  final String? userBio;
  final bool? isUserActive;
  final bool? isUserPhoneActive;
  final String? userType;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final bool? isAdminUserActive;
  final OtherProfileDetails? otherProfileDetails;

  UserModel({
    this.id,
    this.userName,
    this.userProfileImage,
    this.userEmail,
    this.userPhone,
    this.isPhoneShare,
    this.userWebsite,
    this.userBio,
    this.isUserActive,
    this.isUserPhoneActive,
    this.userType,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.isAdminUserActive,
    this.otherProfileDetails,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] as String?,
      userName: json['userName'] as String?,
      userProfileImage: json['userProfileImage'] != null
          ? List<String>.from(json['userProfileImage'])
          : null,
      userEmail: json['userEmail'] as String?,
      userPhone: json['userPhone'] as String?,
      isPhoneShare: json['isPhoneShare'] as bool?,
      userWebsite: json['userWebsite'] as String?,
      userBio: json['userBio'] as String?,
      isUserActive: json['isUserActive'] as bool?,
      isUserPhoneActive: json['isUserPhoneActive'] as bool?,
      userType: json['userType'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
      v: json['__v'] as int?,
      isAdminUserActive: json['isAdminUserActive'] as bool?,
      otherProfileDetails: json['otherProfileDetails'] != null
          ? OtherProfileDetails.fromJson(json['otherProfileDetails'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userName': userName,
      'userProfileImage': userProfileImage,
      'userEmail': userEmail,
      'userPhone': userPhone,
      'isPhoneShare': isPhoneShare,
      'userWebsite': userWebsite,
      'userBio': userBio,
      'isUserActive': isUserActive,
      'isUserPhoneActive': isUserPhoneActive,
      'userType': userType,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      '__v': v,
      'isAdminUserActive': isAdminUserActive,
      'otherProfileDetails': otherProfileDetails?.toJson(),
    };
  }
}

class OtherProfileDetails {
  final String? facebook;
  final String? instagram;

  OtherProfileDetails({
    this.facebook,
    this.instagram,
  });

  factory OtherProfileDetails.fromJson(Map<String, dynamic> json) {
    return OtherProfileDetails(
      facebook: json['facebook'] as String?,
      instagram: json['instagram'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'facebook': facebook,
      'instagram': instagram,
    };
  }
}