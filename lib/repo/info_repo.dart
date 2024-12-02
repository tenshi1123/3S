import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:three_s/modules/models/info_model.dart';
import 'package:three_s/repo/login_repo.dart';
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
    try {
      response = await dio.get(
        ApiPath.user,
      );
    } on DioException {
      String newToken = await LoginRepo().refreshToken();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', newToken);
      dio.options.headers['Authorization'] = 'Bearer $newToken';
      response = await dio.get(
        ApiPath.user,
      );
      return InfoModel.fromJson(response.data['data']);
    }
    return InfoModel.fromJson(response.data['data']);
  }

  Future deleteInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    await dio.post(
      ApiPath.deleteUser,
    );
  }

  Future<String> changePassword(
      String oldPass, String password, String newPass) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    Response response2;
    response = await dio.get(
      ApiPath.checkPassword,
      queryParameters: {
        'password': oldPass,
      },
    );
    if (response.data['message'] == "Mật khẩu đúng") {
      response2 = await dio.post(ApiPath.changePassword, data: {
        'password': password,
        're_password': newPass,
      });
      return response2.data['message'];
    } else {
      return response.data['message'];
    }
  }
}
