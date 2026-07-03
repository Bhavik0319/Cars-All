import 'dart:convert';

class PostVehicleModel {
  final String? id;
  final String? vehicleTitle;
  final String? vehicleCategory;
  final String? vehicleSubCategory;
  final String? vehicleDescription;
  final int? askingPrice;
  final String? priceType;
  final String? vehicleNumber;
  final List<String>? vehicleImages;
  final String? userId;
  final String? vehicleStatus;
  final bool? isFeatured;
  final DateTime? featuredExpiry;
  final int? vehicleViews;
  final VehicleLocation? vehicleLocation;
  final VehicleFilters? vehicleFilters;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  PostVehicleModel({
    this.id,
    this.vehicleTitle,
    this.vehicleCategory,
    this.vehicleSubCategory,
    this.vehicleDescription,
    this.askingPrice,
    this.priceType,
    this.vehicleNumber,
    this.vehicleImages,
    this.userId,
    this.vehicleStatus,
    this.isFeatured,
    this.featuredExpiry,
    this.vehicleViews,
    this.vehicleLocation,
    this.vehicleFilters,
    this.createdAt,
    this.updatedAt,
  });

  factory PostVehicleModel.fromJson(Map<String, dynamic> json) {
    return PostVehicleModel(
      id: json['_id'] as String?,
      vehicleTitle: json['vehicleTitle'] as String?,
      vehicleCategory: json['vehicleCategory'] as String?,
      vehicleSubCategory: json['vehicleSubCategory'] as String?,
      vehicleDescription: json['vehicleDescription'] as String?,
      askingPrice: json['askingPrice'] as int?,
      priceType: json['priceType'] as String?,
      vehicleNumber: json['vehicleNumber'] as String?,
      vehicleImages: json['vehicleImages'] != null ? List<String>.from(json['vehicleImages']) : null,
      userId: json['userId'] as String?,
      vehicleStatus: json['vehicleStatus'] as String?,
      isFeatured: json['isFeatured'] as bool?,
      featuredExpiry: json['featuredExpiry'] != null ? DateTime.tryParse(json['featuredExpiry']) : null,
      vehicleViews: json['vehicleViews'] as int?,
      vehicleLocation: json['vehicleLocation'] != null ? VehicleLocation.fromJson(json['vehicleLocation']) : null,
      vehicleFilters: json['vehicleFilters'] != null ? VehicleFilters.fromJson(json['vehicleFilters']) : null,
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.tryParse(json['updatedAt']) : null,
    );
  }
}

class VehicleLocation {
  final String? type;
  final List<double>? coordinates;
  final String? city;
  final String? district;
  final String? state;
  final String? pincode;

  VehicleLocation({this.type, this.coordinates, this.city, this.district, this.state, this.pincode});

  factory VehicleLocation.fromJson(Map<String, dynamic> json) {
    return VehicleLocation(
      type: json['type'] as String?,
      coordinates: json['coordinates'] != null ? List<double>.from(json['coordinates'].map((x) => x.toDouble())) : null,
      city: json['city'] as String?,
      district: json['district'] as String?,
      state: json['state'] as String?,
      pincode: json['pincode'] as String?,
    );
  }
}

class VehicleFilters {
  final int? price;
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
    this.price, this.brand, this.model, this.kmsDriven, this.registrationYear,
    this.fuelType, this.transmissionType, this.ownerType, this.bodyType, this.seatingCapacity
  });

  factory VehicleFilters.fromJson(Map<String, dynamic> json) {
    return VehicleFilters(
      price: json['price'] as int?,
      brand: json['brand'] as String?,
      model: json['model'] as String?,
      kmsDriven: json['kmsDriven'] as int?,
      registrationYear: json['registrationYear'] as int?,
      fuelType: json['fuelType'] as String?,
      transmissionType: json['transmissionType'] as String?,
      ownerType: json['ownerType'] as String?,
      bodyType: json['bodyType'] as String?,
      seatingCapacity: json['seatingCapacity']?.toString(), // Handle mixed types safely
    );
  }
}