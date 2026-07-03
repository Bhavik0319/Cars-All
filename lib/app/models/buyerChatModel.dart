import 'dart:convert';

class BuyerChatModel {
  final String? id;
  final UserProfile? buyer;
  final UserProfile? seller;
  final ChatVehicle? vehicle;
  final bool? autoFollowUp;
  final DateTime? lastSeenByBuyer;
  final DateTime? lastSeenBySeller;
  final List<Message>? messages;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  BuyerChatModel({
    this.id,
    this.buyer,
    this.seller,
    this.vehicle,
    this.autoFollowUp,
    this.lastSeenByBuyer,
    this.lastSeenBySeller,
    this.messages,
    this.createdAt,
    this.updatedAt,
  });

  factory BuyerChatModel.fromJson(Map<String, dynamic> json) {
    return BuyerChatModel(
      id: json['_id'] as String?,
      buyer: json['buyerId'] != null ? UserProfile.fromJson(json['buyerId']) : null,
      seller: json['sellerId'] != null ? UserProfile.fromJson(json['sellerId']) : null,
      vehicle: json['vehicleId'] != null ? ChatVehicle.fromJson(json['vehicleId']) : null,
      autoFollowUp: json['autoFollowUp'] as bool?,
      lastSeenByBuyer: json['lastSeenByBuyer'] != null ? DateTime.tryParse(json['lastSeenByBuyer']) : null,
      lastSeenBySeller: json['lastSeenBySeller'] != null ? DateTime.tryParse(json['lastSeenBySeller']) : null,
      messages: json['messages'] != null
          ? (json['messages'] as List).map((m) => Message.fromJson(m)).toList()
          : null,
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt'])!.add(Duration(hours: 5, minutes: 30)) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.tryParse(json['updatedAt'])!.add(Duration(hours: 5, minutes: 30)) : null,
    );
  }
}

// --- User Profile (Used for both Buyer and Seller) ---
class UserProfile {
  final String? id;
  final String? userName;
  final List<String>? userProfileImage;
  final String? userEmail;
  final String? userPhone;
  final bool? isPhoneShare;
  final String? userBio;
  final bool? isUserActive;
  final String? userType;
  final OtherProfileDetails? otherDetails;

  UserProfile({
    this.id,
    this.userName,
    this.userProfileImage,
    this.userEmail,
    this.userPhone,
    this.isPhoneShare,
    this.userBio,
    this.isUserActive,
    this.userType,
    this.otherDetails,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['_id'] as String?,
      userName: json['userName'] as String?,
      userProfileImage: json['userProfileImage'] != null ? List<String>.from(json['userProfileImage']) : null,
      userEmail: json['userEmail'] as String?,
      userPhone: json['userPhone'] as String?,
      isPhoneShare: json['isPhoneShare'] as bool?,
      userBio: json['userBio'] as String?,
      isUserActive: json['isUserActive'] as bool?,
      userType: json['userType'] as String?,
      otherDetails: json['otherProfileDetails'] != null ? OtherProfileDetails.fromJson(json['otherProfileDetails']) : null,
    );
  }
}

class OtherProfileDetails {
  final String? facebook;
  final String? instagram;

  OtherProfileDetails({this.facebook, this.instagram});

  factory OtherProfileDetails.fromJson(Map<String, dynamic> json) {
    return OtherProfileDetails(
      facebook: json['facebook'] as String?,
      instagram: json['instagram'] as String?,
    );
  }
}

// --- Message Model ---
class Message {
  final String? id;
  final String? senderId;
  final String? senderRole; // BUYER or SELLER
  final String? messageType; // TEXT or IMAGE
  final String? text;
  final DateTime? createdAt;

  Message({
    this.id,
    this.senderId,
    this.senderRole,
    this.messageType,
    this.text,
    this.createdAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['_id'] as String?,
      senderId: json['senderId'] as String?,
      senderRole: json['senderRole'] as String?,
      messageType: json['messageType'] as String?,
      text: json['text'] as String?,
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt'])!.add(Duration(hours: 5, minutes: 30)) : null,
    );
  }
}

// --- Simplified Vehicle Model for Chat ---
class ChatVehicle {
  final String? id;
  final String? category;
  final String? description;
  final int? askingPrice;
  final List<String>? images;
  final ChatVehicleFilters? filters;

  ChatVehicle({this.id, this.category, this.description, this.askingPrice, this.images, this.filters});

  factory ChatVehicle.fromJson(Map<String, dynamic> json) {
    return ChatVehicle(
      id: json['_id'] as String?,
      category: json['vehicleCategory'] as String?,
      description: json['vehicleDescription'] as String?,
      askingPrice: json['askingPrice'] as int?,
      images: json['vehicleImages'] != null ? List<String>.from(json['vehicleImages']) : null,
      filters: json['vehicleFilters'] != null ? ChatVehicleFilters.fromJson(json['vehicleFilters']) : null,
    );
  }
}

class ChatVehicleFilters {
  final String? brand;
  final String? model;

  ChatVehicleFilters({this.brand, this.model});

  factory ChatVehicleFilters.fromJson(Map<String, dynamic> json) {
    return ChatVehicleFilters(
      brand: json['brand'] as String?,
      model: json['model'] as String?,
    );
  }
}