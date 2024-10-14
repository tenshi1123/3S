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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: Text(
              'Lớp toán thầy Hiệp ôn luyện ĐGNL 2025 ',
              style: defaultText20.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Divider(
            thickness: 6.h,
            color: const Color(0xffF0F0F0),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: 1,
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SizedBox(
        width: 343.w,
        height: 160.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset('assets/images/tick.png'),
                Text(
                  '   09/12/2024',
                  style: defaultText16.copyWith(
                    color: keyBlack,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ca học:',
                      style: defaultText14.copyWith(height: 1.8.h),
                    ),
                    Text(
                      'Giờ đến lớp:',
                      style: defaultText14.copyWith(height: 1.8.h),
                    ),
                    Text(
                      'Giờ ra về:',
                      style: defaultText14.copyWith(height: 1.8.h),
                    ),
                    Text(
                      'Giáo viên:',
                      style: defaultText14.copyWith(height: 1.8.h),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '08:00 - 10:00',
                      style: defaultText14.copyWith(
                          fontWeight: FontWeight.w600,
                          color: primary500,
                          height: 1.8.h),
                    ),
                    Text(
                      '07:56',
                      style: defaultText14.copyWith(
                          fontWeight: FontWeight.w600,
                          color: primary500,
                          height: 1.8.h),
                    ),
                    Text(
                      '10:05',
                      style: defaultText14.copyWith(
                          fontWeight: FontWeight.w600,
                          color: primary500,
                          height: 1.8.h),
                    ),
                    Text(
                      'Hoàng Mạnh hùng',
                      style: defaultText14.copyWith(
                          fontWeight: FontWeight.w600,
                          color: primary500,
                          height: 1.8.h),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
