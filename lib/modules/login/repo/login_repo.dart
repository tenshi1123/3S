import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../utils/constants/api_path.dart';

class LoginRepo {
  Future<bool> login(String phone, String password) async {
    Dio dio = Dio();
    Response response;
    try {
      response = await dio.post(ApiPath.login,
          data: jsonEncode({
            'phone': 0971981983,
            'password': password,
          }));
    } on DioException {
      return false;
    }
    return response.data["token"] != null;
  }
}
