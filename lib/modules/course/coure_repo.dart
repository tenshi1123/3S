import 'package:dio/dio.dart';
import 'package:three_s/modules/models/course_model.dart';
import '../../../utils/constants/api_path.dart';

class CourseRepo {
  Future<List<CourseModel>> getAllNotification() async {
    Dio dio = Dio();
    dio.options.headers['Authorization'] =
        'Bearer MDZhNzk1MzktYmRlZS00M2RhLWFjOTctZTlhMDFmNzJlYTYx';
    Response response;
    response = await dio.get(
      ApiPath.course,
      queryParameters: {'app_id': '1f643336-9d73-4c65-ac00-38d499b8c462'},
    );
    List<CourseModel> result = ((response.data)['notifications'] as List)
        .map((e) => CourseModel.fromJson(e))
        .toList();
    return result;
  }
}
