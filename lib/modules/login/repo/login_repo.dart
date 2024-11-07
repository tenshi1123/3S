import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../utils/constants/api_path.dart';

class LoginRepo {
  Dio dio = Dio();
  Future<bool> login(String phone, String password) async {
    Response response;
    try {
      response = await dio.post(ApiPath.login,
          data: jsonEncode({
            "phone": phone,
            "password": password,
          }));
    } on DioException {
      return false;
    }
    return response.data["token"] != null;
  }

  Future<bool> contactLearned(String phone, String fullName) async {
    Response response;
    try {
      response = await dio.post(ApiPath.login,
          data: jsonEncode({
            "phone": phone,
            "full_name": fullName,
          }));
    } on DioException {
      return false;
    }
    return response.data["token"] != null;
  }

  Future<bool> contactAdd(String phone, String fullName) async {
    Response response;
    try {
      response = await dio.post(ApiPath.login,
          data: jsonEncode({
            "full_name": fullName,
            "phone": phone,
            "class": '',
            "subject": '',
            "type_person": '',
          }));
    } on DioException {
      return false;
    }
    return response.data["token"] != null;
  }
}
