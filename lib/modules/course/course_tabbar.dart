import 'dart:core';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_s/utils/constants/color.dart';
import 'package:three_s/utils/constants/styles.dart';
import 'package:d_chart/d_chart.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/widget/custom_widget.dart';

class CourseTabbar extends StatefulWidget {
  const CourseTabbar(this.outerTab, {super.key});
  final String outerTab;
  @override
  State<CourseTabbar> createState() => _CourseTabbarState();
}

class _CourseTabbarState extends State<CourseTabbar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TabBar.secondary(
          tabAlignment: TabAlignment.start,
          padding: EdgeInsets.zero,
          indicatorPadding: EdgeInsets.zero,
          labelPadding: EdgeInsets.only(left: 10.w),
          isScrollable: true,
          indicatorColor: primary600,
          // indicator: BoxDecoration(
          //   borderRadius: BorderRadius.circular(
          //     25.0,
          //   ),
          //   color: const Color(0xff2F9CD3),
          // ),
          indicatorSize: TabBarIndicatorSize.label,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 2.w), //hight of indicator
            insets: EdgeInsets.symmetric(
                horizontal:
                    10.w), //give some padding to reduce the size of indicator
          ),
          labelStyle: defaultText14.copyWith(
            fontWeight: FontWeight.w700,
          ),
          controller: _tabController,
          labelColor: const Color(0xff2F9CD3),
          unselectedLabelColor: Colors.black,
          tabs: const <Widget>[
            Tab(
              text: '   Thông tin   ',
            ),
            // second tab [you can add an icon using the icon property]
            Tab(
              text: '    Bài học    ',
            ),
            Tab(
              text: '   Giáo viên   ',
            ),
            Tab(
              text: '   Nhận xét   ',
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    '    Khóa học',
                    style: defaultText16.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      '    2k7 không chỉ là lứa đầu tiên học chương trình GD THPT 2018 mà còn là lứa đầu tiên thi THPT QG theo phương thức mới. Sự thay đổi về chương trình học và phương thức thi sẽ kéo theo những điều chỉnh bắt buộc về việc tuyển sinh của các trường TOP. Trước những biến động này, các em HS cần có sự chuẩn bị kĩ lưỡng để tối đa hóa cơ hội trúng tuyển vào trường học mà bản thân mong muốn.',
                      style: defaultText14,
                    ),
                  ),
                ],
              ),
              //Bài học
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    '    Nội dung',
                    style: defaultText16.copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return LessonItem(
                          title: index,
                        );
                      }),
                ],
              ),
              //Giáo viên
              SizedBox(
                width: 343.w,
                height: 110.h,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'Giáo viên',
                        style: defaultText16.copyWith(
                          color: keyBlack,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 55.h,
                            width: 55.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/avatarht.png'),
                                fit: BoxFit.fill,
                              ),
                              color: Color(0xff6B7AC7),
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
                                  'Phạm Hồng Thủy',
                                  style: defaultText16.copyWith(
                                    color: keyBlack,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'Giáo viên Văn',
                                  style: defaultText12.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromARGB(
                                        255, 161, 161, 161),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Text(
                        'Thông Tin',
                        style: defaultText16.copyWith(
                          color: keyBlack,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      const UnorderedList(
                        [
                          "Giải Khuyến khích Giải thưởng khoa học và công nghệ dành cho sinh viên trong các cơ sở giáo dục đại học năm 2023.",
                          "Có kinh nghiệm luyện thi ĐGNL HSA, ĐGNL HNUE, THPT QG,... đặc biệt, với kì thi ĐGNL HSA với nhiều HS đạt 40+/50 điểm (Tư duy định tính)",
                        ],
                        icon: 0,
                      ),
                    ],
                  ),
                ),
              ),
              //Nhận xét
              const Column(
                children: [
                  CommentItem(
                    avatar: 'assets/images/avatar1.png',
                    name: 'Hoàng Xuân Tiến',
                    time: '2 tuần trước',
                    content:
                        'Khóa học là rất tốt. lời giải thích của người cố vấn là rất rõ ràng và dễ hiểu!',
                  ),
                  CommentItem(
                    avatar: 'assets/images/avatar2.png',
                    name: 'Hoàng Minh Thủy',
                    time: '3 tuần trước',
                    content:
                        'Khóa học là rất tốt. lời giải thích của người cố vấn là sao mas',
                  ),
                  CommentItem(
                    avatar: 'assets/images/avatar3.png',
                    name: 'Hoài Lê',
                    time: '4 tuần trước',
                    content: 'Khóa học là rất tốt. ',
                  ),
                ],
              )
              // ListView.builder(
              //     shrinkWrap: true,
              //     physics: const ClampingScrollPhysics(),
              //     itemCount: 3,
              //     itemBuilder: (BuildContext context, int index) {
              //       return const CommentItem(
              //         avatar: '', name: '', time: '', content: '',
              //       );
              //     }),
            ],
          ),
        ),
      ],
    );
  }
}

