import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:three_s/modules/models/course_model.dart';
import '../../utils/constants/api_path.dart';

class CourseRepo {
  Dio dio = Dio();
  //danh sách khóa học
  Future<List<CourseModel>> getListCourse() async {
    Response response;
    response = await dio.get(
      ApiPath.course,
      queryParameters: {'limit': 8, 'page': 1, 'category_id': ''},
    );
    List<CourseModel> result = ((response.data)['courses'] as List)
        .map((e) => CourseModel.fromJson(e))
        .toList();
    return result;
  }

  // danh sách danh mục
  Future<List<CategoryModel>> getListCategory() async {
    Response response;
    response = await dio.get(
      ApiPath.category,
    );
    List<CategoryModel> result = ((response.data)['data'] as List)
        .map((e) => CategoryModel.fromJson(e))
        .toList();
    return result;
  }

  //lịch học sắp tới
  Future<List<UpcommingModel>> getUpcommingClass() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response = await dio.get(
      ApiPath.schedule,
    );
    List<UpcommingModel> result = ((response.data)['schedule'] as List)
        .map((e) => UpcommingModel.fromJson(e))
        .toList();
    return result;
  }
}
