import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart";
import "package:three_s/modules/bottom_nav_bar/calender.dart";
import "package:three_s/modules/models/course_model.dart";
import "package:three_s/modules/models/info_model.dart";
import "package:three_s/utils/constants/color.dart";
import "course_screen.dart";
import "home/guess_screen.dart";
import "home/home_screen.dart";
import "personer_screen.dart";

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
    required this.type,
    required this.categories,
    required this.courses,
    this.infoModel,
  });
  final int type;
  final List<CategoryModel> categories;
  final List<CourseModel> courses;
  final InfoModel? infoModel;
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final PersistentTabController _controller = PersistentTabController();
  @override
  void initState() {
    super.initState();
    //setupOneSignal();
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
            courses: widget.courses,
            infoModel: widget.infoModel,
          ),
          item: ItemConfig(
            icon: const Icon(Icons.home),
            title: "Trang chủ",
            activeForegroundColor: Colors.white,
            inactiveForegroundColor: const Color(0xffBABABA),
            activeColorSecondary: key1Color,
            inactiveBackgroundColor: Colors.white.withOpacity(0.2),
          ),
        ),
        PersistentTabConfig(
          screen: const CourseScreen(),
          item: ItemConfig(
            icon: const Icon(
              Icons.bookmark_border,
            ),
            //icon: SvgPicture.asset('assets/icons/nav_bar2.svg'),
            title: "Khóa học",
            activeForegroundColor: Colors.white,
            inactiveForegroundColor: const Color(0xffBABABA),
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
            icon: const Icon(
              Icons.calendar_today,
            ),
            //icon: SvgPicture.asset('assets/icons/nav_bar2.svg'),
            title: "Lịch học",
            activeForegroundColor: Colors.white,
            inactiveForegroundColor: const Color(0xffBABABA),
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
            icon: const Icon(Icons.person_2_outlined),
            title: "Cá nhân",
            activeForegroundColor: Colors.white,
            inactiveForegroundColor: const Color(0xffBABABA),
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
