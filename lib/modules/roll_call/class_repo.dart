import 'package:dio/dio.dart';
import 'package:three_s/modules/models/course_model.dart';
import 'package:three_s/utils/constants/string_constatns.dart';
import '../../../utils/constants/api_path.dart';
import 'package:sp_util/sp_util.dart';

class CourseRepo {
  Dio dio = Dio();
  Future<List<CourseModel>> listClass() async {
    dio.options.headers['Authorization'] =
        'Bearer ${SpUtil.getString(ConstString.token)}';
    Response response;
    response = await dio.get(
      ApiPath.lopHoc,
    );
    List<CourseModel> result = ((response.data)['courses'] as List)
        .map((e) => CourseModel.fromJson(e))
        .toList();
    return result;
  }
}
