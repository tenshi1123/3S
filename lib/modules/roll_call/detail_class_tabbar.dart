import 'dart:core';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_s/utils/constants/color.dart';
import 'package:three_s/utils/constants/styles.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:three_s/utils/widget/custom_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailClassTabbar extends StatefulWidget {
  const DetailClassTabbar(this.outerTab, {super.key});
  final String outerTab;
  @override
  State<DetailClassTabbar> createState() => _DetailClassTabbarState();
}

class _DetailClassTabbarState extends State<DetailClassTabbar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
              text: '     Bài tập     ',
            ),
            // second tab [you can add an icon using the icon property]
            Tab(
              text: '     Tài liệu     ',
            ),
            Tab(
              text: 'Nhận xét buổi học',
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200.dg,
                    width: 240.dg,
                    child: const PieChart(),
                  ),
                  Text(
                    'Thật tuyệt vời!',
                    style: defaultText16.copyWith(
                      color: keyBlack,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Text(
                      'Chúc mừng bạn hoàn thành bài tập của buổi học',
                      style: defaultText16.copyWith(
                        color: keyBlack,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const DocumentItem(
                    title: 1,
                  ),
                ],
              ),
              //Giáo viên
              SizedBox(
                width: 343.w,
                height: 110.h,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DocumentItem(
                        title: 1,
                      ),
                      DocumentItem(
                        title: 1,
                      ),
                      DocumentItem(
                        title: 1,
                      ),
                    ],
                  ),
                ),
              ),
              //Nhận xét
              Column(
                children: [
                  SizedBox(
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
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/images/avatar1.png'),
                              fit: BoxFit.fill,
                            ),
                            color: Color(0xff6B7AC7),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Nguyễn văn A',
                                style: defaultText16.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                'Giảng viên toán',
                                style: defaultText12.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 343.w,
                    height: 186.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Đánh giá:  ',
                              style: defaultText16.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
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
                              Icons.star_border_outlined,
                              color: Color(0xffFFC400),
                              size: 24.0,
                            ),
                            Text(
                              '  (Tốt)',
                              style: defaultText14.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              'Nhận xét:',
                              style: defaultText16.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Text(
                            'The placeholder text, beginning with the line “Lorem ipsum dolor sit amet, consectetur adipiscing elit”, looks like Latin because in its youth, centuries ago, it was Latin.',
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

class DocumentItem extends StatelessWidget {
  const DocumentItem({super.key, required this.title});
  final int title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (!await launchUrl(Uri.parse('https://flutter.dev'))) {
          throw Exception('Could not launch ');
        }
      },
      child: Container(
        width: 343.w,
        height: 80.h,
        margin: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10.w,
            ),
            Container(
              height: 55.h,
              width: 55.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/document.png'),
                  fit: BoxFit.fill,
                ),
                color: Color(0xff6B7AC7),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tenbaitap.PDF',
                  style: defaultText16.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Tải xuống để xem',
                  style: defaultText14.copyWith(),
                )
              ],
            ),
            const Spacer(),
            SvgPicture.asset(
              'assets/icons/downloads.svg',
            ),
            SizedBox(
              width: 20.w,
            ),
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
                'Điểm số của bạn',
                style: defaultText14.copyWith(
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
