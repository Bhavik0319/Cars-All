class UserLocationModel {
  final String? name;
  final String? district;
  final String? state;
  final int? pincode;

  UserLocationModel({
    this.name,
    this.district,
    this.state,
    this.pincode,
  });

  @override
  String toString() {
    return 'UserLocationModel{name: $name, district: $district, state: $state, pincode: $pincode}';
  }


  factory UserLocationModel.fromJson(Map<String, dynamic> json) {
    return UserLocationModel(
      name: json['name'] as String?,
      district: json['district'] as String?,
      state: json['state'] as String?,
      pincode: json['pincode'] as int?,
    );
  }

  // Method to convert a LocationModel instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'district': district,
      'state': state,
      'pincode': pincode,
    };
  }
}