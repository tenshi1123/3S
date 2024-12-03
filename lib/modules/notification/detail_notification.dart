import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_s/utils/constants/color.dart';
import 'package:three_s/utils/constants/styles.dart';

class DetailNoti extends StatelessWidget {
  const DetailNoti({
    super.key,
  });

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
          title: const Text('Thông báo'),
          // actions: [
          //   SvgPicture.asset('assets/icons/calendar.svg'),
          //   SizedBox(
          //     width: 5.w,
          //   )
          // ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network('https://picsum.photos/250?image=9'),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Ra mắt khóa học: Luyện thi DGNL 2025',
                  style: defaultText16.copyWith(
                    fontWeight: FontWeight.w600,
                    color: keyBlack,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  '20:05 - 28/10/2022',
                  style: defaultText14.copyWith(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xffBDBDBD),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                  style: defaultText14.copyWith(
                    fontWeight: FontWeight.w400,
                    color: keyBlack,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
