import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:three_s/utils/constants/color.dart';
import 'package:three_s/utils/constants/styles.dart';
import '../../../register/register.dart';
import '../../splash/wellcome_screen.dart';

class GuessScreen extends StatelessWidget {
  const GuessScreen({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    // Future<void> makePhoneCall(String phoneNumber) async {
    //   final Uri launchUri = Uri(
    //     scheme: 'tel',
    //     path: phoneNumber,
    //   );
    //   await launchUrl(launchUri);
    // }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(title)),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const Divider(),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Bạn chưa có tài khoản',
              style: defaultText16,
            ),
            (title == 'Cá nhân')
                ? const SizedBox()
                : Text(
                    'Bạn không có lịch học để hiển thị',
                    style: defaultText16,
                  ),
            SizedBox(
              height: 30.h,
            ),
            GestureDetector(
              onTap: () {
                pushWithoutNavBar(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const WellcomeScreen()),
                  ),
                );
              },
              child: Container(
                height: 38.h,
                width: 180.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9.r),
                  color: key1Color,
                ),
                child: Center(
                  child: Text(
                    'Đăng nhập',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            GestureDetector(
              onTap: () {
                pushWithoutNavBar(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const RegisterScreen()),
                  ),
                );
              },
              child: Text(
                'Đăng kí ngay',
                style: defaultText14.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
