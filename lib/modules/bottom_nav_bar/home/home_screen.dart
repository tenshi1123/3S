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
  bool _isLoading = false;
  bool isLoading = false;
  bool isLoading2 = false;
  late final int type;
  late String name;
  @override
  void initState() {
    type = widget.type;
    name = widget.infoModel!.fullName
        .replaceFirst(widget.infoModel!.fullName.split(' ').first, '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
        listBanner.length,
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
              height: 160.h,
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
                        // InkWell(
                        //   onTap: () async {
                        //     List<ChildrenInfoModel> listChildModel =
                        //         await LoginRepo().getListChillren();

                        //     _showBottomSheet(context,
                        //         listChildrenModel: listChildModel);
                        //   },
                        //   child:
                        //       // _isLoading
                        //       //     ? Center(
                        //       //         child: SizedBox(
                        //       //           width: 28.w,
                        //       //           height: 28.h,
                        //       //           child: const CircularProgressIndicator(),
                        //       //         ),
                        //       //       )
                        //       //     :
                        //       CircleAvatar(
                        //     radius: 26.r,
                        //     backgroundColor: Colors.white,
                        //     backgroundImage: NetworkImage(
                        //         widget.infoModel?.avatar ??
                        //             'https://trungtam3s.vn/img/favicon.png'),
                        //     //child: Text((type == 0) ? 'TA' : ''),
                        //   ),
                        // ),
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
                            if (type == 0) {
                              setState(() {
                                _isLoading = true;
                              });
                              List<NotiModel> listNotifications =
                                  await NotiRepo().getListNotifications();
                              setState(() {
                                _isLoading = false;
                              });
                              pushWithoutNavBar(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => ListNoti(
                                        listNotifications: listNotifications,
                                      )),
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
                          child: _isLoading
                              ? Center(
                                  child: SizedBox(
                                    width: 28.w,
                                    height: 28.h,
                                    child: const CircularProgressIndicator(),
                                  ),
                                )
                              : hasNewNoti
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
                  // GestureDetector(
                  //   onTap: () {
                  //     pushWithoutNavBar(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => const SearchScreen(),
                  //       ),
                  //     );
                  //   },
                  //   child: Container(
                  //     width: 343.w,
                  //     height: 44.h,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(12.r),
                  //       color: Colors.white,
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         SizedBox(
                  //           width: 10.w,
                  //         ),
                  //         const Icon(Icons.search),
                  //         Text(
                  //           '  Bạn muốn tìm kiếm gì nào?',
                  //           style: defaultText16.copyWith(color: subBlack),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // )
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: SizedBox(
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
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SmoothPageIndicator(
                    controller: controller,
                    count: listBanner.length,
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
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
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
                    setState(() {
                      isLoading = true;
                    });
                    if (type == 0) {
                      List<ClassModel> listClass =
                          await ClassRepo().listClass();
                      // AppRouter.toPage(context, AppPages.ListClassScreen,
                      //     // blocValue: _authBloc,
                      //     arguments: {
                      //       'listClasses': listClass,
                      //     });
                      setState(() {
                        isLoading = false;
                      });
                      if (context.mounted) {
                        pushWithoutNavBar(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListClass(
                              listClasses: listClass,
                            ),
                          ),
                        );
                      }
                    } else {
                      setState(() {
                        isLoading = false;
                      });
                      pushWithoutNavBar(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotStudentYet(),
                        ),
                      );
                    }
                  },
                  child: isLoading
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
                          child: SizedBox(
                            width: 100.w,
                            height: 100.h,
                            child: const CircularProgressIndicator(),
                          ),
                        )
                      : Image.asset(
                          'assets/images/follow_class.png',
                          width: 164.w,
                          height: 116.h,
                        ),
                ),
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      isLoading2 = true;
                    });
                    if (type == 0) {
                      List<ScheduleModel> listSchedule =
                          await ReportRepo().getSchedule();
                      setState(() {
                        isLoading2 = false;
                      });
                      pushWithoutNavBar(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MonthlySummary(
                            listClasses: listSchedule,
                          ),
                        ),
                      );
                    } else {
                      setState(() {
                        isLoading2 = false;
                      });
                      pushWithoutNavBar(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotStudentYet(),
                        ),
                      );
                    }
                  },
                  child: isLoading2
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 15),
                          child: SizedBox(
                            width: 100.w,
                            height: 100.h,
                            child: const CircularProgressIndicator(),
                          ),
                        )
                      : Image.asset(
                          'assets/images/monthly_summary.png',
                          width: 164.w,
                          height: 116.h,
                        ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 15.h, bottom: 15.h),
              child: Row(
                children: [
                  Text(
                    'Buổi học sắp tới của $name',
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
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          gradient: LinearGradient(
                                              begin: FractionalOffset.topCenter,
                                              end:
                                                  FractionalOffset.bottomCenter,
                                              colors: [
                                                Colors.grey,
                                                Colors.black,
                                              ],
                                              stops: [
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
                              padding: EdgeInsets.only(right: 16.w),
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
                                        gradient: const LinearGradient(
                                            begin: FractionalOffset.topCenter,
                                            end: FractionalOffset.bottomCenter,
                                            colors: [
                                              Colors.grey,
                                              Colors.black,
                                            ],
                                            stops: [
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
              padding: EdgeInsets.only(left: 16.w, top: 15.h, bottom: 15.h),
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

// void _showBottomSheet(BuildContext context,
//     {required List<ChildrenInfoModel> listChildrenModel}) {
//   showModalBottomSheet(
//       context: context,
//       useRootNavigator: true,
//       builder: (BuildContext context) {
//         return SizedBox(
//           width: 375.w,
//           height: 616.h,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               SizedBox(
//                 height: 20.h,
//               ),
//               Text(
//                 'Chuyển tài khoản',
//                 style: defaultText16.copyWith(
//                   color: const Color(0xff292929),
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               SizedBox(
//                 height: 20.h,
//               ),
//               ListView.builder(
//                 shrinkWrap: true,
//                 physics: const ScrollPhysics(),
//                 itemCount: listChildrenModel.length,
//                 itemBuilder: (context, index) {
//                   return InkWell(
//                     onTap: () async {
//                       final SharedPreferences prefs =
//                           await SharedPreferences.getInstance();
//                       await prefs.setString(
//                           'token', listChildrenModel[index].refreshToken);
//                       InfoModel infoModel = await InfoRepo().getInfo();
//                       List<UpcommingModel> upcommingModel =
//                           await CourseRepo().getUpcommingClass();
//                       //comment tam ti mo
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: ((context) => BottomNavBar(
//                                 type: 0,
//                                 categories: listCate,
//                                 infoModel: infoModel,
//                                 upcommingModel: upcommingModel,
//                               )),
//                         ),
//                       );
//                     },
//                     child: SizedBox(
//                       width: 343.w,
//                       height: 72.h,
//                       child: Row(
//                         children: [
//                           CircleAvatar(
//                             radius: 26.r,
//                             backgroundColor: Colors.grey,
//                             backgroundImage:
//                                 NetworkImage(listChildrenModel[index].img),
//                             //child: const Text('AH'),
//                           ),
//                           SizedBox(
//                             width: 5.w,
//                           ),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 listChildrenModel[index].nameChild,
//                                 style: defaultText18.copyWith(
//                                   color: primary500,
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 18.sp,
//                                 ),
//                               ),
//                               Text(
//                                 'Đã đăng nhập',
//                                 style: defaultText14.copyWith(
//                                     color: const Color(
//                                   0xff8A8A8A,
//                                 )),
//                               ),
//                             ],
//                           ),
//                           const Spacer(),
//                           SvgPicture.asset(
//                             'assets/icons/tick.svg',
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               Divider(
//                 thickness: 1.h,
//                 indent: 28.w,
//                 endIndent: 8.w,
//               ),
//             ],
//           ),
//         );
//       });
// }

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.only(right: 10.w, left: 10.w),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Image.network(listBanner[index]),
        ),
      ),
    );
  }
}
