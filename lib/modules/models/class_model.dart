class ClassModel {
  final String id;
  final String img;
  final String courseName;
  final String dateOpen;
  final String missed;
  final String finished;
  ClassModel({
    required this.id,
    required this.img,
    required this.courseName,
    required this.dateOpen,
    required this.missed,
    required this.finished,
  });
  factory ClassModel.fromJson(Map<String, dynamic> json) {
    return ClassModel(
      id: json['course_schedule_id'] ?? '',
      img: json['course_schedule_img'] ?? '',
      courseName: json['course_name'] ?? '',
      dateOpen: json['date_open'] ?? '',
      missed: json['vang_mat'] ?? '',
      finished: json['hoan_thanh'] ?? '',
    );
  }
}

class AttendanceModel {
  final String id;
  final String img;
  final String courseName;
  final String dateOpen;
  final String missed;
  final String finished;
  AttendanceModel({
    required this.id,
    required this.img,
    required this.courseName,
    required this.dateOpen,
    required this.missed,
    required this.finished,
  });
  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return AttendanceModel(
      id: json['course_schedule_id'] ?? '',
      img: json['course_schedule_img'] ?? '',
      courseName: json['course_name'] ?? '',
      dateOpen: json['date_open'] ?? '',
      missed: json['vang_mat'] ?? '',
      finished: json['hoan_thanh'] ?? '',
    );
  }
}
