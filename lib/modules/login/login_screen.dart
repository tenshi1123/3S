import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sp_util/sp_util.dart';
import 'package:three_s/modules/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:three_s/modules/login/forgot_password_screen.dart';
import 'package:three_s/modules/login/repo/login_repo.dart';
import 'package:three_s/utils/constants/color.dart';
import 'package:three_s/utils/constants/string_constatns.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../register/register.dart';
import '../../utils/constants/styles.dart';
import '../course/course_repo.dart';
import '../models/course_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;
  final _focusNode = FocusNode();
  final _focusNode1 = FocusNode();
  TextEditingController? passController = TextEditingController();
  TextEditingController? studenIdController = TextEditingController();
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          _focusNode.unfocus();
        },
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            //bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 60.h),
                Row(
                  children: [
                    Text(
                      'Xin chào!',
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
                Row(
                  children: [
                    Text(
                      'Chào mừng đã trở lại, hãy đăng nhập',
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
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  children: [
                    Text(
                      'Tài khoản',
                      style: TextStyle(
                        color: key1Color,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer()
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  width: 350.w,
                  height: 58.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    color: const Color(0xffF4F1F3),
                  ),
                  child: TextField(
                    keyboardType: const TextInputType.numberWithOptions(),
                    controller: studenIdController,
                    focusNode: _focusNode1,
                    style: defaultText16,
                    scrollPadding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).viewInsets.bottom),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_2_outlined,
                        color: subBlack,
                      ),
                      hintText: 'Số điện thoại phụ huynh/học sinh',
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
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
                Row(
                  children: [
                    Text(
                      'Mật khẩu',
                      style: TextStyle(
                        color: key1Color,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer()
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  width: 350.w,
                  height: 58.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    color: const Color(0xffF4F1F3),
                  ),
                  child: TextField(
                    obscureText: _isObscure,
                    obscuringCharacter: "*",
                    style: defaultText16,
                    controller: passController,
                    focusNode: _focusNode,
                    scrollPadding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).viewInsets.bottom),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: subBlack,
                      ),
                      hintText: 'Mật khẩu',
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintStyle: TextStyle(
                        fontSize: 16.sp,
                        color: subBlack,
                      ),
                      suffix: IconButton(
                        padding: const EdgeInsets.all(0),
                        iconSize: 20.0,
                        icon: _isObscure
                            ? const Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              )
                            : const Icon(
                                Icons.visibility,
                                color: Colors.black,
                              ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const ForgotPassScreen()),
                          ),
                        );
                      },
                      child: Text(
                        'Quên mật khẩu',
                        style: TextStyle(
                          color: key1Color,
                          fontSize: 14.sp,
                          //decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 140.h,
                ),
                GestureDetector(
                  onTap: () async {
                    // bool loged = await LoginRepo().login(
                    //   studenIdController?.text ?? '',
                    //   passController?.text ?? '',
                    // );
                    // if (loged == true) {
                    SpUtil.putString(ConstString.token,
                        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3MzA5NjI5NTMsImV4cCI6MTczMTU2Nzc1MywidG9rZW5fdHlwZSI6IkJlYXJlciIsImRhdGEiOnsiY3VzdG9tZXJfaWQiOiI5NyIsImZ1bGxfbmFtZSI6IlBoYW4gVlx1MDEwM24gVGhcdTAwZjRuZyIsInBob25lIjoiMDg1OTM4MjMzNiIsImVtYWlsIjoidGhvbmd2aXAwMTFAZ21haWwuY29tIiwiaXNMb2dnZWRJblVzZXIiOnRydWV9fQ.vOsrAr7-N8hYLw7Mlnjp5SKOV4yxxBIoaxUrX6EAMU8');
                    List<CategoryModel> test =
                        await CourseRepo().getListCategory();
                    List<CourseModel> test2 =
                        await CourseRepo().getListCourse();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => BottomNavBar(
                              type: 0,
                              categories: test,
                              courses: test2,
                            )),
                      ),
                    );
                    // } else {
                    //   showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return CupertinoAlertDialog(
                    //         title: const Text('Vui lòng thử lại'),
                    //         content: const Text(
                    //             'Vui lòng kiểm tra lại mã học sinh và mật khẩu của bạn'),
                    //         actions: <Widget>[
                    //           CupertinoDialogAction(
                    //             isDefaultAction: true,
                    //             child: Text(
                    //               'Yes',
                    //               style: TextStyle(
                    //                 fontSize: 20,
                    //                 color: primary500,
                    //               ),
                    //             ),
                    //             onPressed: () {
                    //               Navigator.of(context, rootNavigator: true)
                    //                   .pop(
                    //                 (_) => false,
                    //               );
                    //             },
                    //           )
                    //         ],
                    //       );
                    //     },
                    //   );
                    // }
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
                  height: 10.h,
                ),
                GestureDetector(
                  onTap: () async {
                    List<CategoryModel> test =
                        await CourseRepo().getListCategory();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => BottomNavBar(
                              type: 1,
                              categories: test,
                              courses: const [],
                            )),
                      ),
                    );
                  },
                  child: Container(
                    height: 48.h,
                    width: 340.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.r),
                      color: Colors.white,
                      border: Border.all(),
                    ),
                    child: Center(
                      child: Text(
                        'Đăng nhập với tư cách khách',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: key1Color,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const RegisterScreen()),
                      ),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Chưa có tài khoản ?',
                      style: defaultText16,
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Đăng ký',
                          style: defaultText16.copyWith(color: main1Color),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
