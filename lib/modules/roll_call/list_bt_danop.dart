import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_s/modules/models/class_model.dart';
import 'package:three_s/modules/roll_call/detail_class.dart';
import 'package:three_s/repo/class_repo.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/constants/color.dart';
import '../../utils/constants/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/widget/fullscreen_image.dart';

class ListBaiDaNop extends StatefulWidget {
  const ListBaiDaNop({super.key, required this.listBT});
  final List<BaiTapModel> listBT;

  @override
  State<ListBaiDaNop> createState() => _ListBaiDaNopState();
}

class _ListBaiDaNopState extends State<ListBaiDaNop> {
  final bool _isLoading = false;
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
          'Danh sách bài tập đã nộp',
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
        child: widget.listBT.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: widget.listBT.length,
                itemBuilder: (BuildContext context, int index) {
                  return _ClassItem(
                    model: widget.listBT[index],
                  );
                })
            : Center(
                child: Text(
                  'Chưa có bài tập nào được nộp',
                  style: defaultText16.copyWith(
                    color: keyBlack,
                    fontWeight: FontWeight.w600,
                    height: 2.h,
                  ),
                ),
              ),
      ),
    );
  }
}

class _ClassItem extends StatefulWidget {
  const _ClassItem({super.key, required this.model});
  final BaiTapModel model;

  @override
  State<_ClassItem> createState() => _ClassItemState();
}

class _ClassItemState extends State<_ClassItem> {
  final bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {},
      child: _isLoading
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 150.w, vertical: 20.h),
              child: SizedBox(
                width: 40.w,
                height: 40.h,
                child: const CircularProgressIndicator(),
              ),
            )
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    ' ${widget.model.createdDate}',
                    style: defaultText16.copyWith(
                      color: keyBlack,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Buổi học',
                            style: defaultText14.copyWith(height: 1.8.h),
                          ),
                          Text(
                            'Ca học',
                            style: defaultText14.copyWith(height: 1.8.h),
                          ),
                          Text(
                            'Giáo viên:',
                            style: defaultText14.copyWith(height: 1.8.h),
                          ),
                          Text(
                            'Điểm',
                            style: defaultText14.copyWith(height: 1.8.h),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.model.buoiHoc,
                            style: defaultText14.copyWith(
                                fontWeight: FontWeight.w600,
                                color: primary500,
                                height: 1.8.h),
                          ),
                          Text(
                            widget.model.time,
                            style: defaultText14.copyWith(
                              fontWeight: FontWeight.w600,
                              color: primary500,
                              height: 1.8.h,
                            ),
                          ),
                          Text(
                            widget.model.nameTeacher,
                            style: defaultText14.copyWith(
                              fontWeight: FontWeight.w600,
                              color: primary500,
                              height: 1.8.h,
                            ),
                          ),
                          Text(
                            widget.model.point ?? 'Chưa có điểm',
                            style: defaultText14.copyWith(
                                fontWeight: FontWeight.w600,
                                color: primary500,
                                height: 1.8.h),
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                  Text(
                    'Bài tập đã nộp',
                    style: defaultText14.copyWith(
                        fontWeight: FontWeight.w600,
                        color: primary500,
                        height: 1.8.h),
                  ),
                  (widget.model.linkHomework[0].contains('docx') ||
                          widget.model.linkHomework[0].contains('pdf'))
                      ? InkWell(
                          onTap: () async {
                            if (!await launchUrl(
                                Uri.parse(widget.model.linkHomework[0]))) {
                              throw Exception('Could not launch ');
                            }
                          },
                          child: Container(
                            width: 343.w,
                            height: 66.h,
                            margin: EdgeInsets.symmetric(vertical: 10.h),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withAlpha(50),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(12.r),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10.w,
                                ),
                                Container(
                                  height: 55.h,
                                  width: 55.w,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/document.png'),
                                      fit: BoxFit.fill,
                                    ),
                                    color: Color(0xff6B7AC7),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      'Xem bài tập đã nộp',
                                      style: defaultText14.copyWith(),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: widget.model.linkHomework.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        opaque: false,
                                        barrierColor: Colors.black,
                                        pageBuilder:
                                            (BuildContext context, _, __) {
                                          return FullScreenPage(
                                            dark: true,
                                            child: Image.network(
                                              widget.model.linkHomework[index],
                                              width: 100.w,
                                              height: 90.h,
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: Image.network(
                                      widget.model.linkHomework[index])),
                            );
                          }),
                  const Divider(),
                  SizedBox(
                    height: 10.h,
                  )
                ],
              ),
            ),
    );
  }
}
