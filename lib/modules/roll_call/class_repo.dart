import 'package:dio/dio.dart';
import 'package:three_s/modules/models/class_model.dart';
import 'package:three_s/utils/constants/string_constatns.dart';
import '../../../utils/constants/api_path.dart';
import 'package:sp_util/sp_util.dart';

class ClassRepo {
  Dio dio = Dio();
  Future<List<ClassModel>> listClass() async {
    dio.options.headers['Authorization'] =
        'Bearer ${SpUtil.getString(ConstString.token)}';
    Response response;
    response = await dio.get(
      ApiPath.lopHoc,
    );
    List<ClassModel> result = ((response.data)['class'] as List)
        .map((e) => ClassModel.fromJson(e))
        .toList();
    return result;
  }
}
