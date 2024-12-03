import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_s/modules/notification/detail_notification.dart';
import 'package:three_s/utils/constants/color.dart';
import 'package:three_s/utils/constants/styles.dart';

import '../models/notification_model.dart';

class ListNoti extends StatelessWidget {
  const ListNoti({
    super.key,
    required this.ListNotifications,
  });
  final List<NotiModel> ListNotifications;
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
      body: ListView.builder(
          //shrinkWrap: true,
          //physics: const ClampingScrollPhysics(),
          itemCount: ListNotifications.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const DetailNoti()),
                  ),
                );
              },
              child: _NotiItem(
                model: ListNotifications[index],
              ),
            );
          }),
    );
  }
}

class _NotiItem extends StatelessWidget {
  const _NotiItem({
    super.key,
    required this.model,
  });
  final NotiModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      // height: 152.h,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: EdgeInsets.only(left: 15.w, bottom: 15.h, top: 2.h),
          //   child: Text(
          //     'Hôm nay',
          //     style: defaultText16.copyWith(
          //       fontWeight: FontWeight.w600,
          //       color: keyBlack,
          //     ),
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  model.icon,
                  height: 32.h,
                  width: 32.w,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title,
                      style: defaultText14.copyWith(
                        fontWeight: FontWeight.w600,
                        color: keyBlack,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SizedBox(
                      width: 300.w,
                      child: Text(
                        model.content,
                        style: defaultText14.copyWith(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff575757),
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      model.createdAt,
                      style: defaultText14.copyWith(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffBDBDBD),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
