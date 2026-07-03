import 'dart:convert';

class WishlistModel {
  final String? id;
  final String? userId;
  final VehicleDetails? vehicle;
  final bool? isSoldout;
  final DateTime? createdAt;

  WishlistModel({
    this.id,
    this.userId,
    this.vehicle,
    this.isSoldout,
    this.createdAt,
  });

  factory WishlistModel.fromJson(Map<String, dynamic> json) {
    return WishlistModel(
      id: json['_id'] as String?,
      userId: json['userId'] as String?,
      vehicle: json['vehicleId'] != null
          ? VehicleDetails.fromJson(json['vehicleId'])
          : null,
      isSoldout: json['isSoldout'] as bool?,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
    );
  }
}

class VehicleDetails {
  final String? id;
  final String? category;

  @override
  String toString() {
    return 'VehicleDetails{id: $id, category: $category, subCategory: $subCategory, description: $description, askingPrice: $askingPrice, priceType: $priceType, status: $status, images: $images}';
  }

  final String? subCategory;
  final String? description;
  final int? askingPrice;
  final String? priceType;
  final String? status;
  final List<String>? images;

  VehicleDetails({
    this.id,
    this.category,
    this.subCategory,
    this.description,
    this.askingPrice,
    this.priceType,
    this.status,
    this.images,
  });

  factory VehicleDetails.fromJson(Map<String, dynamic> json) {
    return VehicleDetails(
      id: json['_id'] as String?,
      category: json['vehicleCategory'] as String?,
      subCategory: json['vehicleSubCategory'] as String?,
      description: json['vehicleDescription'] as String?,
      askingPrice: json['askingPrice'] as int?,
      priceType: json['priceType'] as String?,
      status: json['vehicleStatus'] as String?,
      images: json['vehicleImages'] != null
          ? List<String>.from(json['vehicleImages'])
          : null,
    );
  }
}