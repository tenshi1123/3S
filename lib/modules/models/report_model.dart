class ReportPoint {
  final int? pointAvg;
  final List<ListPointModel> listPoints;
  ReportPoint({
    required this.pointAvg,
    required this.listPoints,
  });
  factory ReportPoint.fromJson(Map<String, dynamic> json) {
    return ReportPoint(
        pointAvg: int.tryParse(json['point_avg'] ?? ''),
        listPoints: List<ListPointModel>.from(
          json['list'].map(
            (e) => ListPointModel.fromJson(e),
          ),
        ));
  }
}

class ListPointModel {
  final String point;
  final String caculatorAvg;
  final String name;
  final String id;
  ListPointModel({
    required this.point,
    required this.caculatorAvg,
    required this.name,
    required this.id,
  });
  factory ListPointModel.fromJson(Map<String, dynamic> json) {
    return ListPointModel(
      point: json['point'] ?? '',
      caculatorAvg: json['caculator_avg'] ?? '',
      name: json['name'] ?? '',
      id: json['event_checkin_off_id'] ?? '',
    );
  }
}

class ScheduleModel {
  final String id;
  final String name;
  final String date;
  ScheduleModel({
    required this.id,
    required this.name,
    required this.date,
  });
  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
      id: json['course_schedule_id'] ?? '',
      name: json['course_name'] ?? '',
      date: json['date_open'] ?? '',
    );
  }
}
