class CategoryModel {
  String? id;
  String? categoryName;
  String? categorySlug;
  List<String>? categoryImage;
  bool? isCategoryActive;
  List<Subcategories>? subcategories;
  DateTime? createdAt;
  DateTime? updatedAt;

  CategoryModel({
    this.id,
    this.categoryName,
    this.categorySlug,
    this.categoryImage,
    this.isCategoryActive,
    this.subcategories,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['_id'],
      categoryName: json['categoryName'],
      categorySlug: json['categorySlug'],
      categoryImage: json['categoryImage'] != null
          ? List<String>.from(json['categoryImage'])
          : null,
      isCategoryActive: json['isCategoryActive'],
      subcategories: json['subcategories'] != null
          ? (json['subcategories'] as List)
          .map((v) => Subcategories.fromJson(v))
          .toList()
          : null,
      // Converting String to DateTime
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['categoryName'] = categoryName;
    data['categorySlug'] = categorySlug;
    data['categoryImage'] = categoryImage;
    data['isCategoryActive'] = isCategoryActive;
    if (subcategories != null) {
      data['subcategories'] = subcategories!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = createdAt?.toIso8601String();
    data['updatedAt'] = updatedAt?.toIso8601String();
    return data;
  }
}

class Subcategories {
  String? subCatName;
  String? subCatSlug;

  Subcategories({this.subCatName, this.subCatSlug});

  factory Subcategories.fromJson(Map<String, dynamic> json) {
    return Subcategories(
      subCatName: json['subcatname'],
      subCatSlug: json['subcatslug'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subcatname'] = subCatName;
    data['subcatslug'] = subCatSlug;
    return data;
  }
}