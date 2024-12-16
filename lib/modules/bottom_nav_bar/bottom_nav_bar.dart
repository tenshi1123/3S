import "dart:io";

import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:onesignal_flutter/onesignal_flutter.dart";
import "package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart";
import "package:three_s/modules/bottom_nav_bar/calender.dart";
import "package:three_s/modules/models/course_model.dart";
import "package:three_s/modules/models/info_model.dart";
import "package:three_s/utils/constants/color.dart";
import 'package:flutter_svg/flutter_svg.dart';
import "../../utils/onesignal.dart";
import "course_screen.dart";
import "home/guess_screen.dart";
import "home/home_screen.dart";
import "info/personer_screen.dart";

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
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
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final PersistentTabController _controller = PersistentTabController();
  @override
  void initState() {
    super.initState();
    setupOneSignal();
  }

  Future<void> setupOneSignal() async {
    await initOneSignal();
    if (Platform.isAndroid) {
      OneSignal.Notifications.addClickListener((event) {
        print('NOTIFICATION CLICK LISTENER CALLED WITH EVENT: $event');
      });
    } else {
      //do nothing :v tự báo chính mình
      OneSignal.Notifications.addClickListener((event) {});
    }

    promptPolicyPrivacy();
  }

  Future<void> promptPolicyPrivacy() async {
    if (Platform.isAndroid) {
      OneSignal.consentRequired(true);
      OneSignal.consentGiven(true);
    } else {
      //do nothing :v
    }

    // sendUserTag(userId);
  }

  // Future<void> setupOneSignal() async {
  //   await initOneSignal();
  //   if (Platform.isAndroid) {
  //     OneSignal.Notifications.addClickListener((event) {
  //       print('NOTIFICATION CLICK LISTENER CALLED WITH EVENT: $event');
  //     });
  //   } else {
  //     //do nothing :v tự báo chính mình
  //     OneSignal.Notifications.addClickListener((event) {});
  //   }

  //   promptPolicyPrivacy();
  // }

  // Future<void> promptPolicyPrivacy() async {
  //   if (Platform.isAndroid) {
  //     OneSignal.consentRequired(true);
  //     OneSignal.consentGiven(true);
  //   } else {
  //     //do nothing :v
  //   }

  //   // sendUserTag(userId);
  // }

  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: HomeScreen(
            type: widget.type,
            categories: widget.categories,
            infoModel: widget.infoModel,
            upcommingModel: widget.upcommingModel,
          ),
          item: ItemConfig(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
            ),
            title: "Trang chủ",
            activeForegroundColor: Colors.white,
            //inactiveForegroundColor: const Color(0xffBABABA),
            inactiveIcon: SvgPicture.asset(
              'assets/icons/inactive_home.svg',
            ),
            activeColorSecondary: key1Color,
            inactiveBackgroundColor: Colors.white.withOpacity(0.2),
          ),
        ),
        PersistentTabConfig(
          screen: CourseScreen(
            type: widget.type,
          ),
          item: ItemConfig(
            icon: SvgPicture.asset(
              'assets/icons/course.svg',
            ),
            //icon: SvgPicture.asset('assets/icons/nav_bar2.svg'),
            title: "Khóa học",
            activeForegroundColor: Colors.white,
            inactiveIcon: SvgPicture.asset(
              'assets/icons/inactive_course.svg',
            ),
            activeColorSecondary: key1Color,
            inactiveBackgroundColor: Colors.white.withOpacity(0.2),
          ),
        ),
        PersistentTabConfig(
          screen: (widget.type == 0)
              ? const Calender()
              : const GuessScreen(
                  title: 'Lịch học',
                ),
          item: ItemConfig(
            icon: SvgPicture.asset(
              'assets/icons/schedule.svg',
            ),
            //icon: SvgPicture.asset('assets/icons/nav_bar2.svg'),
            title: "Lịch học",
            activeForegroundColor: Colors.white,
            inactiveIcon: SvgPicture.asset(
              'assets/icons/inactive_schedule.svg',
            ),
            activeColorSecondary: key1Color,
            inactiveBackgroundColor: Colors.white.withOpacity(0.2),
          ),
        ),
        PersistentTabConfig(
          screen: (widget.type == 0)
              ? PersonerScreen(
                  infoModel: widget.infoModel,
                )
              : const GuessScreen(
                  title: 'Cá nhân',
                ),
          item: ItemConfig(
            icon: SvgPicture.asset(
              'assets/icons/personal.svg',
            ),
            title: "Cá nhân",
            activeForegroundColor: Colors.white,
            inactiveIcon: SvgPicture.asset(
              'assets/icons/inactive_personal.svg',
            ),
            activeColorSecondary: key1Color,
            inactiveBackgroundColor: Colors.white.withOpacity(0.2),
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
        controller: _controller,
        tabs: _tabs(),
        navBarBuilder: (navBarConfig) => Style8BottomNavBar(
              itemPadding: EdgeInsets.all(5.h),
              navBarConfig: navBarConfig,
              navBarDecoration: const NavBarDecoration(
                color: Colors.white,
              ),
              //itemAnimationProperties: const ItemAnimation(),
            ),
        backgroundColor: Colors.white,
        navBarHeight: 50.h
        // onWillPop: (context) async {
        //   await showDialog(
        //     context: context,
        //     builder: (context) => Dialog(
        //       child: Center(
        //         child: ElevatedButton(
        //           child: const Text("Close"),
        //           onPressed: () {
        //             Navigator.pop(context);
        //           },
        //         ),
        //       ),
        //     ),
        //   );
        //   return false;
        // },
        );
  }
}
