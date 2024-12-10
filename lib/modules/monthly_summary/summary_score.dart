import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:three_s/modules/models/report_model.dart';
import 'package:three_s/utils/constants/color.dart';
import '../../utils/constants/styles.dart';
import '../../utils/widget/excercise_tab_widget.dart';

class SummaryScore extends StatelessWidget {
  const SummaryScore(
      {super.key, required this.reportPoint, required this.title});
  final ReportPoint reportPoint;
  final String title;
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
            Row(
              children: [
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  title,
                  style: defaultText20.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            Divider(
              thickness: 6.h,
              color: const Color(0xffF0F0F0),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Text(
                'Tháng ${DateFormat('MM, yyyy').format(DateTime.now())}',
                style: defaultText20.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 250.dg,
              width: 300.dg,
              child: PieChart(
                score: reportPoint.pointAvg,
              ),
            ),
            Text(
              'Thật tuyệt vời!',
              style: defaultBoldText.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
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
              height: 16.h,
            ),
            reportPoint.listPoints.isEmpty
                ? Text(
                    'Chưa có bài tập nào',
                    style: defaultText16.copyWith(
                      fontWeight: FontWeight.w600,
                      color: primary500,
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: reportPoint.listPoints.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ClassItem(
                        model: reportPoint.listPoints[index],
                      );
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
  const ClassItem({super.key, required this.model});
  final ListPointModel model;
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
                      width: 8.w,
                    ),
                    SizedBox(
                      width: 200.w,
                      child: Text(
                        model.name,
                        style: defaultBoldText.copyWith(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                ),
                // RichText(
                //   text: TextSpan(
                //     text: 'GV: ',
                //     style: defaultText14,
                //     children: [
                //       TextSpan(
                //         text: 'Hoàng Mạnh hùng',
                //         style: defaultText14.copyWith(
                //           fontWeight: FontWeight.w600,
                //         ),
                //       ),
                //     ],
                //   ),
                // )
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
                  model.point,
                  style: defaultText20.copyWith(
                    fontSize: 20.sp,
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
