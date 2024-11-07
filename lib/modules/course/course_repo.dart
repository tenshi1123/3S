import 'package:dio/dio.dart';
import 'package:three_s/modules/models/course_model.dart';
import '../../../utils/constants/api_path.dart';

class CourseRepo {
  Dio dio = Dio();
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
}
