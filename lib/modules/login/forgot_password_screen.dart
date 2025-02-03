import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:three_s/modules/login/otp_screen.dart';
import 'package:three_s/repo/info_repo.dart';
import 'package:three_s/utils/constants/styles.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/constants/color.dart';
import 'dart:developer';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});
  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  final _focusNode = FocusNode();

  TextEditingController phoneController = TextEditingController();
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
                Container(
                  width: 340.w,
                  height: 309.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/forgot_pass.png'),
                        fit: BoxFit.fitWidth),
                  ),
                ),
                Text(
                  'Quên mật khẩu ?',
                  textAlign: TextAlign.right,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: key1Color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Nhập SĐT đã đăng kí với trung tâm',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: const Color(0xff999999),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.normal,
                  ),
                  overflow: TextOverflow.clip,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  children: [
                    Text(
                      'Số điện thoại',
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
                    //keyboardType: const TextInputType.numberWithOptions(),
                    controller: phoneController,
                    style: defaultText16,
                    focusNode: _focusNode,
                    scrollPadding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).viewInsets.bottom),
                    decoration: InputDecoration(
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintStyle: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 30.h,
                ),
                GestureDetector(
                  onTap: () async {
                    bool check =
                        await InfoRepo().checkPhone(phoneController.text);
                    if (check) {
                      FirebaseAuth.instance.verifyPhoneNumber(
                          // phoneNumber: '+84974225054',
                          phoneNumber:
                              '+84${phoneController.text.replaceFirst(RegExp(r'0'), '')}',
                          verificationCompleted: (PhoneAuthCredential) {},
                          verificationFailed: (error) {
                            log(error.toString());
                          },
                          codeSent: (verificationId, forceResendingToken) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => OtpScreen(
                                      contact: phoneController.text,
                                      verificationId: verificationId,
                                    )),
                              ),
                            );
                          },
                          codeAutoRetrievalTimeout: (verificationId) {
                            log("Auto Retiveral timeout");
                          });
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Số điện thoại chưa có trên hệ thống',
                              style: defaultText16.copyWith(
                                color: const Color.fromARGB(255, 29, 29, 29),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            actionsPadding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            actions: <Widget>[
                              TextButton(
                                child: Text(
                                  'ok',
                                  style: defaultText16.copyWith(
                                      color: const Color(0xff3C3C3C)),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Container(
                    height: 48.h,
                    width: 191.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.r),
                        color: main1Color),
                    child: Center(
                      child: Text(
                        'Xác nhận',
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
                Text(
                  '(*) Lưu ý: bạn chỉ có thể nhận 2 mã otp trong ngày, nếu trang không phản hồi, xin vui lòng liên hệ hotline dưới',
                  style: defaultText14.copyWith(
                    color: const Color(0xffDF1111),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                InkWell(
                  onTap: () {
                    _makePhoneCall('0984688394');
                  },
                  child: Row(
                    children: [
                      const Spacer(),
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
                        style: defaultText16.copyWith(
                            color: const Color(0xff3C3C3C)),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Quay lại',
                    style: TextStyle(
                      color: main1Color,
                      fontSize: 14.sp,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w500,
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
