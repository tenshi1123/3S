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
  final String buoiHoc;
  final String createdDate;
  final String timeStart;
  final String timeEnd;
  final String id;
  final String nameTeacher;
  final String gvStatus;
  AttendanceModel({
    required this.buoiHoc,
    required this.createdDate,
    required this.timeStart,
    required this.timeEnd,
    required this.id,
    required this.nameTeacher,
    required this.gvStatus,
  });
  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return AttendanceModel(
      buoiHoc: json['buoi_hoc'] ?? '',
      createdDate: json['created_date'] ?? '',
      timeStart: json['time_start'] ?? '',
      timeEnd: json['time_end'] ?? '',
      id: json['event_checkin_off_id'] ?? '',
      nameTeacher: json['name_teacher'] ?? '',
      gvStatus: json['gv_status'] ?? '',
    );
  }
}

class InfoClassModel {
  final String title;
  final List<AttendanceModel> attributes;
  InfoClassModel({
    required this.title,
    required this.attributes,
  });
  factory InfoClassModel.fromJson(Map<String, dynamic> json) {
    return InfoClassModel(
        title: json['title'],
        attributes: List<AttendanceModel>.from(
          json['attendance'].map(
            (e) => AttendanceModel.fromJson(e),
          ),
        ));
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

class DocumentModel {
  final String image;
  final String name;
  DocumentModel({
    required this.image,
    required this.name,
  });
  factory DocumentModel.fromJson(Map<String, dynamic> json) {
    return DocumentModel(
      image: json['course_schedule_img'],
      name: json['name'],
    );
  }
}

class InfoCheckinModel {
  final List<HomeWorkModel> homeWork;
  final List<DocumentModel> document;
  InfoCheckinModel({
    required this.homeWork,
    required this.document,
  });
  factory InfoCheckinModel.fromJson(Map<String, dynamic> json) {
    return InfoCheckinModel(
      homeWork: List<HomeWorkModel>.from(
        json['document'].map(
          (e) => HomeWorkModel.fromJson(e),
        ),
      ),
      document: List<DocumentModel>.from(
        json['lesson'].map(
          (e) => DocumentModel.fromJson(e),
        ),
      ),
    );
  }
}
