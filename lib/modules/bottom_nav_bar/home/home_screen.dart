import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:three_s/modules/models/course_model.dart';
import 'package:three_s/modules/monthly_summary/monthly_summary.dart';
import 'package:three_s/modules/roll_call/list_class.dart';
import 'package:three_s/utils/constants/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:three_s/utils/widget/not_student_yet.dart';
import '../../../utils/constants/color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../utils/widget/excercise_tab_widget.dart';
import '../../models/class_model.dart';
import '../../roll_call/class_repo.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.type,
    required this.categories,
    required this.courses,
  });
  final int type;
  final List<CategoryModel> categories;
  final List<CourseModel> courses;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = PageController(viewportFraction: 1, keepPage: true);
  late final int type;
  @override
  void initState() {
    type = widget.type;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
        3,
        (index) => NotificationItem(
              index: index,
            ));
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
                    height: 66.h,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 26.r,
                          backgroundColor: Colors.white,
                          child: Text((type == 0) ? 'TA' : ''),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (type == 0) ? 'Chào buổi sáng!' : 'Xin Chào',
                              style: defaultText14.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              (type == 0)
                                  ? 'Phạm Thế Anh'
                                  : 'Chưa có tài khoản',
                              style: defaultText20.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22.sp),
                            ),
                          ],
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          'assets/icons/bell_icon.svg',
                          color: Colors.white,
                          height: 24.h,
                          width: 24.w,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      pushWithoutNavBar(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SearchScreen(),
                        ),
                      );
                    },
                    child: Container(
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
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 188.h,
              width: 375.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 168.h,
                    width: 343.w,
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
                GestureDetector(
                  onTap: () async {
                    List<ClassModel> listClass = await ClassRepo().listClass();
                    (type == 0)
                        ? pushWithoutNavBar(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ListClass(),
                            ),
                          )
                        : pushWithoutNavBar(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NotStudentYet(),
                            ),
                          );
                  },
                  child: Image.asset(
                    'assets/images/follow_class.png',
                    width: 164.w,
                    height: 116.h,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    (type == 0)
                        ? pushWithoutNavBar(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MonthlySummary(),
                            ),
                          )
                        : pushWithoutNavBar(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NotStudentYet(),
                            ),
                          );
                  },
                  child: Image.asset(
                    'assets/images/monthly_summary.png',
                    width: 164.w,
                    height: 116.h,
                  ),
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
              width: 375.w,
              height: 166.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemExtent: 278.0.w,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Stack(
                      children: [
                        Container(
                          width: 246.w,
                          height: 166.h,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade100,
                            image: const DecorationImage(
                              image: AssetImage('assets/images/class1.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          height: 246.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              gradient: LinearGradient(
                                  begin: FractionalOffset.topCenter,
                                  end: FractionalOffset.bottomCenter,
                                  colors: [
                                    Colors.grey.withOpacity(0.0),
                                    Colors.black,
                                  ],
                                  stops: const [
                                    0.0,
                                    1.0
                                  ])),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),
                            Text(
                              '    Lớp ôn thi DGNL 2025',
                              style: defaultText16.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              '    21/05/2024 (08:00 - 11:00)',
                              style: defaultText14.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            )
                          ],
                        ),
                      ],
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
              width: 375.w,
              child: ExcerciseTabBar(
                '',
                categories: widget.categories,
                courses: widget.courses,
              ),
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
  const NotificationItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        //margin: EdgeInsets.symmetric(horizontal: 20.w),
        width: 343.w,
        height: 170.h,
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/images/banner.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
      // Container(
      //   margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      //   padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
      //   width: 390.w,
      //   height: 200.h,
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.all(Radius.circular(8.r)),
      //     color: const Color(0xffDADEF1),
      //   ),
      //   child: Row(
      //     children: [
      //       Container(
      //         height: 76.h,
      //         width: 76.w,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.all(
      //             Radius.circular(8.r),
      //           ),
      //           color: const Color(0xff6B7AC7),
      //         ),
      //       ),
      //       SizedBox(
      //         width: 10.w,
      //       ),
      //       Flexible(
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text(
      //               'Đây là slide ${index + 1}',
      //               style: defaultBoldText.copyWith(
      //                 color: keyBlack,
      //               ),
      //             ),
      //           ],
      //         ),
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
