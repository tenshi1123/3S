import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:three_s/modules/models/class_model.dart';
import '../../utils/constants/api_path.dart';

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

  Future<InfoClassModel> getInfoClass(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response = await dio.get(
      ApiPath.detailClass,
      queryParameters: {
        'course_schedule_id': id,
      },
    );
    return InfoClassModel.fromJson(response.data);
  }

  Future<List<BaiTapModel>> getListBT(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response = await dio.get(
      ApiPath.homeworkSubmited,
      queryParameters: {
        'course_schedule_id': id,
      },
    );
    return List<BaiTapModel>.from(
      response.data['data'].map(
        (e) => BaiTapModel.fromJson(e),
      ),
    );
  }

  Future<InfoCheckinModel> getInfoHomework(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response = await dio.get(
      ApiPath.detailRollCall,
      queryParameters: {
        'event_checkin_off_id': id,
      },
    );
    return InfoCheckinModel.fromJson(response.data);
  }

  Future<List<DetailHomeWorkModel>> getDetailHomework(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    Response response;
    response = await dio.get(
      ApiPath.detailHomework,
      queryParameters: {
        'class_lesson_document_customer_id': id,
      },
    );
    if ((response.data)['detail_homework'] == null) {
      return [];
    }
    List<DetailHomeWorkModel> result =
        ((response.data)['detail_homework'] as List)
            .map((e) => DetailHomeWorkModel.fromJson(e))
            .toList();
    return result;
  }

  Future uploadExcercise(String id, List<File> photo) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    var formData = FormData.fromMap({
      'class_lesson_document_id': id,
      // 'file': [
      //   await MultipartFile.fromFile(photo[0].path,
      //       filename: photo[0].path.split('/').last),
      // ]
    });
    for (var file in photo) {
      formData.files.addAll([
        MapEntry(
            "file[]",
            await MultipartFile.fromFile(file.path,
                filename: file.path.split('/').last)),
      ]);
    }
    await dio.post(ApiPath.uploadHomeWork, data: formData);
  }

  Future showExcercise(String id, List<File> photo) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    dio.options.headers['Authorization'] = 'Bearer $token';
    await dio.get(
      ApiPath.detailHomework,
      queryParameters: {
        'course_schedule_id': id,
      },
    );
  }
}
