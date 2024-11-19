class ReportPoint {
  final String pointAvg;
  final List<ListPointModel> listPoints;
  ReportPoint({
    required this.pointAvg,
    required this.listPoints,
  });
  factory ReportPoint.fromJson(Map<String, dynamic> json) {
    return ReportPoint(
        pointAvg: json['point_avg'] ?? '',
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
  final String caculatorAvg;
  final String name;
  ScheduleModel({
    required this.id,
    required this.caculatorAvg,
    required this.name,
  });
  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
      id: json['course_schedule_id'] ?? '',
      caculatorAvg: json['course_name'] ?? '',
      name: json['date_open'] ?? '',
    );
  }
}
