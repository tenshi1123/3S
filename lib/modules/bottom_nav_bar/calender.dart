import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_s/utils/constants/color.dart';
import '../../utils/constants/styles.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});
  @override
  State<Calender> createState() => _NewWidgetExampleState();
}

class _NewWidgetExampleState extends State<Calender> {
  DateTime _selectedDate = DateTime.now();
  final EasyInfiniteDateTimelineController _controller =
      EasyInfiniteDateTimelineController();
  @override
  void initState() {
    super.initState();
  }

// do not forget to dispose the controller
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 40.h,
          ),
          EasyInfiniteDateTimeLine(
            controller: _controller,
            firstDate: DateTime(2024, 3, 18),
            lastDate: DateTime(2030, 3, 18),
            activeColor: const Color(0xff0F2645),
            locale: "vi",
            onDateChange: (selectedDate) {
              setState(() {
                _selectedDate = selectedDate;
              });
            },
            focusDate: _selectedDate,
          ),
          const SizedBox(height: 32.0),
          ElevatedButton(
            onPressed: () {
              _controller.animateToDate(DateTime.now());
            },
            child: const Text('Đến ngày hôm nay'),
          ),
          Stack(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 40.h),
                    width: 350.w,
                    height: 30.h,
                    child: Row(children: [
                      SizedBox(
                        width: 50.w,
                        child: Text(
                          '${8 + index}:00',
                          style: defaultText16,
                        ),
                      ),
                      Container(
                        height: 1,
                        width: 250.w,
                        color: primary500,
                      ),
                    ]),
                  );
                },
              ),
              // ListView.builder(
              //   shrinkWrap: true,
              //   physics: const ScrollPhysics(),
              //   itemCount: 3,
              //   itemBuilder: (context, index) {
              //     return Container(
              //       margin: EdgeInsets.fromLTRB(120.w, 14.h, 20.w, 30.h),
              //       padding: EdgeInsets.only(left: 15.w),
              //       width: 280.w,
              //       height: 184.h,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(12.0),
              //         border: Border(
              //             left: BorderSide(
              //           color: const Color(0xff6B9DDF),
              //           width: 6.w,
              //         )),
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.grey.withOpacity(0.5),
              //             spreadRadius: 5,
              //             blurRadius: 7,
              //             offset: const Offset(0, 3),
              //           ),
              //         ],
              //         color: Colors.white,
              //       ),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         children: [
              //           Text(
              //             'Thứ 4 ngày 08, tháng 12 2024',
              //             style: defaultText14.copyWith(
              //               color: const Color(0xff878787),
              //             ),
              //           ),
              //           Text(
              //             'Lớp toán ôn luyện ĐGNL 2025 ',
              //             style: defaultText16.copyWith(
              //               fontWeight: FontWeight.w600,
              //             ),
              //           ),
              //           Row(
              //             children: [
              //               const CircleAvatar(
              //                 backgroundColor:
              //                     Color.fromARGB(255, 248, 248, 248),
              //                 radius: 20,
              //                 backgroundImage: NetworkImage(
              //                     'https://trungtam3s.vn/images/hinh-nen.jpg'),
              //               ),
              //               SizedBox(
              //                 width: 5.w,
              //               ),
              //               Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     'Hoàng Mạnh Hùng',
              //                     style: defaultText16.copyWith(
              //                       fontWeight: FontWeight.w600,
              //                     ),
              //                   ),
              //                   Text(
              //                     'Giáo viên toán',
              //                     style: defaultText14,
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
