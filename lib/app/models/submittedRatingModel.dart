import 'dart:convert';

class SubmittedRatedModel {
  final String? id;
  final RatedSeller? seller;
  final String? userId;
  final RatedVehicle? vehicle;
  final bool? isCommentGiven;
  final int? ratingValue;
  final String? reviewText;
  final DateTime? ratingExpiry;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  SubmittedRatedModel({
    this.id,
    this.seller,
    this.userId,
    this.vehicle,
    this.isCommentGiven,
    this.ratingValue,
    this.reviewText,
    this.ratingExpiry,
    this.createdAt,
    this.updatedAt,
  });

  factory SubmittedRatedModel.fromJson(Map<String, dynamic> json) {
    return SubmittedRatedModel(
      id: json['_id'] as String?,
      seller: json['sellerId'] != null ? RatedSeller.fromJson(json['sellerId']) : null,
      userId: json['userId'] as String?,
      vehicle: json['vehicleId'] != null ? RatedVehicle.fromJson(json['vehicleId']) : null,
      isCommentGiven: json['isCommentGiven'] as bool?,
      ratingValue: json['ratingValue'] as int?,
      reviewText: json['reviewText'] as String?,
      ratingExpiry: json['ratingExpiry'] != null ? DateTime.tryParse(json['ratingExpiry']) : null,
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.tryParse(json['updatedAt']) : null,
    );
  }
}

// --- Seller Profile Model ---
class RatedSeller {
  final String? id;
  final String? userName;
  final List<String>? userProfileImage;
  final String? userEmail;
  final String? userPhone;
  final bool? isPhoneShare;
  final bool? isUserActive;
  final String? userType;

  RatedSeller({
    this.id,
    this.userName,
    this.userProfileImage,
    this.userEmail,
    this.userPhone,
    this.isPhoneShare,
    this.isUserActive,
    this.userType,
  });

  factory RatedSeller.fromJson(Map<String, dynamic> json) {
    return RatedSeller(
      id: json['_id'] as String?,
      userName: json['userName'] as String?,
      userProfileImage: json['userProfileImage'] != null ? List<String>.from(json['userProfileImage']) : null,
      userEmail: json['userEmail'] as String?,
      userPhone: json['userPhone'] as String?,
      isPhoneShare: json['isPhoneShare'] as bool?,
      isUserActive: json['isUserActive'] as bool?,
      userType: json['userType'] as String?,
    );
  }
}

// --- Vehicle Model ---
class RatedVehicle {
  final String? id;
  final RatedLocation? location;
  final RatedFilters? filters;
  final String? category;
  final String? subCategory;
  final String? description;
  final int? askingPrice;
  final String? status;
  final List<String>? images;

  RatedVehicle({
    this.id,
    this.location,
    this.filters,
    this.category,
    this.subCategory,
    this.description,
    this.askingPrice,
    this.status,
    this.images,
  });

  factory RatedVehicle.fromJson(Map<String, dynamic> json) {
    return RatedVehicle(
      id: json['_id'] as String?,
      location: json['vehicleLocation'] != null ? RatedLocation.fromJson(json['vehicleLocation']) : null,
      filters: json['vehicleFilters'] != null ? RatedFilters.fromJson(json['vehicleFilters']) : null,
      category: json['vehicleCategory'] as String?,
      subCategory: json['vehicleSubCategory'] as String?,
      description: json['vehicleDescription'] as String?,
      askingPrice: json['askingPrice'] as int?,
      status: json['vehicleStatus'] as String?,
      images: json['vehicleImages'] != null ? List<String>.from(json['vehicleImages']) : null,
    );
  }
}

// --- Nested Vehicle Components ---
class RatedLocation {
  final String? localPlace;
  final String? city;
  final String? state;
  final String? pincode;

  RatedLocation({this.localPlace, this.city, this.state, this.pincode});

  factory RatedLocation.fromJson(Map<String, dynamic> json) {
    return RatedLocation(
      localPlace: json['local_place'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      pincode: json['pincode'] as String?,
    );
  }
}

class RatedFilters {
  final String? brand;
  final String? model;
  final int? kmsDriven;
  final int? registrationYear;
  final String? fuelType;
  final String? transmissionType;

  RatedFilters({
    this.brand,
    this.model,
    this.kmsDriven,
    this.registrationYear,
    this.fuelType,
    this.transmissionType,
  });

  factory RatedFilters.fromJson(Map<String, dynamic> json) {
    return RatedFilters(
      brand: json['brand'] as String?,
      model: json['model'] as String?,
      kmsDriven: json['kmsDriven'] as int?,
      registrationYear: json['registrationYear'] as int?,
      fuelType: json['fuelType'] as String?,
      transmissionType: json['transmissionType'] as String?,
    );
  }
}