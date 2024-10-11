import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_s/utils/constants/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/constants/color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/widget/excercise_tab_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = PageController(viewportFraction: 1, keepPage: true);
  @override
  Widget build(BuildContext context) {
    final pages = List.generate(3, (index) => const NotificationItem());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 375.w,
              height: 200.h,
              decoration: BoxDecoration(
                color: primary600,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20.r),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 60.h,
                  ),
                  SizedBox(
                    width: 343.w,
                    height: 52.h,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 26.r,
                          backgroundColor: Colors.white,
                          child: const Text('AH'),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Chào buổi sáng!',
                              style: defaultText14.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Phạm Thế Anh',
                              style: defaultText20.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24.sp),
                            ),
                          ],
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          'assets/icons/bell_icon.svg',
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: 343.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        const Icon(Icons.search),
                        Text(
                          '  Bạn muốn tìm kiếm gì nào?',
                          style: defaultText16.copyWith(color: subBlack),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 170.h,
              width: 375.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 138.h,
                    width: 390.w,
                    child: PageView.builder(
                      padEnds: false,
                      controller: controller,
                      itemCount: pages.length,
                      itemBuilder: (_, index) {
                        return pages[index % pages.length];
                      },
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: SlideEffect(
                        paintStyle: PaintingStyle.stroke,
                        activeDotColor: primary800,
                        dotColor: primary800,
                        dotHeight: 10.h,
                        dotWidth: 10.w),
                    onDotClicked: (index) {
                      controller.animateToPage(index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              child: Row(
                children: [
                  Text(
                    'Quá trình học tập',
                    style: defaultText16.copyWith(
                      fontWeight: FontWeight.w700,
                      color: primary500,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/follow_class.png',
                  width: 164.w,
                  height: 116.h,
                ),
                Image.asset(
                  'assets/images/monthly_summary.png',
                  width: 164.w,
                  height: 116.h,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              child: Row(
                children: [
                  Text(
                    'Lịch học sắp tới',
                    style: defaultText16.copyWith(
                      fontWeight: FontWeight.w700,
                      color: primary500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 380.w,
              height: 166.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                //itemExtent: 390.0.w,
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    width: 246.w,
                    height: 166.h,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      image: const DecorationImage(
                        image: AssetImage('assets/images/class1.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              child: Row(
                children: [
                  Text(
                    'Khoá học đề xuất',
                    style: defaultText16.copyWith(
                      fontWeight: FontWeight.w700,
                      color: primary500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 400.h,
              width: 390.w,
              child: const ExcerciseTabBar(''),
            ),
            SizedBox(
              height: 40.h,
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
        width: 390.w,
        height: 200.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          color: const Color(0xffDADEF1),
        ),
        child: Row(
          children: [
            Container(
              height: 76.h,
              width: 76.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.r),
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
                    ' ',
                    style: defaultBoldText.copyWith(
                      color: keyBlack,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
