import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constants/color.dart';
import '../../utils/constants/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoClass extends StatelessWidget {
  const InfoClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primary500,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Chi tiết lớp học',
          style: defaultText16.copyWith(
              color: Colors.white, fontWeight: FontWeight.w700),
        ),
        actions: [
          SvgPicture.asset('assets/icons/calendar.svg'),
          SizedBox(
            width: 5.w,
          )
        ],
      ),
      body: Column(
        children: [
          Text(
            'Lớp toán thầy Hiệp ôn luyện ĐGNL 2025 ',
            style: defaultText20.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return const _ClassItem();
              }),
        ],
      ),
    );
  }
}

class _ClassItem extends StatelessWidget {
  const _ClassItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 152.h,
      padding: EdgeInsets.only(left: 5.w),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(
          Radius.circular(12.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.only(left: 20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(6.r),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lớp toán thầy Hiệp ôn luyện ĐGNL 2025  ',
              style: defaultText16.copyWith(
                color: keyBlack,
                fontWeight: FontWeight.w600,
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'Khai giảng:   ',
                style: defaultText14.copyWith(
                  color: primary500,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(
                    text: '12/12/2024',
                    style: defaultText14.copyWith(
                      fontWeight: FontWeight.w600,
                      color: primary500,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  height: 48.h,
                  width: 140.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: const Color(0xffF7F7F7),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/tick.png'),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '28 buổi ',
                            style: defaultText14.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Đã hoàn thành',
                            style: defaultText12,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Container(
                  height: 48.h,
                  width: 140.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: const Color(0xffF7F7F7),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/missing.png'),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '28 buổi ',
                            style: defaultText14.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Đã hoàn thành',
                            style: defaultText12,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
