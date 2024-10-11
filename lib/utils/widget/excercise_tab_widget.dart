import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_s/utils/constants/color.dart';
import 'package:three_s/utils/constants/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                  child: Text(
                    'Không có bài tập nào',
                    style: defaultText14,
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    'Không có bài tập nào',
                    style: defaultText14,
                  ),
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
