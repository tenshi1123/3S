import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_s/modules/monthly_summary/summary_score.dart';
import '../../utils/constants/color.dart';
import '../../utils/constants/styles.dart';

class MonthlySummary extends StatelessWidget {
  const MonthlySummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Tổng kết tháng'),
        actions: [
          Image.asset(
            'assets/images/summary.png',
            width: 40.w,
            height: 25.h,
          ),
          SizedBox(
            width: 5.w,
          )
        ],
      ),
      body: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const SummaryScore()),
                    ),
                  );
                },
                child: _ClassItem(
                  title: '${index + 1}',
                ));
          }),
    );
  }
}

class _ClassItem extends StatelessWidget {
  const _ClassItem({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 83.h,
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
        width: 323.w,
        height: 83.h,
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
              'Lớp toán $title thầy Hiệp ôn luyện ĐGNL 2025',
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
                    text: '1$title/12/2024',
                    style: defaultText14.copyWith(
                      fontWeight: FontWeight.w600,
                      color: primary500,
                    ),
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
