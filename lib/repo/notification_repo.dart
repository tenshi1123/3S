import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/constants/api_path.dart';
import '../modules/models/notification_model.dart';

class NotiRepo {
  Dio dio = Dio();

  Future<bool> checkHasNewNoti() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response = await dio.get(
      ApiPath.checkNoti,
    );
    return (response.data)['status'];
  }

  Future<List<NotiModel>> getListNotifications() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response = await dio.get(
      ApiPath.getListNoti,
    );
    List<NotiModel> result = ((response.data)['data'] as List)
        .map((e) => NotiModel.fromJson(e))
        .toList();
    return result;
  }

  Future updateStatus(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    await dio.post(ApiPath.getListNoti, data: {
      'notification_id': id,
    });
  }
}
