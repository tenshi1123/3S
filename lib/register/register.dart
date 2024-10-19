import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_s/modules/login/login_screen.dart';
import 'package:three_s/utils/constants/color.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/constants/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'register_success.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  bool? isChecked = true;
  bool tick() => !isChecked!;
  TextEditingController? name1Controller = TextEditingController();
  TextEditingController? phone1Controller = TextEditingController();
  TextEditingController? name2Controller = TextEditingController();
  TextEditingController? phone2Controller = TextEditingController();
  TextEditingController? classController = TextEditingController();
  TextEditingController? subjectController = TextEditingController();
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(height: 20.h),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Text(
                  'Thông tin đăng ký',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontSize: 24.sp,
                    color: keyBlack,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Text(
                  'Cùng bạn xóa bỏ mọi rào cản trong học tập!',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: subBlack,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.normal,
                  ),
                  overflow: TextOverflow.clip,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          TabBar.secondary(
            controller: _tabController,
            tabs: const <Widget>[
              Tab(text: 'Bạn đã học tại 3S'),
              Tab(text: 'Bạn chưa học'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          width: 350.w,
                          height: 58.h,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.r)),
                            color: const Color(0xffF4F1F3),
                          ),
                          child: TextField(
                            //keyboardType: const TextInputType.numberWithOptions(),
                            controller: name1Controller,
                            style: defaultText16,

                            scrollPadding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).viewInsets.bottom),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_2_outlined,
                                color: subBlack,
                              ),
                              hintText: 'Tên học sinh',
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintStyle: TextStyle(
                                fontSize: 16.sp,
                                color: subBlack,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          width: 350.w,
                          height: 58.h,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.r)),
                            color: const Color(0xffF4F1F3),
                          ),
                          child: TextField(
                            controller: phone1Controller,
                            style: defaultText16,
                            scrollPadding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).viewInsets.bottom),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.phone_outlined,
                                color: subBlack,
                              ),
                              hintText: 'Số điện thoại',
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintStyle: TextStyle(
                                fontSize: 16.sp,
                                color: subBlack,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 240.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => const RegisterSuccess()),
                              ),
                            );
                          },
                          child: Container(
                            height: 48.h,
                            width: 340.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.r),
                              color: key1Color,
                            ),
                            child: Center(
                              child: Text(
                                'Gửi thông tin',
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
                          height: 10.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => const LoginScreen()),
                              ),
                            );
                          },
                          child: RichText(
                            text: TextSpan(
                              text: 'Đã có tài khoản ?',
                              style: defaultText16.copyWith(color: subBlack),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' Đăng nhập',
                                  style:
                                      defaultText16.copyWith(color: main1Color),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          width: 350.w,
                          height: 58.h,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.r)),
                            color: const Color(0xffF4F1F3),
                          ),
                          child: TextField(
                            //keyboardType: const TextInputType.numberWithOptions(),
                            controller: name2Controller,
                            style: defaultText16,

                            scrollPadding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).viewInsets.bottom),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: subBlack,
                              ),
                              hintText: 'Tên học sinh/phụ huynh',
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintStyle: TextStyle(
                                fontSize: 16.sp,
                                color: subBlack,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          width: 350.w,
                          height: 58.h,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.r)),
                            color: const Color(0xffF4F1F3),
                          ),
                          child: TextField(
                            controller: phone2Controller,
                            style: defaultText16,
                            scrollPadding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).viewInsets.bottom),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.phone_outlined,
                                color: subBlack,
                              ),
                              hintText: 'Số điện thoại',
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintStyle: TextStyle(
                                fontSize: 16.sp,
                                color: subBlack,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Container(
                          width: 350.w,
                          height: 58.h,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.r)),
                            color: const Color(0xffF4F1F3),
                          ),
                          child: TextField(
                            style: defaultText16,
                            obscuringCharacter: "*",
                            controller: classController,
                            scrollPadding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).viewInsets.bottom),
                            decoration: InputDecoration(
                              prefixIcon: SvgPicture.asset(
                                  'assets/icons/class.svg',
                                  height: 16.h,
                                  width: 16.w,
                                  fit: BoxFit.scaleDown),
                              hintText: 'Bạn đang học lớp mấy',
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintStyle: TextStyle(
                                fontSize: 16.sp,
                                color: subBlack,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Container(
                          width: 350.w,
                          height: 58.h,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.r)),
                            color: const Color(0xffF4F1F3),
                          ),
                          child: TextField(
                            style: defaultText16,
                            obscuringCharacter: "*",
                            controller: subjectController,
                            scrollPadding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).viewInsets.bottom),
                            decoration: InputDecoration(
                              prefixIcon: SvgPicture.asset(
                                  'assets/icons/book_mark.svg',
                                  height: 16.h,
                                  width: 16.w,
                                  fit: BoxFit.scaleDown),
                              hintText: 'Môn học bạn muốn tham khảo',
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              hintStyle: TextStyle(
                                fontSize: 16.sp,
                                color: subBlack,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'Bạn đăng ký tư vấn dưới vai trò nào?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: primary500,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value;
                                });
                              },
                            ),
                            Text(
                              'Phụ huynh  ',
                              style: defaultText16,
                            ),
                            Checkbox(
                              value: tick(),
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = (value == true) ? false : true;
                                });
                              },
                            ),
                            Text(
                              'Học sinh',
                              style: defaultText16,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => const RegisterSuccess()),
                              ),
                            );
                          },
                          child: Container(
                            height: 48.h,
                            width: 340.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9.r),
                              color: key1Color,
                            ),
                            child: Center(
                              child: Text(
                                'Nhận tư vấn ngay',
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
                          height: 10.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => const LoginScreen()),
                              ),
                            );
                          },
                          child: RichText(
                            text: TextSpan(
                              text: 'Đã có tài khoản ?',
                              style: defaultText16.copyWith(color: subBlack),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' Đăng nhập',
                                  style:
                                      defaultText16.copyWith(color: main1Color),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
