import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart";
import "package:three_s/utils/constants/color.dart";
import "home_screen.dart";
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
  });

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
          screen: const HomeScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.home),
            title: "Trang chủ",
            activeForegroundColor: key1Color,
            inactiveForegroundColor: Colors.white,
            activeColorSecondary: Colors.white,
            inactiveBackgroundColor: Colors.white.withOpacity(0.2),
          ),
        ),
        PersistentTabConfig(
          screen: const HomeScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.book),
            title: "Môn học",
            activeForegroundColor: key1Color,
            inactiveForegroundColor: Colors.white,
            activeColorSecondary: Colors.white,
            inactiveBackgroundColor: Colors.white.withOpacity(0.2),
          ),
        ),
        PersistentTabConfig(
          screen: const HomeScreen(),
          item: ItemConfig(
            icon: SvgPicture.asset('assets/icons/nav_bar2.svg'),
            title: "Hồ sơ",
            activeForegroundColor: key1Color,
            inactiveForegroundColor: Colors.white,
            activeColorSecondary: Colors.white,
            inactiveBackgroundColor: Colors.white.withOpacity(0.2),
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
        controller: _controller,
        tabs: _tabs(),
        navBarBuilder: (navBarConfig) => Style2BottomNavBar(
              itemPadding: EdgeInsets.all(5.h),
              navBarConfig: navBarConfig,
              navBarDecoration: NavBarDecoration(
                color: const Color(0xff4659B9),
                borderRadius: BorderRadius.circular(25.r),
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
