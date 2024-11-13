import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../utils/constants/api_path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepo {
  Dio dio = Dio();
  Future<bool> login(String phone, String password) async {
    Response response;
    try {
      response = await dio.post(ApiPath.login,
          data: jsonEncode({
            "phone": int.parse(phone),
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
      response = await dio.post(ApiPath.learned,
          data: jsonEncode({
            "phone": phone,
            "full_name": fullName,
          }));
    } on DioException {
      return false;
    }
    return response.data["token"] != null;
  }

  Future<bool> contactAdd(String phone, String fullName, String className,
      String subject, String typePerson) async {
    Response response;
    try {
      response = await dio.post(ApiPath.contact,
          data: jsonEncode({
            "full_name": fullName,
            "phone": phone,
            "class": className,
            "subject": subject,
            "type_person": '',
          }));
    } on DioException {
      return false;
    }
    return response.data["token"] != null;
  }

  Future<String> getToken() async {
    final response = await Dio()
        .get('https://61df53d20f3bdb0017934a35.mockapi.io/se06/swaper');
    String mocktoken = response.data[0]['token'].toString();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', mocktoken);
    return mocktoken;
  }
}
