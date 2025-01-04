import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_s/modules/notification/detail_notification.dart';
import 'package:three_s/utils/constants/color.dart';
import 'package:three_s/utils/constants/styles.dart';
import '../models/notification_model.dart';

class ListNoti extends StatelessWidget {
  const ListNoti({
    super.key,
    required this.listNotifications,
  });
  final List<NotiModel> listNotifications;
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
      body: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: ListView.builder(
            //shrinkWrap: true,
            //physics: const ClampingScrollPhysics(),
            itemCount: listNotifications.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  // if (ListNotifications[index].link.contains('https://')) {
                  //   if (!await launchUrl(Uri.parse('https://hvg.edu.vn'))) {
                  //     throw Exception('Could not launch ');
                  //   }
                  // } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => DetailNoti(
                            model: listNotifications[index],
                          )),
                    ),
                  );
                  //}
                },
                child: _NotiItem(
                  model: listNotifications[index],
                  isShow: (index == 0)
                      ? true
                      : (listNotifications[index].createdAt.substring(0, 10) !=
                          listNotifications[index - 1]
                              .createdAt
                              .substring(0, 10)),
                ),
              );
            }),
      ),
    );
  }
}

class _NotiItem extends StatelessWidget {
  const _NotiItem({
    required this.model,
    required this.isShow,
  });
  final NotiModel model;
  final bool isShow;
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
          Padding(
            padding: EdgeInsets.only(left: 15.w, bottom: 15.h, top: 2.h),
            child: isShow
                ? Text(
                    model.createdAt.substring(0, 10),
                    style: defaultText16.copyWith(
                      fontWeight: FontWeight.w600,
                      color: keyBlack,
                    ),
                  )
                : const SizedBox(),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  model.icon,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return const Text('😢');
                  },
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
                          fontWeight: FontWeight.w500,
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
                        color: const Color(0xffA3A3A3),
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
