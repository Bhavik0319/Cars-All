class VehicleDetailModel {
  final String? id;
  final VehicleLocation? location;
  final VehicleFilters? filters;
  final RtoDetails? rtoDetails;
  final String? category;
  final String? subCategory;
  final String? description;
  final int? askingPrice;
  final String? priceType;
  final List<String>? images;
  final VehicleUser? user;

  @override
  String toString() {
    return 'VehicleDetailModel{id: $id, location: $location, filters: $filters, rtoDetails: $rtoDetails, category: $category, subCategory: $subCategory, description: $description, askingPrice: $askingPrice, priceType: $priceType, images: $images, user: $user, status: $status, isFeatured: $isFeatured, views: $views, createdAt: $createdAt, updatedAt: $updatedAt}';
  } // Detailed nested user
  final String? status;
  final bool? isFeatured;
  final int? views;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  VehicleDetailModel({
    this.id,
    this.location,
    this.filters,
    this.rtoDetails,
    this.category,
    this.subCategory,
    this.description,
    this.askingPrice,
    this.priceType,
    this.images,
    this.user,
    this.status,
    this.isFeatured,
    this.views,
    this.createdAt,
    this.updatedAt,
  });

  factory VehicleDetailModel.fromJson(Map<String, dynamic> json) {
    return VehicleDetailModel(
      id: json['_id'] as String?,
      location: json['vehicleLocation'] != null ? VehicleLocation.fromJson(json['vehicleLocation']) : null,
      filters: json['vehicleFilters'] != null ? VehicleFilters.fromJson(json['vehicleFilters']) : null,
      rtoDetails: json['vehicle_rto_details'] != null ? RtoDetails.fromJson(json['vehicle_rto_details']) : null,
      category: json['vehicleCategory'] as String?,
      subCategory: json['vehicleSubCategory'] as String?,
      description: json['vehicleDescription'] as String?,
      askingPrice: json['askingPrice'] as int?,
      priceType: json['priceType'] as String?,
      images: json['vehicleImages'] != null ? List<String>.from(json['vehicleImages']) : [],
      user: json['userId'] != null ? VehicleUser.fromJson(json['userId']) : null,
      status: json['vehicleStatus'] as String?,
      isFeatured: json['isFeatured'] as bool?,
      views: json['vehicleViews'] as int?,
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.tryParse(json['updatedAt']) : null,
    );
  }
}

class VehicleUser {
  final String? id;
  final String? userName;
  final List<String>? userProfileImage;
  final String? userEmail;
  final String? userPhone;
  final bool? isPhoneShare;
  final String? userType;
  final bool? isUserActive;
  final DateTime? createdAt;

  VehicleUser({
    this.id,
    this.userName,
    this.userProfileImage,
    this.userEmail,
    this.userPhone,
    this.isPhoneShare,
    this.userType,
    this.isUserActive,
    this.createdAt,
  });

  factory VehicleUser.fromJson(Map<String, dynamic> json) {
    return VehicleUser(
      id: json['_id'] as String?,
      userName: json['userName'] as String?,
      userProfileImage: json['userProfileImage'] != null ? List<String>.from(json['userProfileImage']) : [],
      userEmail: json['userEmail'] as String?,
      userPhone: json['userPhone'] as String?,
      isPhoneShare: json['isPhoneShare'] as bool?,
      userType: json['userType'] as String?,
      isUserActive: json['isUserActive'] as bool?,
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt']) : null,
    );
  }

  String get profilePic => (userProfileImage != null && userProfileImage!.isNotEmpty)
      ? userProfileImage!.first
      : 'https://via.placeholder.com/150';
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
      rtoNumber: json['RTO_number'].toString() as String?,
      rtoAddress: json['RTO_address'] as String?,
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
  final int? hoursOperated;

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
    this.hoursOperated,
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
      seatingCapacity: json['seatingCapacity']?.toString(), // Safely convert "5" to String
      hoursOperated: json['hrOperator'] as int?,
    );
  }
}

class VehicleLocation {
  final LocationCord? locationCord;
  final String? localPlace;
  final String? localCircle;
  final String? city;
  final String? district;
  final String? state;
  final String? pincode;

  VehicleLocation({
    this.locationCord,
    this.localPlace,
    this.localCircle,
    this.city,
    this.district,
    this.state,
    this.pincode,
  });

  factory VehicleLocation.fromJson(Map<String, dynamic> json) {
    return VehicleLocation(
      locationCord: json['location_coord'] != null
          ? LocationCord.fromJson(json['location_coord'])
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

class LocationCord {
  final String? type;
  final List<double>? coordinates;

  LocationCord({this.type, this.coordinates});

  factory LocationCord.fromJson(Map<String, dynamic> json) {
    return LocationCord(
      type: json['type'] as String?,
      coordinates: json['coordinates'] != null
          ? List<double>.from(json['coordinates'].map((x) => x.toDouble()))
          : null,
    );
  }
}