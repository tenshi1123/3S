import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_s/modules/roll_call/detail_class.dart';
import '../../utils/constants/color.dart';
import '../../utils/constants/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoClass extends StatelessWidget {
  const InfoClass({super.key});

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
                'Lớp toán thầy Hiệp ôn luyện ĐGNL 2025 ',
                style: defaultText20.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Divider(
              thickness: 6.h,
              color: const Color(0xffF0F0F0),
            ),
            const _ClassItem(
              index: 1,
              time1: '07:56',
              time2: '10:05',
              day: '   09/12/2024',
            ),
            const _ClassItem(
              index: 2,
              time1: '---',
              time2: '---',
              day: '   19/12/2024',
            ),
            const _ClassItem(
              index: 3,
              time1: '---',
              time2: '---',
              day: '   10/12/2024',
            ),
            const _ClassItem(
              index: 4,
              time1: '07:56',
              time2: '10:05',
              day: '   11/12/2024',
            ),
            const _ClassItem(
              index: 1,
              time1: '07:56',
              time2: '10:05',
              day: '   12/12/2024',
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

class _ClassItem extends StatelessWidget {
  const _ClassItem(
      {super.key,
      required this.index,
      required this.time1,
      required this.time2,
      required this.day});
  final int index;
  final String day;
  final String time1;
  final String time2;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  (index == 2)
                      ? Image.asset('assets/images/cancle.png')
                      : Image.asset('assets/images/tick.png'),
                  Text(
                    day,
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
                        'Ca học:',
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
                        '08:00 - 10:00',
                        style: defaultText14.copyWith(
                            fontWeight: FontWeight.w600,
                            color: primary500,
                            height: 1.8.h),
                      ),
                      Text(
                        time1,
                        style: defaultText14.copyWith(
                            fontWeight: FontWeight.w600,
                            color: primary500,
                            height: 1.8.h),
                      ),
                      Text(
                        time2,
                        style: defaultText14.copyWith(
                            fontWeight: FontWeight.w600,
                            color: primary500,
                            height: 1.8.h),
                      ),
                      Text(
                        'Hoàng Mạnh hùng',
                        style: defaultText14.copyWith(
                            fontWeight: FontWeight.w600,
                            color: primary500,
                            height: 1.8.h),
                      ),
                    ],
                  ),
                  const Spacer(),
                  (index == 1)
                      ? const SizedBox()
                      : (index == 2)
                          ? Container(
                              width: 64.w,
                              height: 28.h,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Center(
                                child: Text(
                                  'Nghỉ',
                                  style: defaultText12.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          : (index == 3)
                              ? Container(
                                  width: 64.w,
                                  height: 28.h,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffF9A825),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Đi muộn  ',
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
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Về sớm',
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
