import 'dart:convert';

class PincodeModel {
  final String? name;
  final String? description;
  final String? branchType;
  final String? deliveryStatus;
  final String? taluk;
  final String? circle;
  final String? district;
  final String? division;
  final String? region;
  final String? state;
  final String? country;

  PincodeModel({
    this.name,
    this.description,
    this.branchType,
    this.deliveryStatus,
    this.taluk,
    this.circle,
    this.district,
    this.division,
    this.region,
    this.state,
    this.country,
  });

  factory PincodeModel.fromJson(Map<String, dynamic> json) {
    return PincodeModel(
      name: json['Name'] as String?,
      description: json['Description'] as String?,
      branchType: json['BranchType'] as String?,
      deliveryStatus: json['DeliveryStatus'] as String?,
      taluk: json['Taluk'] as String?,
      circle: json['Circle'] as String?,
      district: json['District'] as String?,
      division: json['Division'] as String?,
      region: json['Region'] as String?,
      state: json['State'] as String?,
      country: json['Country'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Description': description,
      'BranchType': branchType,
      'DeliveryStatus': deliveryStatus,
      'Taluk': taluk,
      'Circle': circle,
      'District': district,
      'Division': division,
      'Region': region,
      'State': state,
      'Country': country,
    };
  }
}