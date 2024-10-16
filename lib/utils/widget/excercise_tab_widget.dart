import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_s/utils/constants/color.dart';
import 'package:three_s/utils/constants/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:d_chart/d_chart.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../untils.dart';

class ExcerciseTabBar extends StatefulWidget {
  const ExcerciseTabBar(this.outerTab, {super.key});

  final String outerTab;

  @override
  State<ExcerciseTabBar> createState() => _ExcerciseTabBarState();
}

class _ExcerciseTabBarState extends State<ExcerciseTabBar>
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
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(
              25.0,
            ),
            color: const Color(0xff2F9CD3),
          ),
          indicatorSize: TabBarIndicatorSize.label,
          // indicator: UnderlineTabIndicator(
          //   borderSide: BorderSide(width: 2.w), //hight of indicator
          //   insets: EdgeInsets.symmetric(
          //       horizontal:
          //           20.w), //give some padding to reduce the size of indicator
          // ),
          labelStyle: defaultText14,
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          tabs: const <Widget>[
            Tab(
              text: '    Lớp Toán    ',
            ),

            // second tab [you can add an icon using the icon property]
            Tab(
              text: '    Lớp Văn    ',
            ),
            Tab(
              text: '    Lớp Văn    ',
            ),
            Tab(
              text: '    Lớp Vật Lý    ',
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return const ClassItem();
                  }),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 66.h,
                          width: 350.w,
                          margin: EdgeInsets.only(
                              bottom: 10.h, right: 10.w, left: 10.w, top: 10.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 1), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ));
                  }),
              Card(
                margin: const EdgeInsets.all(16.0),
                child: Center(
                  child: SleekCircularSlider(
                    onChangeStart: (double value) {},
                    onChangeEnd: (double value) {},
                    appearance: CircularSliderAppearance(
                        customWidths: CustomSliderWidths(
                            trackWidth: 22,
                            progressBarWidth: 20,
                            shadowWidth: 50),
                        customColors: CustomSliderColors(
                            trackColors: [
                              HexColor('#FFF8CB'),
                              HexColor('#B9FFFF')
                            ],
                            progressBarColors: [
                              HexColor('#FFC84B'),
                              HexColor('#00BFD5')
                            ],
                            shadowColor: HexColor('#5FC7B0'),
                            dynamicGradient: true,
                            shadowMaxOpacity: 0.05),
                        infoProperties: InfoProperties(
                            bottomLabelStyle: TextStyle(
                                color: HexColor('#002D43'),
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                            bottomLabelText: '6 Tháng',
                            mainLabelStyle: const TextStyle(
                                color: Color.fromRGBO(97, 169, 210, 1),
                                fontSize: 30.0,
                                fontWeight: FontWeight.w200),
                            modifier: (double value) {
                              final kcal = value.toInt();
                              return '$kcal K';
                            }),
                        size: 200.0,
                        startAngle: 180,
                        angleRange: 180),
                    min: 500,
                    max: 20000,
                    initialValue: 2000,
                  ),
                ),
              ),
              const Card(
                margin: EdgeInsets.all(16.0),
                color: Colors.white,
                child: Center(
                  child: PieChart(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ClassItem extends StatelessWidget {
  const ClassItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: 375.w,
        height: 132.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                          'Lớp toán thầy Hiệp ôn luyện ĐGNL 2025  ',
                          style: defaultText16.copyWith(
                            color: keyBlack,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color(0xffFFC400),
                              size: 24.0,
                            ),
                            Text(
                              '4.7',
                              style: defaultText14,
                            ),
                            SizedBox(
                              width: 5.h,
                            ),
                            SvgPicture.asset(
                              'assets/icons/clock.svg',
                            ),
                            Text(
                              '6 Tháng',
                              style: defaultText14,
                            ),
                          ],
                        ),
                        RichText(
                          text: TextSpan(
                            text: '1.499.000đ   ',
                            style: defaultText14.copyWith(
                              color: const Color(0xff2F9CD3),
                              fontWeight: FontWeight.w700,
                            ),
                            children: [
                              TextSpan(
                                text: '1.800.000đ',
                                style: defaultText12.copyWith(
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.lineThrough,
                                  color: const Color(0xffBABABA),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
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
