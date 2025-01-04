import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:three_s/main.dart';
import 'package:three_s/modules/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:three_s/modules/models/course_model.dart';
import 'package:three_s/modules/models/info_model.dart';
import 'package:three_s/modules/splash/onboarding.dart';
import 'package:three_s/repo/course_repo.dart';
import 'package:three_s/repo/info_repo.dart';
import 'package:three_s/repo/login_repo.dart';

import '../../repo/class_repo.dart';
import '../models/class_model.dart';

class Splshscreen extends StatefulWidget {
  const Splshscreen({super.key});
  @override
  State<Splshscreen> createState() => _SplshscreenState();
}

class _SplshscreenState extends State<Splshscreen> {
  bool checked = false;
  @override
  void initState() {
    super.initState();
    databaseInitialized();
    Timer(
      const Duration(seconds: 2),
      () async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        final String? token = prefs.getString('token');
        checked = (token != null && token != '');
        if (checked) {
          InfoModel infoModel = await InfoRepo().getInfo();
          List<UpcommingModel> upcommingModel =
              await CourseRepo().getUpcommingClass();
          List<ClassModel> listClass = await ClassRepo().listClass();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => BottomNavBar(
                    type: 0,
                    categories: listCate,
                    infoModel: infoModel,
                    upcommingModel: upcommingModel,
                    listClasses: listClass,
                  )),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Onbonding(),
            ),
          );
        }
      },
    );
  }

  Future<void> databaseInitialized() async {
    listCate = await CourseRepo().getListCategory();
    listBanner = await LoginRepo().getListBanner();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Image.asset(
        "assets/images/splash.png",
        height: 844.h,
        width: 390.w,
        fit: BoxFit.fill,
      ),
    );
  }
}
