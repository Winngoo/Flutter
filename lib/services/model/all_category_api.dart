class Subcategory {
  String? subcategoryName;

  Subcategory({this.subcategoryName});

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
      subcategoryName:
          json['subcategory_name'], // Adjust field name as per your API
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subcategory_name'] = this.subcategoryName;
    return data;
  }
}


class AllCategoryAPI {
  final int id;
  final String categoryNameEn;
  final String categorySlugEn;
  final String categoryIcon;
  final String categoryImage; // This should be a URL to a network image
  final String categoryBannerImage;

  AllCategoryAPI({
    required this.id,
    required this.categoryNameEn,
    required this.categorySlugEn,
    required this.categoryIcon,
    required this.categoryImage,
    required this.categoryBannerImage,
  });

  factory AllCategoryAPI.fromJson(Map<String, dynamic> json) {
    return AllCategoryAPI(
      id: json['id'],
      categoryNameEn: json['category_name_en'],
      categorySlugEn: json['category_slug_en'],
      categoryIcon: json['category_icon'],
      categoryImage: json['category_image'], // Should be a network image URL
      categoryBannerImage: json['category_banner_image'],
    );
  }
}
