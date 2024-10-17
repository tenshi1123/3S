import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/constants/styles.dart';
import '../../utils/widget/excercise_tab_widget.dart';

class SummaryScore extends StatelessWidget {
  const SummaryScore({super.key});

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
        title: const Text('Điểm tổng kết tháng'),
      ),
      body: SingleChildScrollView(
        child: Column(
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
            SizedBox(
              height: 250.dg,
              width: 300.dg,
              child: const PieChart(),
            ),
            Text(
              'Thật tuyệt vời!',
              style: defaultText18.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 16.w,
                ),
                Text(
                  'Bảng điểm trung bình theo buổi học',
                  style: defaultText16.copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff292929)),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return const ClassItem();
                }),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}

class ClassItem extends StatelessWidget {
  const ClassItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 88.h,
        width: 343.w,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        margin: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 5.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: const Color(0xffE8F5FB),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/tick.png'),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      '  09/02/2024',
                      style: defaultText16,
                    ),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    text: 'GV: ',
                    style: defaultText14,
                    children: [
                      TextSpan(
                        text: 'Hoàng Mạnh hùng',
                        style: defaultText14.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Spacer(),
            Container(
              height: 60.dg,
              width: 60.dg,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xff2F9CD3),
                ),
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  '9',
                  style: defaultText20.copyWith(
                    fontSize: 32.sp,
                    color: const Color(0xff2F9CD3),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
