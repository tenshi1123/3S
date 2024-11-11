import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_s/utils/constants/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'course_tabbar.dart';

class CoureScreen extends StatelessWidget {
  const CoureScreen({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: 375.w,
                    height: 230.h,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      image: const DecorationImage(
                        image: AssetImage('assets/images/emc.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30.h,
                    left: 10.w,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios_new),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                child: Text(
                  title,
                  textAlign: TextAlign.left,
                  style: defaultBoldText.copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 16.w,
                  ),
                  const Icon(
                    Icons.star,
                    color: Color(0xffFFC400),
                    size: 24.0,
                  ),
                  Text(
                    '  4.3 (442 đánh giá)',
                    style: defaultText14,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  SvgPicture.asset(
                    'assets/icons/clock.svg',
                  ),
                  Text(
                    '  6 Tháng',
                    style: defaultText14,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  SvgPicture.asset(
                    'assets/icons/people.svg',
                  ),
                  Text(
                    '  9.242',
                    style: defaultText14,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: '1.499.000đ   ',
                        style: defaultText16.copyWith(
                          color: const Color(0xff2F9CD3),
                          fontWeight: FontWeight.w700,
                        ),
                        children: [
                          TextSpan(
                            text: '1.800.000đ',
                            style: defaultText12.copyWith(
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.lineThrough,
                              color: const Color(0xffBABABA),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 6.h,
                color: const Color(0xfff0f0f0),
              ),
              SizedBox(
                height: 400.h,
                width: 375.w,
                child: const CourseTabbar(''),
              ),
            ],
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //     height: 98.h,
          //     width: 375.w,
          //     decoration: BoxDecoration(
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.grey.withOpacity(0.5),
          //           spreadRadius: 5,
          //           blurRadius: 7,
          //           offset: const Offset(0, 3),
          //         ),
          //       ],
          //       color: Colors.white,
          //     ),
          //     child: Center(
          //       child: Container(
          //         height: 50.h,
          //         width: 343.w,
          //         decoration: BoxDecoration(
          //             color: primary500,
          //             borderRadius: BorderRadius.circular(12.r)),
          //         child: Center(
          //           child: Text(
          //             'Mua Khóa Học',
          //             style: defaultText14.copyWith(
          //               color: Colors.white,
          //               fontWeight: FontWeight.w600,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
