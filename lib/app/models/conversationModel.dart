
import 'package:cars_and_alll/app/models/vehicle_detail_model.dart';

import 'buyerChatModel.dart';

/// ConversationModel
class ConversationModel {
  final Sender? sender;
  final String? senderRole;   // e.g., "BUYER" or "SELLER"
  final String? messageType;  // e.g., "TEXT" or "IMAGE"
  final String? text;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ConversationModel({
    this.sender,
    this.senderRole,
    this.messageType,
    this.text,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    return ConversationModel(
      sender: json['senderId'] != null
          ? Sender.fromJson(json['senderId'])
          : null,
      senderRole: json['senderRole'] as String?,
      messageType: json['messageType'] as String?,
      text: json['text'] as String?,
      id: json['_id'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])!.add(Duration(hours: 5, minutes: 30))
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
    );
  }

  @override
  String toString() {
    return 'ConversationModel{sender: $sender, senderRole: $senderRole, messageType: $messageType, text: $text, id: $id, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}

class Sender {
  final String? id;
  final String? userName;

  Sender({this.id, this.userName});

  @override
  String toString() {
    return 'Sender{id: $id, userName: $userName}';
  }

  factory Sender.fromJson(Map<String, dynamic> json) {
    return Sender(
      id: json['_id'] as String?,
      userName: json['userName'] as String?,
    );
  }
}


/// TopBarModel

class InquiryModel {
  final String? id;
  final UserProfile? buyer;
  final UserProfile? seller;
  final InquiryVehicle? vehicle;
  final bool? autoFollowUp;
  final DateTime? lastSeenByBuyer;
  final DateTime? lastSeenBySeller;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  InquiryModel({
    this.id,
    this.buyer,
    this.seller,
    this.vehicle,
    this.autoFollowUp,
    this.lastSeenByBuyer,
    this.lastSeenBySeller,
    this.createdAt,
    this.updatedAt,
  });

  factory InquiryModel.fromJson(Map<String, dynamic> json) {
    return InquiryModel(
      id: json['_id'] as String?,
      buyer: json['buyerId'] != null ? UserProfile.fromJson(json['buyerId']) : null,
      seller: json['sellerId'] != null ? UserProfile.fromJson(json['sellerId']) : null,
      vehicle: json['vehicleId'] != null ? InquiryVehicle.fromJson(json['vehicleId']) : null,
      autoFollowUp: json['autoFollowUp'] as bool?,
      lastSeenByBuyer: json['lastSeenByBuyer'] != null ? DateTime.tryParse(json['lastSeenByBuyer']) : null,
      lastSeenBySeller: json['lastSeenBySeller'] != null ? DateTime.tryParse(json['lastSeenBySeller']) : null,
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt'])!.add(Duration(hours: 5, minutes: 30)) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.tryParse(json['updatedAt']) : null,
    );
  }
}

class InquiryVehicle {
  final String? id;
  final String? category;
  final String? description;
  final int? askingPrice;
  final List<String>? images;
  final VehicleLocation? location;
  final VehicleFilters? filters;
  final String? vehicleStatus;

  InquiryVehicle({this.id, this.vehicleStatus, this.category, this.description, this.askingPrice, this.images, this.location, this.filters});

  factory InquiryVehicle.fromJson(Map<String, dynamic> json) {
    return InquiryVehicle(
      id: json['_id'],
      category: json['vehicleCategory'],
      description: json['vehicleDescription'],
      askingPrice: json['askingPrice'],
      images: json['vehicleImages'] != null ? List<String>.from(json['vehicleImages']) : null,
      location: json['vehicleLocation'] != null ? VehicleLocation.fromJson(json['vehicleLocation']) : null,
      filters: json['vehicleFilters'] != null ? VehicleFilters.fromJson(json['vehicleFilters']) : null,
      vehicleStatus: json['vehicleStatus']?? '',
    );
  }
}

