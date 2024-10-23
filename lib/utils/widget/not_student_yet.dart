import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_s/utils/constants/styles.dart';

class NotStudentYet extends StatelessWidget {
  const NotStudentYet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Bạn chưa là học sinh",
          style: defaultText16.copyWith(
            fontWeight: FontWeight.w600,
            color: const Color(0xff3C3C3C),
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Image.asset(
              'assets/images/nodata.png',
              height: 172.h,
              width: 258.w,
            ),
          ),
          Text(
            "Bạn chưa là học sinh",
            style: defaultText16.copyWith(
                fontWeight: FontWeight.w600, color: const Color(0xff3C3C3C)),
          ),
        ],
      ),
    );
  }
}
