import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:three_s/modules/login/change_pass_screen.dart';
import 'package:three_s/modules/models/info_model.dart';
import 'package:three_s/utils/constants/color.dart';
import 'package:three_s/utils/constants/styles.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../main.dart';
import '../../../repo/course_repo.dart';
import '../../../repo/info_repo.dart';
import '../../../repo/login_repo.dart';
import '../../models/course_model.dart';
import '../../splash/onboarding.dart';
import '../bottom_nav_bar.dart';
import 'info_screen.dart';

class PersonerScreen extends StatefulWidget {
  const PersonerScreen({super.key, this.infoModel});
  final InfoModel? infoModel;

  @override
  State<PersonerScreen> createState() => _PersonerScreenState();
}

class _PersonerScreenState extends State<PersonerScreen> {
  bool _isLoading = false;
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
            const Divider(thickness: 1),
            SizedBox(
              width: 343.w,
              height: 72.h,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32.r,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(widget.infoModel!.avatar),
                    //child: const Text('AH'),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.infoModel!.fullName,
                        style: defaultText18.copyWith(
                          color: primary500,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                        ),
                      ),
                      Text(
                        widget.infoModel!.phone,
                        style: defaultText14.copyWith(
                          color: const Color(
                            0xff8A8A8A,
                          ),
                          height: 20 / 16.h,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      pushWithoutNavBar(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => InfoUser(
                                infoModel: widget.infoModel,
                              )),
                        ),
                      );
                    },
                    child: Text(
                      'Xem',
                      style: defaultText16.copyWith(
                        color: const Color(0xff2F9CD3),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Divider(
              thickness: 6.h,
              height: 30.h,
              color: const Color(0xffF0F0F0),
            ),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
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
                  SvgPicture.asset(
                    'assets/icons/lock.svg',
                    height: 20.h,
                    width: 20.w,
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
                  Icon(Icons.keyboard_arrow_right_outlined, size: 20.h),
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
              height: 30.h,
            ),
            InkWell(
              onTap: () {
                makePhoneCall('19008978');
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 16.w,
                  ),
                  SvgPicture.asset(
                    'assets/icons/hotline.svg',
                    height: 20.h,
                    width: 20.w,
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
                    style: defaultText16.copyWith(
                      color: const Color(0xFFDF1111),
                      fontWeight: FontWeight.w600,
                    ),
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
              height: 30.h,
            ),
            InkWell(
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
                  Icon(
                    Icons.delete_outline,
                    color: const Color(0xFFDF1111),
                    size: 25.h,
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
              height: 36.h,
              color: const Color(0xffF0F0F0),
            ),
            InkWell(
              onTap: () async {
                setState(() {
                  _isLoading = true;
                });
                List<ChildrenInfoModel> listChildModel =
                    await LoginRepo().getListChillren();
                setState(() {
                  _isLoading = false;
                });
                if (context.mounted) {
                  _showBottomSheet(context, listChildrenModel: listChildModel);
                }
              },
              child: _isLoading
                  ? Center(
                      child: SizedBox(
                        width: 28.w,
                        height: 28.h,
                        child: const CircularProgressIndicator(),
                      ),
                    )
                  : Row(
                      children: [
                        SizedBox(
                          width: 16.w,
                        ),
                        SvgPicture.asset(
                          'assets/icons/refresh.svg',
                          height: 20.h,
                          width: 20.w,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Chuyển tài khoản',
                          style: defaultText16.copyWith(
                              color: const Color(0xff3C3C3C)),
                        ),
                        const Spacer(),
                        Icon(Icons.keyboard_arrow_right_outlined, size: 20.h),
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
              height: 30.h,
            ),
            InkWell(
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
                  SvgPicture.asset(
                    'assets/icons/exit.svg',
                    height: 20.h,
                    width: 20.w,
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
            onPressed: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.remove('token');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Onbonding(),
                ),
              );
            },
          ),
        ],
      );
    },
  );
}

void _showBottomSheet(BuildContext context,
    {required List<ChildrenInfoModel> listChildrenModel}) {
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
              ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: listChildrenModel.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setString(
                          'token', listChildrenModel[index].refreshToken);
                      InfoModel infoModel = await InfoRepo().getInfo();
                      List<UpcommingModel> upcommingModel =
                          await CourseRepo().getUpcommingClass();
                      //comment tam ti mo
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => BottomNavBar(
                                type: 0,
                                categories: listCate,
                                infoModel: infoModel,
                                upcommingModel: upcommingModel,
                              )),
                        ),
                      );
                    },
                    child: SizedBox(
                      width: 343.w,
                      height: 72.h,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 26.r,
                            backgroundColor: Colors.grey,
                            backgroundImage:
                                NetworkImage(listChildrenModel[index].img),
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
                                listChildrenModel[index].nameChild,
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
                  );
                },
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
