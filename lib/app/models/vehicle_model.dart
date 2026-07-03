class VehicleModel {
  VehicleLocation? vehicleLocation;
  VehicleFilters? vehicleFilters;
  VehicleRtoDetails? vehicleRtoDetails;
  String? id;
  String? vehicleCategory;
  String? vehicleSubCategory;
  String? vehicleDescription;
  int? askingPrice;
  String? priceType;
  String? vehicleNumber;
  List<String>? vehicleImages;
  UserId? userId;

  @override
  String toString() {
    return 'VehicleModel{vehicleLocation: $vehicleLocation, vehicleFilters: $vehicleFilters, vehicleRtoDetails: $vehicleRtoDetails, id: $id, vehicleCategory: $vehicleCategory, vehicleSubCategory: $vehicleSubCategory, vehicleDescription: $vehicleDescription, askingPrice: $askingPrice, priceType: $priceType, vehicleNumber: $vehicleNumber, vehicleImages: $vehicleImages, userId: $userId, userID: $userID, vehicleStatus: $vehicleStatus, isFeatured: $isFeatured, featuredExpiry: $featuredExpiry, vehicleViews: $vehicleViews, createdAt: $createdAt, updatedAt: $updatedAt}';
  }

  String? userID;
  String? vehicleStatus;
  bool? isFeatured;
  DateTime? featuredExpiry;
  int? vehicleViews;
  DateTime? createdAt;
  DateTime? updatedAt;

  VehicleModel({
    this.vehicleLocation,
    this.vehicleFilters,
    this.vehicleRtoDetails,
    this.id,
    this.vehicleCategory,
    this.vehicleSubCategory,
    this.vehicleDescription,
    this.askingPrice,
    this.priceType,
    this.vehicleNumber,
    this.vehicleImages,
    this.userId,
    this.userID,
    this.vehicleStatus,
    this.isFeatured,
    this.featuredExpiry,
    this.vehicleViews,
    this.createdAt,
    this.updatedAt,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      vehicleLocation: json['vehicleLocation'] != null
          ? VehicleLocation.fromJson(json['vehicleLocation'])
          : null,
      vehicleFilters: json['vehicleFilters'] != null
          ? VehicleFilters.fromJson(json['vehicleFilters'])
          : null,
      vehicleRtoDetails: json['vehicle_rto_details'] != null
          ? VehicleRtoDetails.fromJson(json['vehicle_rto_details'])
          : null,
      id: json['_id'],
      vehicleCategory: json['vehicleCategory'],
      vehicleSubCategory: json['vehicleSubCategory'],
      vehicleDescription: json['vehicleDescription'],
      askingPrice: json['askingPrice'],
      priceType: json['priceType'],
      vehicleNumber: json['vehicleNumber'],
      vehicleImages: json['vehicleImages'] != null
          ? List<String>.from(json['vehicleImages'])
          : null,
      userId: json['userId'] != null ? json['userId'] is String ? null : UserId.fromJson(json['userId']) : null,
      userID: json['userId'] != null ? json['userId'] is String ? json['userId'] : '' : null,
      vehicleStatus: json['vehicleStatus'],
      isFeatured: json['isFeatured'],
      featuredExpiry: json['featuredExpiry'] != null
          ? DateTime.tryParse(json['featuredExpiry'])
          : null,
      vehicleViews: json['vehicleViews'],
      createdAt: json['createdAt'] != null ? DateTime.tryParse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.tryParse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (vehicleLocation != null) data['vehicleLocation'] = vehicleLocation!.toJson();
    if (vehicleFilters != null) data['vehicleFilters'] = vehicleFilters!.toJson();
    if (vehicleRtoDetails != null) data['vehicle_rto_details'] = vehicleRtoDetails!.toJson();
    data['_id'] = id;
    data['vehicleCategory'] = vehicleCategory;
    data['vehicleSubCategory'] = vehicleSubCategory;
    data['vehicleDescription'] = vehicleDescription;
    data['askingPrice'] = askingPrice;
    data['priceType'] = priceType;
    data['vehicleNumber'] = vehicleNumber;
    data['vehicleImages'] = vehicleImages;
    if (userId != null) data['userId'] = userId!.toJson();
    data['vehicleStatus'] = vehicleStatus;
    data['isFeatured'] = isFeatured;
    data['featuredExpiry'] = featuredExpiry?.toIso8601String();
    data['vehicleViews'] = vehicleViews;
    data['createdAt'] = createdAt?.toIso8601String();
    data['updatedAt'] = updatedAt?.toIso8601String();
    return data;
  }
}

class VehicleLocation {
  LocationCoord? locationCoord;
  String? localPlace;
  String? localCircle;
  String? city;
  String? district;
  String? state;
  String? pincode;

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
      localPlace: json['local_place'],
      localCircle: json['local_circle'],
      city: json['city'],
      district: json['district'],
      state: json['state'],
      pincode: json['pincode'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (locationCoord != null) data['location_coord'] = locationCoord!.toJson();
    data['local_place'] = localPlace;
    data['local_circle'] = localCircle;
    data['city'] = city;
    data['district'] = district;
    data['state'] = state;
    data['pincode'] = pincode;
    return data;
  }
}

class LocationCoord {
  String? type;
  List<double>? coordinates;

  LocationCoord({this.type, this.coordinates});

  factory LocationCoord.fromJson(Map<String, dynamic> json) {
    return LocationCoord(
      type: json['type'],
      coordinates: json['coordinates'] != null ? List<double>.from(json['coordinates']) : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {'type': type, 'coordinates': coordinates};
  }
}

class VehicleFilters {
  String? brand;
  String? model;
  int? kmsDriven;
  int? registrationYear;
  String? fuelType;
  String? transmissionType;
  String? ownerType;
  String? bodyType;
  String? seatingCapacity;

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
      brand: json['brand'],
      model: json['model'],
      kmsDriven: json['kmsDriven'],
      registrationYear: json['registrationYear'],
      fuelType: json['fuelType'],
      transmissionType: json['transmissionType'],
      ownerType: json['ownerType'],
      bodyType: json['bodyType'],
      seatingCapacity: json['seatingCapacity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'brand': brand,
      'model': model,
      'kmsDriven': kmsDriven,
      'registrationYear': registrationYear,
      'fuelType': fuelType,
      'transmissionType': transmissionType,
      'ownerType': ownerType,
      'bodyType': bodyType,
      'seatingCapacity': seatingCapacity,
    };
  }
}

class VehicleRtoDetails {
  String? rtoCode;
  String? rtoState;
  dynamic rtoNumber; // Use dynamic or String? because it was null in sample
  String? rtoAddress;

  VehicleRtoDetails({this.rtoCode, this.rtoState, this.rtoNumber, this.rtoAddress});

  factory VehicleRtoDetails.fromJson(Map<String, dynamic> json) {
    return VehicleRtoDetails(
      rtoCode: json['RTO_Code'],
      rtoState: json['RTO_state'],
      rtoNumber: json['RTO_number'],
      rtoAddress: json['RTO_address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'RTO_Code': rtoCode,
      'RTO_state': rtoState,
      'RTO_number': rtoNumber,
      'RTO_address': rtoAddress,
    };
  }
}

class UserId {
  String? id;
  String? userName;
  String? userEmail;

  UserId({this.id, this.userName, this.userEmail});

  factory UserId.fromJson(Map<String, dynamic> json) {
    return UserId(
      id: json['_id'],
      userName: json['userName'],
      userEmail: json['userEmail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'_id': id, 'userName': userName, 'userEmail': userEmail};
  }
}