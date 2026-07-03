import 'dart:convert';

class SellerChatModel {
  final String? id;
  final ChatUser? buyer;
  final ChatUser? seller;
  final ChatVehicleDetails? vehicle;
  final bool? autoFollowUp;
  final DateTime? lastSeenByBuyer;
  final DateTime? lastSeenBySeller;
  final List<ChatMessage>? messages;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  SellerChatModel({
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

  factory SellerChatModel.fromJson(Map<String, dynamic> json) {
    return SellerChatModel(
      id: json['_id'],
      buyer: json['buyerId'] != null ? ChatUser.fromJson(json['buyerId']) : null,
      seller: json['sellerId'] != null ? ChatUser.fromJson(json['sellerId']) : null,
      vehicle: json['vehicleId'] != null ? ChatVehicleDetails.fromJson(json['vehicleId']) : null,
      autoFollowUp: json['autoFollowUp'] as bool?,
      lastSeenByBuyer: json['lastSeenByBuyer'] != null ? DateTime.tryParse(json['lastSeenByBuyer']) : null,
      lastSeenBySeller: json['lastSeenBySeller'] != null ? DateTime.tryParse(json['lastSeenBySeller']) : null,
      messages: json['messages'] != null
          ? (json['messages'] as List).map((i) => ChatMessage.fromJson(i)).toList()
          : null,
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt'])!.add(Duration(hours: 5, minutes: 30)) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.tryParse(json['updatedAt'])!.add(Duration(hours: 5, minutes: 30)) : null,
    );
  }
}

class ChatUser {
  final String? id;
  final String? userName;
  final List<String>? userProfileImage;
  final String? userEmail;
  final String? userPhone;
  final bool? isPhoneShare;
  final String? userBio;
  final bool? isUserActive;
  final String? userType;
  final SocialDetails? otherDetails;

  ChatUser({
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

  factory ChatUser.fromJson(Map<String, dynamic> json) {
    return ChatUser(
      id: json['_id'],
      userName: json['userName'],
      userProfileImage: json['userProfileImage'] != null ? List<String>.from(json['userProfileImage']) : null,
      userEmail: json['userEmail'],
      userPhone: json['userPhone'],
      isPhoneShare: json['isPhoneShare'] as bool?,
      userBio: json['userBio'],
      isUserActive: json['isUserActive'] as bool?,
      userType: json['userType'],
      otherDetails: json['otherProfileDetails'] != null ? SocialDetails.fromJson(json['otherProfileDetails']) : null,
    );
  }
}

class SocialDetails {
  final String? facebook;
  final String? instagram;

  SocialDetails({this.facebook, this.instagram});

  factory SocialDetails.fromJson(Map<String, dynamic> json) {
    return SocialDetails(
      facebook: json['facebook'],
      instagram: json['instagram'],
    );
  }
}

class ChatMessage {
  final String? id;
  final String? senderId;
  final String? senderRole;
  final String? messageType;
  final String? text;
  final DateTime? createdAt;

  ChatMessage({
    this.id,
    this.senderId,
    this.senderRole,
    this.messageType,
    this.text,
    this.createdAt,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['_id'],
      senderId: json['senderId'],
      senderRole: json['senderRole'],
      messageType: json['messageType'],
      text: json['text'],
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt'])!.add(Duration(hours: 5, minutes: 30)) : null,
    );
  }
}

class ChatVehicleDetails {
  final String? id;
  final String? description;
  final int? askingPrice;
  final String? vehicleNumber;
  final List<String>? vehicleImages;
  final VehicleFilters? filters;

  ChatVehicleDetails({
    this.id,
    this.description,
    this.askingPrice,
    this.vehicleNumber,
    this.vehicleImages,
    this.filters,
  });

  factory ChatVehicleDetails.fromJson(Map<String, dynamic> json) {
    return ChatVehicleDetails(
      id: json['_id'],
      description: json['vehicleDescription'],
      askingPrice: json['askingPrice'],
      vehicleNumber: json['vehicleNumber'],
      vehicleImages: json['vehicleImages'] != null ? List<String>.from(json['vehicleImages']) : null,
      filters: json['vehicleFilters'] != null ? VehicleFilters.fromJson(json['vehicleFilters']) : null,
    );
  }
}

class VehicleFilters {
  final String? brand;
  final String? model;
  final String? fuelType;

  VehicleFilters({this.brand, this.model, this.fuelType});

  factory VehicleFilters.fromJson(Map<String, dynamic> json) {
    return VehicleFilters(
      brand: json['brand'],
      model: json['model'],
      fuelType: json['fuelType'],
    );
  }
}