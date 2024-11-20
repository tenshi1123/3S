import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_s/main.dart';
import 'package:three_s/modules/bottom_nav_bar/bottom_nav_bar.dart';
import '../../utils/constants/color.dart';
import '../../utils/constants/styles.dart';

class ChangePassScreen extends StatefulWidget {
  const ChangePassScreen({super.key});

  @override
  State<ChangePassScreen> createState() => _ChangePassScreenState();
}

class _ChangePassScreenState extends State<ChangePassScreen> {
  bool _isObscure1 = true;
  bool _isObscure2 = true;
  bool _isObscure3 = true;
  TextEditingController? passController1 = TextEditingController();
  TextEditingController? passController2 = TextEditingController();
  TextEditingController? passController3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          //bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40.h),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_ios_new),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Thay đổi mật khẩu',
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
              SizedBox(
                height: 10.h,
              ),
              // Row(
              //   children: [
              //     Text(
              //       'Cùng bạn xóa bỏ mọi rào cản trong học tập!',
              //       textAlign: TextAlign.right,
              //       style: TextStyle(
              //         color: subBlack,
              //         fontSize: 16.sp,
              //         fontWeight: FontWeight.normal,
              //       ),
              //       overflow: TextOverflow.clip,
              //     ),
              //   ],
              // ),
              Container(
                width: 350.w,
                height: 58.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  color: const Color(0xffF4F1F3),
                ),
                child: TextField(
                  //keyboardType: const TextInputType.numberWithOptions(),
                  controller: passController1,
                  obscureText: _isObscure1,
                  obscuringCharacter: "*",
                  style: defaultText16,
                  scrollPadding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).viewInsets.bottom),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outlined,
                      color: subBlack,
                    ),
                    suffix: IconButton(
                      padding: const EdgeInsets.all(0),
                      iconSize: 20.0,
                      icon: _isObscure1
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
                          _isObscure1 = !_isObscure1;
                        });
                      },
                    ),
                    hintText: 'Nhập mật khẩu hiện tại',
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
              Container(
                width: 350.w,
                height: 58.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  color: const Color(0xffF4F1F3),
                ),
                child: TextField(
                  //keyboardType: const TextInputType.numberWithOptions(),
                  controller: passController2,
                  obscureText: _isObscure2,
                  obscuringCharacter: "*",
                  style: defaultText16,
                  scrollPadding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).viewInsets.bottom),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outlined,
                      color: subBlack,
                    ),
                    suffix: IconButton(
                      padding: const EdgeInsets.all(0),
                      iconSize: 20.0,
                      icon: _isObscure2
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
                          _isObscure2 = !_isObscure2;
                        });
                      },
                    ),
                    hintText: 'Nhập mật khẩu mới',
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
              Container(
                width: 350.w,
                height: 58.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  color: const Color(0xffF4F1F3),
                ),
                child: TextField(
                  obscureText: _isObscure3,
                  obscuringCharacter: "*",
                  style: defaultText16,
                  controller: passController3,
                  scrollPadding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).viewInsets.bottom),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: subBlack,
                    ),
                    hintText: 'Nhập lại mật khẩu',
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    hintStyle: TextStyle(
                      fontSize: 16.sp,
                      color: subBlack,
                    ),
                    suffix: IconButton(
                      padding: const EdgeInsets.all(0),
                      iconSize: 20.0,
                      icon: _isObscure3
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
                          _isObscure3 = !_isObscure3;
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              SizedBox(
                height: 140.h,
              ),
              GestureDetector(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => BottomNavBar(
                            type: 0,
                            categories: listCate,
                            courses: listCourse,
                          )),
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
                      'Đổi mật khẩu',
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
            ],
          ),
        ),
      ),
    );
  }
}