class LessonItem extends StatelessWidget {
  const LessonItem({super.key, required this.title});
  final int title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (!await launchUrl(Uri.parse('https://hvg.edu.vn'))) {
          throw Exception('Could not launch ');
        }
      },
      child: SizedBox(
        width: 375.w,
        height: 60.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 16.w,
                ),
                Container(
                  height: 34.h,
                  width: 34.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xff2F9CD3),
                    ),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      '0${title + 1}',
                      style: defaultText14.copyWith(
                        color: const Color(0xff2F9CD3),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'There are many variations',
                      style: defaultText16.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '5 bài giảng / 6 bài tập',
                      style: defaultText12.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 60.w,
                ),
                const Icon(Icons.keyboard_arrow_right_outlined),
              ],
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}

class PieChart extends StatelessWidget {
  const PieChart({super.key});

  @override
  Widget build(BuildContext context) {
    List<OrdinalData> ordinalDataList = [
      OrdinalData(domain: '1', measure: 90, color: const Color(0xff3A7DD4)),
      OrdinalData(domain: '2', measure: 10, color: const Color(0xffd9d9d9)),
      OrdinalData(domain: '3', measure: 33, color: Colors.white),
    ];
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 30 / 25,
          child: DChartPieO(
            data: ordinalDataList,
            customLabel: (ordinalData, index) {
              return "";
            },
            configRenderPie: ConfigRenderPie(
              arcLabelDecorator: ArcLabelDecorator(
                labelPosition: ArcLabelPosition.auto,
                leaderLineStyle: const ArcLabelLeaderLineStyle(
                  color: Colors.transparent,
                  length: 30,
                  thickness: 0,
                ),
                showLeaderLines: true,
              ),
              arcLength: 2 * pi,
              arcRatio: 0.2,
              //arcWidth: 10,
              startAngle: pi * 3 / 4,
              strokeWidthPx: 0,
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '9',
                style: defaultText16.copyWith(
                  fontSize: 48.sp,
                  fontWeight: FontWeight.bold,
                  color: primary500,
                ),
              ),
              Text(
                'Điểm trung bình\n  của cả tháng',
                style: defaultText16.copyWith(
                  fontWeight: FontWeight.w600,
                  color: primary500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CommentItem extends StatelessWidget {
  const CommentItem(
      {super.key,
      required this.avatar,
      required this.name,
      required this.time,
      required this.content});
  final String avatar;
  final String name;
  final String time;
  final String content;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 375.w,
      height: 100.h,
      child: Row(
        children: [
          SizedBox(
            width: 16.w,
          ),
          Container(
            height: 55.h,
            width: 55.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(avatar),
                fit: BoxFit.fill,
              ),
              color: const Color(0xff6B7AC7),
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          SizedBox(
            width: 270.w,
            height: 80.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: defaultText16.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '5.0',
                      style: defaultText14.copyWith(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff2F9CD3)),
                    ),
                    const Icon(
                      Icons.star,
                      color: Color(0xffFFC400),
                      size: 24.0,
                    ),
                    const Icon(
                      Icons.star,
                      color: Color(0xffFFC400),
                      size: 24.0,
                    ),
                    const Icon(
                      Icons.star,
                      color: Color(0xffFFC400),
                      size: 24.0,
                    ),
                    const Icon(
                      Icons.star,
                      color: Color(0xffFFC400),
                      size: 24.0,
                    ),
                    const Icon(
                      Icons.star,
                      color: Color(0xffFFC400),
                      size: 24.0,
                    ),
                  ],
                ),
                Text(
                  time,
                  style: defaultText12.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Expanded(
                  child: Text(
                    content,
                    style: defaultText12.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
