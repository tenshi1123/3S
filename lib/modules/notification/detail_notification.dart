import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_s/utils/constants/color.dart';
import 'package:three_s/utils/constants/styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/notification_model.dart';

class DetailNoti extends StatelessWidget {
  const DetailNoti({
    super.key,
    required this.model,
  });
  final NotiModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(4.0),
              child: Container(
                //margin: EdgeInsets.only(bottom: 20.h),
                padding: EdgeInsets.only(bottom: 20.h),
                color: const Color(0xfff0f0f0),
                height: 1.0,
              )),
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
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image.network(model.),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  model.title,
                  style: defaultText16.copyWith(
                    fontWeight: FontWeight.w600,
                    color: keyBlack,
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  model.createdAt,
                  style: defaultText14.copyWith(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xffBDBDBD),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  model.content,
                  style: defaultText14.copyWith(
                    fontWeight: FontWeight.w400,
                    color: keyBlack,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                // if (ListNotifications[index].link.contains('https://')) {
                //   if (!await launchUrl(Uri.parse('https://hvg.edu.vn'))) {
                //     throw Exception('Could not launch ');
                //   }
                // } else {
                model.link.contains('https://')
                    ? const SizedBox()
                    : GestureDetector(
                        onTap: () async {
                          if (!await launchUrl(Uri.parse(model.link))) {
                            throw Exception('Could not launch ');
                          }
                        },
                        child: Center(
                          child: Container(
                            height: 32.h,
                            width: 120.w,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.r)),
                                color: Colors.blue,
                                border:
                                    Border.all(color: Colors.white, width: 1)),
                            child: Center(
                              child: Text(
                                'Mở trình duyệt',
                                style: defaultText12.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Nunito-Bold'),
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ));
  }
}
