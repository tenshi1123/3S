import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_s/utils/constants/styles.dart';
import '../../utils/constants/color.dart';
import 'package:flutter_svg/svg.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key, required this.type});
  final int type;
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
          bottom: TabBar(
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 2.w,
                color: const Color(0xff2F9CD3),
              ),
              insets: const EdgeInsets.symmetric(horizontal: -10),
            ),
            labelColor: const Color(0xff2F9CD3),
            tabs: const <Widget>[
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
            (type == 0) ? const CourseInProgress() : const _NoCourse(),
            const _NoCourse(),
          ],
        ),
      ),
    );
  }
}

class _NoCourse extends StatelessWidget {
  const _NoCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/nodata.png',
          height: 172.h,
          width: 258.w,
        ),
        Text(
          "Bạn chưa có khóa học",
          style: defaultText16.copyWith(
              fontWeight: FontWeight.w600, color: const Color(0xff3C3C3C)),
        ),
        Text(
          "Hãy tìm khóa học phù hợp nhé!",
          style: defaultText14.copyWith(
              fontWeight: FontWeight.w500, color: const Color(0xffbababa)),
        ),
      ],
    );
  }
}

class CourseInProgress extends StatelessWidget {
  const CourseInProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return const _CourseItem();
        });
  }
}

class _CourseItem extends StatelessWidget {
  const _CourseItem({
    super.key,
    //required this.model
  });
  //final CourseModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        width: 375.w,
        height: 256.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 12.h,
            ),
            SizedBox(
              width: 343.w,
              height: 110.h,
              child: Row(
                children: [
                  Container(
                    height: 100.h,
                    width: 110.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.r),
                      ),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/math_class.png'),
                        fit: BoxFit.fill,
                      ),
                      color: const Color(0xff6B7AC7),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lớp toán thầy Hiệp ôn luyện ĐGNL 2025 ',
                          style: defaultText16.copyWith(
                            color: keyBlack,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '12 bài giảng',
                              style: defaultText14.copyWith(
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff575757),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 8.h,
                                  width: 180.w,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.r)),
                                    color: const Color(0xffEDEDED),
                                  ),
                                ),
                                Container(
                                  height: 8.h,
                                  width: (180 * 11 / 100).w,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.r)),
                                    color: const Color(0xff1FAF1F),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '  11%',
                              style: defaultText14.copyWith(
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff2f9cd3),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffEBF6FF),
                borderRadius: BorderRadius.all(
                  Radius.circular(12.r),
                ),
              ),
              width: 343.w,
              height: 102.h,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 11.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Bài học tiếp theo',
                          style: defaultText14.copyWith(
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff8A8A8A),
                          ),
                        ),
                        Text(
                          'Học ngay',
                          style: defaultText14.copyWith(
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff2f9cd3),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 12.w,
                      ),
                      Image.asset(
                        'assets/images/time.png',
                        width: 20.dg,
                        height: 20.dg,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bài học tiếp theo',
                            style: defaultText16.copyWith(
                              fontWeight: FontWeight.w600,
                              color: keyBlack,
                            ),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/timer.svg',
                                height: 12.dg,
                                width: 12.dg,
                              ),
                              Text(
                                '  10 phút',
                                style: defaultText14.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff575757),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Container(
              height: 5.h,
              color: const Color(0xffEDEDED),
            ),
          ],
        ),
      ),
    );
  }
}
