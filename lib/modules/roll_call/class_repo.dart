import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:three_s/modules/models/class_model.dart';
import '../../../utils/constants/api_path.dart';

class ClassRepo {
  Dio dio = Dio();
  Future<List<ClassModel>> listClass() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response = await dio.get(
      ApiPath.lopHoc,
    );
    List<ClassModel> result = ((response.data)['class'] as List)
        .map((e) => ClassModel.fromJson(e))
        .toList();
    return result;
  }

  Future<InfoClassModel> getInfoClass() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response = await dio.get(
      ApiPath.lopHoc,
    );
    return InfoClassModel.fromJson(response.data);
  }
}
