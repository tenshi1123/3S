import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_s/main.dart';
import 'package:three_s/modules/splash/onboarding.dart';
import 'package:three_s/repo/course_repo.dart';

class Splshscreen extends StatefulWidget {
  const Splshscreen({super.key});
  @override
  State<Splshscreen> createState() => _SplshscreenState();
}

class _SplshscreenState extends State<Splshscreen> {
  @override
  void initState() {
    super.initState();
    databaseInitialized();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Onbonding(),
        ),
      ),
    );
  }

  Future<void> databaseInitialized() async {
    listCate = await CourseRepo().getListCategory();
    listCourse = await CourseRepo().getListCourse();
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
