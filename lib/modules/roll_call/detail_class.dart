import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_s/modules/models/class_model.dart';
import '../../utils/constants/color.dart';
import '../../utils/constants/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'detail_class_tabbar.dart';

class DetailClass extends StatelessWidget {
  const DetailClass(
      {super.key,
      required this.infoCheckinModel,
      required this.title1,
      required this.title2});
  final InfoCheckinModel infoCheckinModel;
  final String title1;
  final String title2;
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
          title1,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Text(
                title2,
                style: defaultText20.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Divider(
              thickness: 6.h,
              color: const Color(0xffF0F0F0).withAlpha(50),
            ),
            SizedBox(
              height: 660.h,
              width: 375.w,
              child: DetailClassTabbar(
                infoCheckinModel: infoCheckinModel,
              ),
            ),
            // ListView.builder(
            //     shrinkWrap: true,
            //     physics: const ClampingScrollPhysics(),
            //     itemCount: 1,
            //     itemBuilder: (BuildContext context, int index) {
            //       return const _ClassItem();
            //     }),
          ],
        ),
      ),
    );
  }
}
