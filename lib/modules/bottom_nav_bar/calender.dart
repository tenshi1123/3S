import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:three_s/repo/course_repo.dart';
import '../../utils/constants/styles.dart';
import '../models/course_model.dart';

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
          Card(
            elevation: 1,
            shadowColor: Colors.grey,
            child: Container(
              height: 1,
              color: Colors.white,
            ),
          ),
          // const SizedBox(height: 32.0),
          // ElevatedButton(
          //   onPressed: () {
          //     _controller.animateToDate(DateTime.now());
          //   },
          //   child: const Text('Đến ngày hôm nay'),
          // ),
          Stack(
            children: [
              // ListView.builder(
              //   shrinkWrap: true,
              //   physics: const ScrollPhysics(),
              //   itemCount: 12,
              //   itemBuilder: (context, index) {
              //     return Container(
              //       margin: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 40.h),
              //       width: 350.w,
              //       height: 30.h,
              //       child: Row(children: [
              //         SizedBox(
              //           width: 50.w,
              //           child: Text(
              //             '${8 + index}:00',
              //             style: defaultText16,
              //           ),
              //         ),
              //         Container(
              //           height: 1,
              //           width: 250.w,
              //           color: primary500,
              //         ),
              //       ]),
              //     );
              //   },
              // ),
              FutureBuilder(
                future: CourseRepo().getScheduleList(DateFormat("dd-MM-yyyy")
                    .format(_selectedDate)), // Hàm gọi API
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text(
                      'Something went wrong',
                      style: defaultText14,
                    );
                  } else if (snapshot.hasData) {
                    final listLichHoc = snapshot.data as List<LichHocModel>;
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: listLichHoc.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.fromLTRB(120.w, 14.h, 20.w, 30.h),
                          padding: EdgeInsets.only(left: 15.w),
                          width: 280.w,
                          height: 184.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border(
                                left: BorderSide(
                              color: const Color(0xff6B9DDF),
                              width: 6.w,
                            )),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                listLichHoc[index].createdDate,
                                style: defaultText14.copyWith(
                                  color: const Color(0xff878787),
                                ),
                              ),
                              Text(
                                listLichHoc[index].name,
                                style: defaultText16.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                listLichHoc[index].buoiHoc,
                                style: defaultText14.copyWith(
                                  color: const Color.fromARGB(255, 83, 83, 83),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${listLichHoc[index].timeStart.replaceAll(RegExp(r".{3}$"), "")} đến ',
                                    style: defaultText14.copyWith(
                                      color:
                                          const Color.fromARGB(255, 83, 83, 83),
                                    ),
                                  ),
                                  Text(
                                    listLichHoc[index]
                                        .timeEnd
                                        .replaceAll(RegExp(r".{3}$"), ""),
                                    style: defaultText14.copyWith(
                                      color:
                                          const Color.fromARGB(255, 83, 83, 83),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: const Color.fromARGB(
                                        255, 248, 248, 248),
                                    radius: 20.r,
                                    backgroundImage: NetworkImage(
                                      listLichHoc[index].avatar,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        listLichHoc[index].nameTeacher,
                                        style: defaultText16.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        listLichHoc[index].position,
                                        style: defaultText14,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return Text(
                      'Something went wrong2',
                      style: defaultText14,
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
