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

class HomeWorkModel {
  final String image;
  final String name;
  final String timeDeadline;
  final String notes;
  final String nameTeacher;
  final String isSubmit;
  final String id;
  HomeWorkModel({
    required this.image,
    required this.name,
    required this.timeDeadline,
    required this.notes,
    required this.nameTeacher,
    required this.isSubmit,
    required this.id,
  });
  factory HomeWorkModel.fromJson(Map<String, dynamic> json) {
    return HomeWorkModel(
      image: json['course_schedule_img'],
      name: json['name'],
      timeDeadline: json['time_deadline'],
      notes: json['note'],
      nameTeacher: json['name_teacher'],
      isSubmit: json['is_submit_homework'],
      id: json['class_lesson_document_customer_id'],
    );
  }
}
