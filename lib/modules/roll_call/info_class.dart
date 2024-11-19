import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_s/modules/models/class_model.dart';
import 'package:three_s/modules/roll_call/detail_class.dart';
import '../../utils/constants/color.dart';
import '../../utils/constants/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoClass extends StatelessWidget {
  const InfoClass({super.key, required this.model});
  final InfoClassModel model;
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
          'Chi tiết lớp học',
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
                model.title,
                style: defaultText20.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Divider(
              thickness: 6.h,
              color: const Color(0xffF0F0F0),
            ),
            // const _ClassItem(
            //   index: 1,
            //   time1: '07:56',
            //   time2: '10:05',
            //   day: '   09/12/2024',
            // ),
            // const _ClassItem(
            //   index: 2,
            //   time1: '---',
            //   time2: '---',
            //   day: '   19/12/2024',
            // ),
            // const _ClassItem(
            //   index: 3,
            //   time1: '---',
            //   time2: '---',
            //   day: '   10/12/2024',
            // ),
            // const _ClassItem(
            //   index: 4,
            //   time1: '07:56',
            //   time2: '10:05',
            //   day: '   11/12/2024',
            // ),
            // const _ClassItem(
            //   index: 1,
            //   time1: '07:56',
            //   time2: '10:05',
            //   day: '   12/12/2024',
            // ),
            ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: model.attributes.length,
                itemBuilder: (BuildContext context, int index) {
                  return _ClassItem(
                    index: 1,
                    time1: '07:56',
                    time2: '10:05',
                    day: '   12/12/2024',
                    model: model.attributes[index],
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class _ClassItem extends StatelessWidget {
  const _ClassItem(
      {super.key,
      required this.index,
      required this.time1,
      required this.time2,
      required this.day,
      required this.model});
  final int index;
  final String day;
  final String time1;
  final String time2;
  final AttendanceModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        //HomeWorkModel model = await ClassRepo().getInfoHomework('767');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => const DetailClass()),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SizedBox(
          width: 343.w,
          height: 280.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  (int.parse(model.gvStatus) == 4)
                      ? Image.asset('assets/images/tick.png')
                      : (int.parse(model.gvStatus) == 0)
                          ? const SizedBox()
                          : Image.asset('assets/images/cancle.png'),
                  Text(
                    model.createdDate,
                    style: defaultText16.copyWith(
                      color: keyBlack,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
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
                        'Giờ đến lớp:',
                        style: defaultText14.copyWith(height: 1.8.h),
                      ),
                      Text(
                        'Giờ ra về:',
                        style: defaultText14.copyWith(height: 1.8.h),
                      ),
                      Text(
                        'Giáo viên:',
                        style: defaultText14.copyWith(height: 1.8.h),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.buoiHoc,
                        style: defaultText14.copyWith(
                            fontWeight: FontWeight.w600,
                            color: primary500,
                            height: 1.8.h),
                      ),
                      Text(
                        model.timeStart,
                        style: defaultText14.copyWith(
                          fontWeight: FontWeight.w600,
                          color: primary500,
                          height: 1.8.h,
                        ),
                      ),
                      Text(
                        model.timeEnd,
                        style: defaultText14.copyWith(
                          fontWeight: FontWeight.w600,
                          color: primary500,
                          height: 1.8.h,
                        ),
                      ),
                      Text(
                        model.nameTeacher,
                        style: defaultText14.copyWith(
                            fontWeight: FontWeight.w600,
                            color: primary500,
                            height: 1.8.h),
                      ),
                    ],
                  ),
                  const Spacer(),
                  (int.parse(model.gvStatus) == 4)
                      ? const SizedBox()
                      : (int.parse(model.gvStatus) == 2)
                          ? Container(
                              width: 64.w,
                              height: 28.h,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Center(
                                child: Text(
                                  'Xin nghỉ',
                                  style: defaultText12.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          : (int.parse(model.gvStatus) == 3)
                              ? Container(
                                  width: 64.w,
                                  height: 28.h,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffF9A825),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Đi muộn',
                                      style: defaultText12.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              : (int.parse(model.gvStatus) == 1)
                                  ? Container(
                                      width: 64.w,
                                      height: 28.h,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffF9A825),
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Vắng mặt',
                                          style: defaultText12.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: 64.w,
                                      height: 28.h,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff2F9CD3),
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Chưa học',
                                          style: defaultText12.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                ],
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
