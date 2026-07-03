import 'dart:convert';

class RatingByUserModel {
  final String? id;
  final SimpleSeller? seller;
  final SimpleVehicle? vehicle;
  final bool? isCommentGiven;
  final DateTime? ratingExpiry;

  RatingByUserModel({
    this.id,
    this.seller,
    this.vehicle,
    this.isCommentGiven,
    this.ratingExpiry,
  });

  factory RatingByUserModel.fromJson(Map<String, dynamic> json) {
    return RatingByUserModel(
      id: json['_id'] as String?,
      seller: json['sellerId'] != null
          ? SimpleSeller.fromJson(json['sellerId'])
          : null,
      vehicle: json['vehicleId'] != null
          ? SimpleVehicle.fromJson(json['vehicleId'])
          : null,
      isCommentGiven: json['isCommentGiven'] as bool?,
      // DateTime.tryParse is safer than .parse for nullable fields
      ratingExpiry: json['ratingExpiry'] != null
          ? DateTime.tryParse(json['ratingExpiry'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'sellerId': seller?.toJson(),
      'vehicleId': vehicle?.toJson(),
      'isCommentGiven': isCommentGiven,
      'ratingExpiry': ratingExpiry?.toIso8601String(),
    };
  }
}

class SimpleSeller {
  final String? id;
  final String? userName;

  SimpleSeller({this.id, this.userName});

  factory SimpleSeller.fromJson(Map<String, dynamic> json) {
    return SimpleSeller(
      id: json['_id'] as String?,
      userName: json['userName'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': id,
    'userName': userName,
  };
}

class SimpleVehicle {
  final String? id;
  final String? vehicleTitle;

  SimpleVehicle({this.id, this.vehicleTitle});

  factory SimpleVehicle.fromJson(Map<String, dynamic> json) {
    return SimpleVehicle(
      id: json['_id'] as String?,
      vehicleTitle: json['vehicleTitle'] as String?,
    );
  }

  Map<String, dynamic> toJson() =>
      {
        '_id': id,
        'vehicleTitle': vehicleTitle,
      };
}