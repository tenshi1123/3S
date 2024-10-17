import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_s/utils/constants/styles.dart';
import '../../utils/constants/color.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Center(child: Text('Khóa Học Của Tôi')),
          backgroundColor: Colors.white,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Đang học',
              ),
              Tab(
                text: 'Hoàn thành',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Column(
              children: [
                Image.asset(
                  'assets/images/nodata.png',
                  height: 172.h,
                  width: 258.w,
                ),
                Text(
                  "Bạn chưa có khóa học",
                  style: defaultText16.copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff3C3C3C)),
                ),
                Text(
                  "Hãy tìm khóa học phù hợp nhé!",
                  style: defaultText14.copyWith(
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffbababa)),
                ),
              ],
            ),
            Column(
              children: [
                Image.asset(
                  'assets/images/nodata.png',
                  height: 172.h,
                  width: 258.w,
                ),
                Text(
                  "Bạn chưa có khóa học",
                  style: defaultText16.copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff3C3C3C)),
                ),
                Text(
                  "Hãy tìm khóa học phù hợp nhé!",
                  style: defaultText14.copyWith(
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffbababa)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
