import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/constants/api_path.dart';
import '../modules/models/report_model.dart';

class ReportRepo {
  Dio dio = Dio();

  Future<List<ScheduleModel>> getSchedule() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response = await dio.get(
      ApiPath.reportSchedule,
    );
    List<ScheduleModel> result = ((response.data)['data'] as List)
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
