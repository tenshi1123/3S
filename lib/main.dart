import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:three_s/modules/models/course_model.dart';
import 'app.dart';

List<CategoryModel> listCate = [];
List<CourseModel> listCourse = [];
List<String> listBanner = [];
bool hasNewNoti = false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    initializeDateFormatting().then((_) => runApp(const App()));
  });
}
