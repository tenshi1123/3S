import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_s/modules/monthly_summary/summary_score.dart';
import 'package:three_s/repo/report_repo.dart';
import '../../utils/constants/color.dart';
import '../../utils/constants/styles.dart';
import '../models/report_model.dart';

class MonthlySummary extends StatelessWidget {
  const MonthlySummary({super.key, required this.listClasses});
  final List<ScheduleModel> listClasses;
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
          itemCount: listClasses.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () async {
                ReportPoint reportPoint =
                    await ReportRepo().getReportPoint(listClasses[index].id);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => SummaryScore(
                          reportPoint: reportPoint,
                          title: listClasses[index].name,
                        )),
                  ),
                );
              },
              child: _ClassItem(
                model: listClasses[index],
              ),
            );
          }),
    );
  }
}

class _ClassItem extends StatelessWidget {
  const _ClassItem({super.key, required this.model});
  final ScheduleModel model;
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
              model.name,
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
                    text: model.date,
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
