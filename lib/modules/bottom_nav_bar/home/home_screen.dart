import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:three_s/main.dart';
import 'package:three_s/modules/models/class_model.dart';
import 'package:three_s/modules/models/course_model.dart';
import 'package:three_s/modules/models/info_model.dart';
import 'package:three_s/modules/models/notification_model.dart';
import 'package:three_s/modules/models/report_model.dart';
import 'package:three_s/modules/monthly_summary/monthly_summary.dart';
import 'package:three_s/repo/class_repo.dart';
import 'package:three_s/modules/roll_call/list_class.dart';
import 'package:three_s/repo/notification_repo.dart';
import 'package:three_s/repo/report_repo.dart';
import 'package:three_s/utils/constants/styles.dart';
import 'package:three_s/utils/widget/not_student_yet.dart';
import '../../../repo/course_repo.dart';
import '../../../utils/constants/color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../utils/widget/excercise_tab_widget.dart';
import '../../notification/list_notification.dart';
import 'search_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.type,
    required this.categories,
    this.infoModel,
    this.upcommingModel,
  });
  final int type;
  final List<CategoryModel> categories;

  final InfoModel? infoModel;
  final List<UpcommingModel>? upcommingModel;
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
      backgroundColor: Colors.white,
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
                          backgroundImage: NetworkImage(
                              widget.infoModel?.avatar ??
                                  'https://trungtam3s.vn/img/favicon.png'),
                          //child: Text((type == 0) ? 'TA' : ''),
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
                              (widget.infoModel != null)
                                  ? widget.infoModel!.fullName
                                  : 'Chưa có tài khoản',
                              style: defaultText20.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22.sp),
                            ),
                          ],
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () async {
                            List<NotiModel> listNotifications =
                                await NotiRepo().getListNotifications();
                            pushWithoutNavBar(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => ListNoti(
                                      ListNotifications: listNotifications,
                                    )),
                              ),
                            );
                          },
                          child: hasNewNoti
                              ? SvgPicture.asset(
                                  'assets/icons/bell_icon.svg',
                                  color: Colors.white,
                                  height: 24.h,
                                  width: 24.w,
                                )
                              : Image.asset(
                                  'assets/images/hasNoti.png',
                                  width: 60.w,
                                  height: 45.h,
                                ),
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
                  Container(
                    height: 168.h,
                    width: 343.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r)),
                    child: PageView.builder(
                      padEnds: false,
                      controller: controller,
                      itemCount: pages.length,
                      itemBuilder: (_, index) {
                        return pages[index % pages.length];
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
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
                    if (type == 0) {
                      List<ClassModel> listClass =
                          await ClassRepo().listClass();
                      pushWithoutNavBar(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ListClass(
                            listClasses: listClass,
                          ),
                        ),
                      );
                    } else {
                      pushWithoutNavBar(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotStudentYet(),
                        ),
                      );
                    }
                  },
                  child: Image.asset(
                    'assets/images/follow_class.png',
                    width: 164.w,
                    height: 116.h,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    if (type == 0) {
                      List<ScheduleModel> listSchedule =
                          await ReportRepo().getSchedule();
                      pushWithoutNavBar(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MonthlySummary(
                            listClasses: listSchedule,
                          ),
                        ),
                      );
                    } else {
                      pushWithoutNavBar(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotStudentYet(),
                        ),
                      );
                    }
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
              padding: EdgeInsets.only(left: 20.w, top: 15.h, bottom: 5.h),
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
            (type == 1)
                ? FutureBuilder(
                    future: CourseRepo().getListCourse(''), // Hàm gọi API
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text(
                          'Something went wrong',
                          style: defaultText14,
                        );
                      } else if (snapshot.hasData) {
                        final listKhoaHoc = snapshot.data as List<CourseModel>;
                        return SizedBox(
                          width: 375.w,
                          height: 166.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemExtent: 278.0.w,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 0),
                            itemCount: listKhoaHoc.length,
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
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                                  'assets/images/class1.png')
                                              as ImageProvider,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 246.w,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          gradient: LinearGradient(
                                              begin: FractionalOffset.topCenter,
                                              end:
                                                  FractionalOffset.bottomCenter,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Spacer(),
                                        Text(
                                          ' ${listKhoaHoc[index].name}',
                                          style: defaultText16.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Row(
                                          children: [
                                            // const Icon(
                                            //   Icons.star,
                                            //   color: Color(0xffFFC400),
                                            //   size: 24.0,
                                            // ),
                                            // Text(
                                            //   '4.7 ',
                                            //   style: defaultText14.copyWith(
                                            //     color: Colors.white,
                                            //     fontWeight: FontWeight.w500,
                                            //   ),
                                            // ),
                                            SizedBox(
                                              width: 5.h,
                                            ),
                                            SvgPicture.asset(
                                              'assets/icons/clock.svg',
                                            ),
                                            Text(
                                              listKhoaHoc[index].duration,
                                              style: defaultText14.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text:
                                                '${listKhoaHoc[index].price}     ',
                                            style: defaultText14.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            children: [
                                              TextSpan(
                                                text:
                                                    listKhoaHoc[index].priceOld,
                                                style: defaultText14.copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  color: const Color.fromARGB(
                                                      255, 170, 170, 170),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return Text(
                          'Something went wrong2',
                          style: defaultText14,
                        );
                      }
                    },
                  )
                : (widget.upcommingModel?.isEmpty ?? true)
                    ? const SizedBox()
                    : SizedBox(
                        width: 375.w,
                        height: 166.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemExtent: 278.0.w,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 0),
                          itemCount: widget.upcommingModel?.length,
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
                                      borderRadius: BorderRadius.circular(16.r),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: widget.upcommingModel?[index]
                                                    .img !=
                                                null
                                            ? NetworkImage(widget
                                                .upcommingModel![index].img)
                                            : const AssetImage(
                                                    'assets/images/class1.png')
                                                as ImageProvider,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 246.w,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(16.r),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Spacer(),
                                      Text(
                                        ' ${widget.upcommingModel?[index].name}',
                                        style: defaultText16.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        ' ${widget.upcommingModel?[index].buoiHoc}',
                                        style: defaultText16.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        ' ${widget.upcommingModel?[index].createdDate}',
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
              padding: EdgeInsets.only(left: 20.w, top: 15.h, bottom: 5.h),
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
                categories: widget.categories,
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
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        width: 343.w,
        height: 170.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          image: const DecorationImage(
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
