import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:three_s/modules/models/class_model.dart';
import 'package:three_s/repo/class_repo.dart';
import 'package:three_s/modules/roll_call/info_class.dart';
import '../../utils/constants/color.dart';
import '../../utils/constants/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ListClass extends StatelessWidget {
  const ListClass({super.key, required this.listClasses});
  final List<ClassModel> listClasses;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
        title: const Text('Theo dõi lớp học'),
        actions: [
          SvgPicture.asset('assets/icons/calendar.svg'),
          SizedBox(
            width: 5.w,
          )
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            height: 620.h,
            width: 375.w,
            child:

                // FutureBuilder(
                //     future: CourseRepo().getScheduleList(DateFormat("dd-MM-yyyy")
                //         .format(_selectedDate)),
                //     builder: (context, snapshot) {
                //       if (snapshot.connectionState == ConnectionState.waiting) {
                //         return const CircularProgressIndicator();
                //       } else if (snapshot.hasError) {
                //         return Text(
                //           'Something went wrong',
                //           style: defaultText14,
                //         );
                //       } else if (snapshot.hasData) {
                //         final listLichHoc = snapshot.data as List<LichHocModel>;

                //       } else {
                //         return Text(
                //           'Something went wrong2',
                //           style: defaultText14,
                //         );
                //       }
                //     },
                //   ),

                ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: listClasses.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () async {
                          InfoClassModel infoClass = await ClassRepo()
                              .getInfoClass(listClasses[index].id);
                          if (context.mounted) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => InfoClass(
                                      model: infoClass,
                                      id: listClasses[index].id,
                                    )),
                              ),
                            );
                          }
                        },
                        child: _ClassItem(
                          model: listClasses[index],
                        ),
                      );
                    }),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120.h,
              width: 375.w,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withAlpha(50),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    child: Text(
                      '(*) Lưu ý: Nếu có sai sót về điểm danh về buổi học vui lòng liên hệ lại với giáo viên để được hỗ trợ.',
                      style: defaultText14.copyWith(
                        color: const Color(0xffDF1111),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ClassItem extends StatelessWidget {
  const _ClassItem({required this.model});
  final ClassModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 152.h,
      padding: EdgeInsets.only(left: 5.w),
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(
          Radius.circular(12.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(50),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.only(left: 20.w),
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
              model.courseName,
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
                    text: DateFormat("dd-MM-yyyy").format(model.dateOpen),
                    style: defaultText14.copyWith(
                      fontWeight: FontWeight.w600,
                      color: primary500,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  height: 48.h,
                  width: 140.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: const Color(0xffF7F7F7),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/tick.png'),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${model.finished} buổi ',
                            style: defaultText14.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Đã hoàn thành',
                            style: defaultText12,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Container(
                  height: 48.h,
                  width: 140.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: const Color(0xffF7F7F7),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/images/missing.png'),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${model.missed} buổi ',
                            style: defaultText14.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Vắng mặt',
                            style: defaultText12,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
