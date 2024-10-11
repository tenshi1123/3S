import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_s/utils/constants/color.dart';
import 'package:three_s/utils/constants/styles.dart';
import 'package:three_s/utils/widget/custom_widget.dart';

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
    _tabController = TabController(length: 2, vsync: this);
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
          labelPadding: EdgeInsets.symmetric(horizontal: 10.w),
          isScrollable: true,
          indicatorColor: primary600,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(
              25.0,
            ),
            color: Colors.green,
          ),
          indicatorSize: TabBarIndicatorSize.label,
          // indicator: UnderlineTabIndicator(
          //   borderSide: BorderSide(width: 2.w), //hight of indicator
          //   insets: EdgeInsets.symmetric(
          //       horizontal:
          //           20.w), //give some padding to reduce the size of indicator
          // ),
          unselectedLabelColor: keyBlack.withOpacity(0.3),
          labelStyle: defaultText14,
          labelColor: keyBlack,
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              text: 'Place Bid',
            ),

            // second tab [you can add an icon using the icon property]
            Tab(
              text: 'Buy Now',
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
              ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: 2,
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
              // Card(
              //   margin: const EdgeInsets.all(16.0),
              //   child: Center(
              //     child: Text(
              //       'Không có bài tập nào',
              //       style: defaultText14,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
