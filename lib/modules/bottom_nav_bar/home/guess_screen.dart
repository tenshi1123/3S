import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:three_s/utils/constants/color.dart';
import 'package:three_s/utils/constants/styles.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../register/register.dart';
import '../../login/login_screen.dart';

class GuessScreen extends StatelessWidget {
  const GuessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> makePhoneCall(String phoneNumber) async {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      await launchUrl(launchUri);
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Cá nhân')),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const Divider(),
            Text(
              'Bạn chưa có tài khoản',
              style: defaultText16,
            ),
            SizedBox(
              height: 10.h,
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

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Đăng xuất',
          style: defaultText14,
        ),
        content: Text(
          'Bạn có chắc muốn đăng xuất ?',
          style: defaultText14,
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Hủy'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Xác nhận'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => const LoginScreen()),
                ),
              );
            },
          ),
        ],
      );
    },
  );
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      builder: (BuildContext context) {
        return SizedBox(
          width: 375.w,
          height: 616.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Chuyển tài khoản',
                style: defaultText16.copyWith(
                  color: const Color(0xff292929),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: 343.w,
                height: 52.h,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 26.r,
                      backgroundColor: Colors.grey,
                      backgroundImage:
                          const NetworkImage('https://i.imgur.com/nhETfUw.png'),
                      //child: const Text('AH'),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phạm Thế Anh',
                          style: defaultText18.copyWith(
                            color: primary500,
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                          ),
                        ),
                        Text(
                          'Đã đăng nhập',
                          style: defaultText14.copyWith(
                              color: const Color(
                            0xff8A8A8A,
                          )),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      'assets/icons/tick.svg',
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1.h,
                indent: 28.w,
                endIndent: 8.w,
              ),
            ],
          ),
        );
      });
}
