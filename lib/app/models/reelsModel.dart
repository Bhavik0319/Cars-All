import 'dart:convert';

class ReelModel {
  final String? id;
  final Seller? seller;
  final Vehicle? vehicle;
  final String? thumbnailUrl;
  final String? videoUrl;
  final String? caption;
  final int? views;
  final List<String>? likedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Comment>? comments;

  ReelModel({
    this.id,
    this.seller,
    this.vehicle,
    this.thumbnailUrl,
    this.videoUrl,
    this.caption,
    this.views,
    this.likedBy,
    this.createdAt,
    this.updatedAt,
    this.comments,
  });

  factory ReelModel.fromJson(Map<String, dynamic> json) {
    return ReelModel(
      id: json['_id'] as String?,
      seller: json['sellerId'] != null ? Seller.fromJson(json['sellerId']) : null,
      vehicle: json['vehicleId'] != null ? Vehicle.fromJson(json['vehicleId']) : null,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      videoUrl: json['videoUrl'] as String?,
      caption: json['caption'] as String?,
      views: json['views'] as int?,
      likedBy: json['likedBy'] != null ? List<String>.from(json['likedBy']) : null,
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.tryParse(json['updatedAt']) : null,
      comments: json['comments'] != null
          ? (json['comments'] as List).map((i) => Comment.fromJson(i)).toList()
          : null,
    );
  }
}

class Seller {
  final String? id;
  final String? userName;

  Seller({this.id, this.userName});

  factory Seller.fromJson(Map<String, dynamic> json) {
    return Seller(
      id: json['_id'] as String?,
      userName: json['userName'] as String?,
    );
  }
}

class Vehicle {
  final String? id;
  final VehicleLocation? location;
  final VehicleFilters? filters;
  final RtoDetails? rtoDetails;
  final String? category;
  final String? description;
  final int? askingPrice;
  final String? priceType;
  final List<String>? images;
  final String? status;
  final bool? isFeatured;
  final DateTime? createdAt;

  Vehicle({
    this.id,
    this.location,
    this.filters,
    this.rtoDetails,
    this.category,
    this.description,
    this.askingPrice,
    this.priceType,
    this.images,
    this.status,
    this.isFeatured,
    this.createdAt,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['_id'] as String?,
      location: json['vehicleLocation'] != null ? VehicleLocation.fromJson(json['vehicleLocation']) : null,
      filters: json['vehicleFilters'] != null ? VehicleFilters.fromJson(json['vehicleFilters']) : null,
      rtoDetails: json['vehicle_rto_details'] != null ? RtoDetails.fromJson(json['vehicle_rto_details']) : null,
      category: json['vehicleCategory'] as String?,
      description: json['vehicleDescription'] as String?,
      askingPrice: json['askingPrice'] as int?,
      priceType: json['priceType'] as String?,
      images: json['vehicleImages'] != null ? List<String>.from(json['vehicleImages']) : null,
      status: json['vehicleStatus'] as String?,
      isFeatured: json['isFeatured'] as bool?,
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt']) : null,
    );
  }
}

class Comment {
  final String? id;
  final String? userId;
  final String? comment;
  final DateTime? createdAt;

  Comment({this.id, this.userId, this.comment, this.createdAt});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['_id'] as String?,
      userId: json['userId'] as String?,
      comment: json['comment'] as String?,
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt']) : null,
    );
  }
}

class VehicleLocation {
  final LocationCoord? locationCoord;
  final String? localPlace;
  final String? localCircle;
  final String? city;
  final String? district;
  final String? state;
  final String? pincode;

  VehicleLocation({
    this.locationCoord,
    this.localPlace,
    this.localCircle,
    this.city,
    this.district,
    this.state,
    this.pincode,
  });

  factory VehicleLocation.fromJson(Map<String, dynamic> json) {
    return VehicleLocation(
      locationCoord: json['location_coord'] != null
          ? LocationCoord.fromJson(json['location_coord'])
          : null,
      localPlace: json['local_place'] as String?,
      localCircle: json['local_circle'] as String?,
      city: json['city'] as String?,
      district: json['district'] as String?,
      state: json['state'] as String?,
      pincode: json['pincode'] as String?,
    );
  }
}

class LocationCoord {
  final String? type;
  final List<dynamic>? coordinates;

  LocationCoord({this.type, this.coordinates});

  factory LocationCoord.fromJson(Map<String, dynamic> json) {
    return LocationCoord(
      type: json['type'] as String?,
      coordinates: json['coordinates'] as List?,
    );
  }
}

class VehicleFilters {
  final String? brand;
  final String? model;
  final int? kmsDriven;
  final int? registrationYear;
  final String? fuelType;
  final String? transmissionType;
  final String? ownerType;
  final String? bodyType;
  final String? seatingCapacity;

  VehicleFilters({
    this.brand,
    this.model,
    this.kmsDriven,
    this.registrationYear,
    this.fuelType,
    this.transmissionType,
    this.ownerType,
    this.bodyType,
    this.seatingCapacity,
  });

  factory VehicleFilters.fromJson(Map<String, dynamic> json) {
    return VehicleFilters(
      brand: json['brand'] as String?,
      model: json['model'] as String?,
      kmsDriven: json['kmsDriven'] as int?,
      registrationYear: json['registrationYear'] as int?,
      fuelType: json['fuelType'] as String?,
      transmissionType: json['transmissionType'] as String?,
      ownerType: json['ownerType'] as String?,
      bodyType: json['bodyType'] as String?,
      seatingCapacity: json['seatingCapacity'] as String?,
    );
  }
}

class RtoDetails {
  final String? rtoCode;
  final String? rtoState;
  final String? rtoNumber;
  final String? rtoAddress;

  RtoDetails({
    this.rtoCode,
    this.rtoState,
    this.rtoNumber,
    this.rtoAddress,
  });

  factory RtoDetails.fromJson(Map<String, dynamic> json) {
    return RtoDetails(
      rtoCode: json['RTO_Code'] as String?,
      rtoState: json['RTO_state'] as String?,
      rtoNumber: json['RTO_number'] as String?, // Handled null in JSON safely
      rtoAddress: json['RTO_address'] as String?,
    );
  }
}