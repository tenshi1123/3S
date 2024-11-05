class CategoryModel {
  final String name;
  final String id;
  CategoryModel({
    required this.name,
    required this.id,
  });
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['category_name'] ?? '',
      id: json['id'] ?? '',
    );
  }
}

class CourseModel {
  final String name;
  final String id;
  final String price;
  final String priceOld;
  final String duration;
  CourseModel({
    required this.name,
    required this.id,
    required this.price,
    required this.priceOld,
    required this.duration,
  });
  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      name: json['name'] ?? '',
      id: json['id'] ?? '',
      price: json['price'] ?? '',
      priceOld: json['price_old'] ?? '',
      duration: json['duration'] ?? '',
    );
  }
}
