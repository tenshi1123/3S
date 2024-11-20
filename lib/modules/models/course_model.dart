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

class UpcommingModel {
  final String img;
  final String name;
  final String buoiHoc;
  final String createdDate;
  final String timeStart;
  final String timeEnd;
  UpcommingModel({
    required this.img,
    required this.name,
    required this.buoiHoc,
    required this.createdDate,
    required this.timeStart,
    required this.timeEnd,
  });
  factory UpcommingModel.fromJson(Map<String, dynamic> json) {
    return UpcommingModel(
      img: json['course_schedule_img'] ?? '',
      name: json['course_name'] ?? '',
      buoiHoc: json['buoi_hoc'] ?? '',
      createdDate: json['created_date'] ?? '',
      timeStart: json['time_start'] ?? '',
      timeEnd: json['time_end'] ?? '',
    );
  }
}
