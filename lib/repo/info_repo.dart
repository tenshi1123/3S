import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:three_s/modules/models/info_model.dart';
import '../../utils/constants/api_path.dart';

class InfoRepo {
  Dio dio = Dio();
  // Future<List<CourseModel>> getListCourse() async {
  //   Response response;
  //   response = await dio.get(
  //     ApiPath.course,
  //     queryParameters: {'limit': 8, 'page': 1, 'category_id': ''},
  //   );
  //   List<CourseModel> result = ((response.data)['courses'] as List)
  //       .map((e) => CourseModel.fromJson(e))
  //       .toList();
  //   return result;
  // }

  Future<InfoModel> getInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response = await dio.get(
      ApiPath.user,
    );
    return InfoModel.fromJson(response.data['data']);
  }
}
