import 'package:dio/dio.dart';
import '../utils/constants/api_path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepo {
  Dio dio = Dio();
  Future<bool> login(String phone, String password) async {
    Response response;
    var formData = FormData.fromMap({
      'phone': phone,
      'password': password,
    });
    try {
      response = await dio.post(
        ApiPath.login,
        data: formData,
      );
    } on DioException {
      return false;
    }
    if (response.data['status'] == false) {
      return false;
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', response.data['data']["refresh_token"]);
    return response.data['data']["refresh_token"] != null;
  }

  Future<String> refreshToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    try {
      response = await dio.get(ApiPath.refreshToken);
    } on DioException {
      return '';
    }
    await prefs.setString('token', response.data['data']["refresh_token"]);
    return response.data['data']["refresh_token"];
  }

  Future<String> contactLearned(String phone, String fullName) async {
    Response response;
    var formData = FormData.fromMap({
      'phone': phone,
      'full_name': fullName,
    });
    try {
      response = await dio.post(
        ApiPath.learned,
        data: formData,
      );
    } on DioException {
      return '';
    }
    return response.data["message"];
  }

  Future<String> contactAdd(String phone, String fullName, String className,
      String subject, String typePerson) async {
    Response response;
    var formData = FormData.fromMap({
      "full_name": fullName,
      "phone": phone,
      "class": className,
      "subject": subject,
      "type_person": typePerson,
    });
    try {
      response = await dio.post(
        ApiPath.contact,
        data: formData,
      );
    } on DioException {
      return '';
    }
    return response.data["message"];
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
