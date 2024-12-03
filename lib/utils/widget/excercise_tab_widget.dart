import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:three_s/modules/models/course_model.dart';
import 'package:three_s/repo/course_repo.dart';
import 'package:three_s/utils/constants/color.dart';
import 'package:three_s/utils/constants/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:d_chart/d_chart.dart';
import '../../modules/course/coure_screen.dart';

class ExcerciseTabBar extends StatefulWidget {
  const ExcerciseTabBar({
    super.key,
    required this.categories,
  });

  final List<CategoryModel> categories;

  @override
  State<ExcerciseTabBar> createState() => _ExcerciseTabBarState();
}

class _ExcerciseTabBarState extends State<ExcerciseTabBar>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  late final List<CategoryModel> _listCategories;

  @override
  void initState() {
    super.initState();
    _listCategories = widget.categories;
    _tabController =
        TabController(length: widget.categories.length, vsync: this);
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
          tabs: [
            ...List.generate(
              widget.categories.length,
              (i) => Tab(
                text: '   ${_listCategories[i].name}   ',
              ),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              ...List.generate(
                widget.categories.length,
                (i) => FutureBuilder(
                  future: CourseRepo()
                      .getListCourse(widget.categories[i].id), // Hàm gọi API
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text(
                        'Something went wrong',
                        style: defaultText14,
                      );
                    } else if (snapshot.hasData) {
                      final listKhocHoc = snapshot.data as List<CourseModel>;
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: listKhocHoc.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ClassItem(
                              model: listKhocHoc[index],
                            );
                          });
                    } else {
                      return Text(
                        'Something went wrong2',
                        style: defaultText14,
                      );
                    }
                  },
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
  const ClassItem({super.key, required this.model});
  final CourseModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushWithoutNavBar(
          context,
          MaterialPageRoute(
            builder: (context) => CoureScreen(
              title: model.name,
            ),
          ),
        );
      },
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
                          model.name,
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
                              ' ${model.star}',
                              style: defaultText14,
                            ),
                            SizedBox(
                              width: 8.h,
                            ),
                            SvgPicture.asset(
                              'assets/icons/clock.svg',
                            ),
                            Text(
                              ' ${model.duration}',
                              style: defaultText14,
                            ),
                          ],
                        ),
                        RichText(
                          text: TextSpan(
                            text: '${model.price} d     ',
                            style: defaultText14.copyWith(
                              color: const Color(0xff2F9CD3),
                              fontWeight: FontWeight.w700,
                            ),
                            children: [
                              TextSpan(
                                text: model.priceOld,
                                style: defaultText14.copyWith(
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.lineThrough,
                                  color:
                                      const Color.fromARGB(255, 170, 170, 170),
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
  const PieChart({super.key, required this.score});
  final int score;
  @override
  Widget build(BuildContext context) {
    List<OrdinalData> ordinalDataList = [
      OrdinalData(
        domain: '1',
        measure: score * 10,
        color: const Color(0xff3A7DD4),
      ),
      OrdinalData(
        domain: '2',
        measure: (10 - score) * 10,
        color: const Color(0xffd9d9d9),
      ),
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
                score.toString(),
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
