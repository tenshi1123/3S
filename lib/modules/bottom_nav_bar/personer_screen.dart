import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:three_s/modules/login/change_pass_screen.dart';
import 'package:three_s/utils/constants/color.dart';
import 'package:three_s/utils/constants/styles.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../login/login_screen.dart';

class PersonerScreen extends StatelessWidget {
  const PersonerScreen({super.key});

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
            SizedBox(
              width: 343.w,
              height: 60.h,
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
                        '097 111 6262',
                        style: defaultText14.copyWith(
                            color: const Color(
                          0xff8A8A8A,
                        )),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Divider(
              thickness: 6.h,
              height: 30.h,
            ),
            GestureDetector(
              onTap: () {
                pushWithoutNavBar(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const ChangePassScreen()),
                  ),
                );
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 16.w,
                  ),
                  const Icon(
                    Icons.lock_outline_sharp,
                    color: Color(0xff3C3C3C),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    'Thay đổi mật khẩu',
                    style:
                        defaultText16.copyWith(color: const Color(0xff3C3C3C)),
                  ),
                  const Spacer(),
                  const Icon(Icons.keyboard_arrow_right_outlined),
                  SizedBox(
                    width: 16.w,
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1.h,
              indent: 16.w,
              endIndent: 16.w,
            ),
            GestureDetector(
              onTap: () {
                makePhoneCall('19008978');
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 16.w,
                  ),
                  const Icon(
                    Icons.headphones,
                    color: Color(0xff3C3C3C),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    'Hotline',
                    style:
                        defaultText16.copyWith(color: const Color(0xff3C3C3C)),
                  ),
                  const Spacer(),
                  Text(
                    '1900 6262',
                    style:
                        defaultText16.copyWith(color: const Color(0xFFDF1111)),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1.h,
              indent: 16.w,
              endIndent: 16.w,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'Bạn có chắc chắn muốn xóa tài khoản',
                        style: defaultText16.copyWith(
                          color: const Color.fromARGB(255, 29, 29, 29),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      content: Text(
                        'Bạn sẽ không thể khôi phục sau khi xóa tài khoản',
                        style: defaultText16.copyWith(
                            color: const Color(0xff3C3C3C)),
                      ),
                      actionsPadding:
                          const EdgeInsets.symmetric(horizontal: 10.0),
                      actions: <Widget>[
                        TextButton(
                          child: Text(
                            'Hủy',
                            style: defaultText16.copyWith(
                                color: const Color(0xff3C3C3C)),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        ElevatedButton(
                          child: Text(
                            'Xóa tài khoản',
                            style: defaultText16.copyWith(
                              color: const Color(0xFFDF1111),
                            ),
                          ),
                          onPressed: () => _dialogBuilder(
                            context,
                            title: 'Bạn chắc chắn muốn xóa tài khoản chứ',
                            title2:
                                'Bạn sẽ không thể khôi phục sau khi xóa tài khoản',
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 16.w,
                  ),
                  const Icon(
                    Icons.delete_outline,
                    color: Color(0xFFDF1111),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    'Xóa tài khoản',
                    style:
                        defaultText16.copyWith(color: const Color(0xFFDF1111)),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 6.h,
              height: 30.h,
            ),
            GestureDetector(
              onTap: () {
                _showBottomSheet(context);
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 16.w,
                  ),
                  const Icon(
                    Icons.refresh_outlined,
                    color: Color(0xff3C3C3C),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    'Chuyển tài khoản',
                    style:
                        defaultText16.copyWith(color: const Color(0xff3C3C3C)),
                  ),
                  const Spacer(),
                  const Icon(Icons.keyboard_arrow_right_outlined),
                  SizedBox(
                    width: 16.w,
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1.h,
              indent: 16.w,
              endIndent: 16.w,
            ),
            GestureDetector(
              onTap: () => _dialogBuilder(
                context,
                title: 'Đăng xuất',
                title2: 'Bạn có chắc muốn đăng xuất ?',
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 16.w,
                  ),
                  const Icon(
                    Icons.exit_to_app,
                    color: Color(0xFFDF1111),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    'Đăng xuất',
                    style:
                        defaultText16.copyWith(color: const Color(0xFFDF1111)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _dialogBuilder(
  BuildContext context, {
  required String title,
  required String title2,
}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          style: defaultText16.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Text(
          title2,
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
