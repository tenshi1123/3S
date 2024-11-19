import 'package:dio/dio.dart';
import '../../utils/constants/api_path.dart';
import '../modules/models/report_model.dart';

class ReportRepo {
  Dio dio = Dio();
  Future<List<ScheduleModel>> getSchedule() async {
    Response response;
    response = await dio.get(
      ApiPath.reportSchedule,
      queryParameters: {'limit': 8, 'page': 1, 'category_id': ''},
    );
    List<ScheduleModel> result = ((response.data)['courses'] as List)
        .map((e) => ScheduleModel.fromJson(e))
        .toList();
    return result;
  }

  Future<List<ScheduleModel>> getReportPoint() async {
    Response response;
    response = await dio.get(
      ApiPath.reportSchedule,
      queryParameters: {'limit': 8, 'page': 1, 'category_id': ''},
    );
    List<ScheduleModel> result = ((response.data)['courses'] as List)
        .map((e) => ScheduleModel.fromJson(e))
        .toList();
    return result;
  }
}
