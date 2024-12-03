import 'dart:core';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_s/modules/models/class_model.dart';
import 'package:three_s/repo/class_repo.dart';
import 'package:three_s/utils/constants/color.dart';
import 'package:three_s/utils/constants/styles.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailClassTabbar extends StatefulWidget {
  const DetailClassTabbar({super.key, required this.infoCheckinModel});
  final InfoCheckinModel infoCheckinModel;
  @override
  State<DetailClassTabbar> createState() => _DetailClassTabbarState();
}

class _DetailClassTabbarState extends State<DetailClassTabbar>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TabBar.secondary(
          tabAlignment: TabAlignment.start,
          padding: EdgeInsets.zero,
          indicatorPadding: EdgeInsets.zero,
          labelPadding: EdgeInsets.only(left: 10.w),
          isScrollable: true,
          indicatorColor: primary600,
          // indicator: BoxDecoration(
          //   borderRadius: BorderRadius.circular(
          //     25.0,
          //   ),
          //   color: const Color(0xff2F9CD3),
          // ),
          indicatorSize: TabBarIndicatorSize.label,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 2.w), //hight of indicator
            insets: EdgeInsets.symmetric(
                horizontal:
                    10.w), //give some padding to reduce the size of indicator
          ),
          labelStyle: defaultText14.copyWith(
            fontWeight: FontWeight.w700,
          ),
          controller: _tabController,
          labelColor: const Color(0xff2F9CD3),
          unselectedLabelColor: Colors.black,
          tabs: const <Widget>[
            Tab(
              text: '     Bài tập     ',
            ),
            // second tab [you can add an icon using the icon property]
            Tab(
              text: '     Tài liệu     ',
            ),
            Tab(
              text: 'Nhận xét buổi học',
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              //Bài tập
              // SizedBox(
              //   height: 160.dg,
              //   width: 260.dg,
              //   child: const _PieChart(),
              // ),

              ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: widget.infoCheckinModel.document.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _HomeworkItem(
                      model: widget.infoCheckinModel.homeWork[index],
                    );
                  }),
              //Tài liệu
              SizedBox(
                width: 343.w,
                height: 110.h,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: widget.infoCheckinModel.document.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _DocumentItem(
                          model: widget.infoCheckinModel.document[index],
                        );
                      }),
                ),
              ),
              //Nhận xét
              widget.infoCheckinModel.feedbacks.isEmpty
                  ? Text(
                      'Không có nhận xét nào',
                      style: defaultText16.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: widget.infoCheckinModel.feedbacks.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _FeedbackItem(
                          model: widget.infoCheckinModel.feedbacks[index],
                          //title: index,
                        );
                      }),
            ],
          ),
        ),
      ],
    );
  }
}

class _DocumentItem extends StatelessWidget {
  const _DocumentItem({super.key, required this.model});

  final DocumentModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (!await launchUrl(Uri.parse('https://hvg.edu.vn'))) {
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
              color: Colors.grey.withOpacity(0.5),
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
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(model.image),
                  fit: BoxFit.fill,
                ),
                color: const Color(0xff6B7AC7),
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
                  width: 200.w,
                  child: Text(
                    model.name,
                    style: defaultText16.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Tải xuống để xem',
                  style: defaultText14.copyWith(),
                )
              ],
            ),
            const Spacer(),
            SvgPicture.asset(
              'assets/icons/downloads.svg',
            ),
            SizedBox(
              width: 20.w,
            ),
          ],
        ),
      ),
    );
  }
}

class _PieChart extends StatelessWidget {
  const _PieChart({super.key});

  @override
  Widget build(BuildContext context) {
    List<OrdinalData> ordinalDataList = [
      OrdinalData(domain: '1', measure: 90, color: const Color(0xff3A7DD4)),
      OrdinalData(domain: '2', measure: 10, color: const Color(0xffd9d9d9)),
      OrdinalData(domain: '3', measure: 33, color: Colors.white),
    ];
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 26 / 16,
          child: DChartPieO(
            data: ordinalDataList,
            customLabel: (ordinalData, index) {
              return "";
            },
            configRenderPie: ConfigRenderPie(
              arcLabelDecorator: ArcLabelDecorator(
                labelPosition: ArcLabelPosition.auto,
                leaderLineStyle: const ArcLabelLeaderLineStyle(
                  color: Colors.transparent,
                  length: 30,
                  thickness: 0,
                ),
                showLeaderLines: true,
              ),
              arcLength: 2 * pi,
              arcRatio: 0.2,
              //arcWidth: 10,
              startAngle: pi * 3 / 4,
              strokeWidthPx: 0,
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '9',
                style: defaultText16.copyWith(
                  fontSize: 48.sp,
                  fontWeight: FontWeight.bold,
                  color: primary500,
                ),
              ),
              Text(
                'Điểm số của bạn',
                style: defaultText14.copyWith(
                  fontWeight: FontWeight.w600,
                  color: primary500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FeedbackItem extends StatelessWidget {
  const _FeedbackItem({super.key, required this.model});
  final FeedbackModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 375.w,
          height: 100.h,
          child: Row(
            children: [
              SizedBox(
                width: 16.w,
              ),
              Container(
                height: 55.h,
                width: 55.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(model.avatar),
                    fit: BoxFit.fill,
                  ),
                  color: const Color(0xff6B7AC7),
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              SizedBox(
                width: 270.w,
                height: 80.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      model.nameLecture,
                      style: defaultText16.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Giảng viên toán',
                      style: defaultText12.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          width: 343.w,
          height: 186.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Đánh giá:  ',
                    style: defaultText16.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: 150.w,
                    height: 30.h,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const ClampingScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return Icon(
                            (int.parse(model.type) > index)
                                ? Icons.star
                                : Icons.star_border_outlined,
                            color: const Color(0xffFFC400),
                            size: 24.0,
                          );
                        }),
                  ),
                  // const Icon(
                  //   Icons.star,
                  //   color: Color(0xffFFC400),
                  //   size: 24.0,
                  // ),
                  // const Icon(
                  //   Icons.star_border_outlined,
                  //   color: Color(0xffFFC400),
                  //   size: 24.0,
                  // ),
                  // Text(
                  //   '  (Tốt)',
                  //   style: defaultText14.copyWith(
                  //     fontWeight: FontWeight.w400,
                  //   ),
                  // ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Nhận xét:',
                    style: defaultText16.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Text(
                  model.content,
                  style: defaultText14.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _HomeworkItem extends StatelessWidget {
  const _HomeworkItem({super.key, required this.model});
  final HomeWorkModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        // if (!await launchUrl(Uri.parse('https://hvg.edu.vn'))) {
        //   throw Exception('Could not launch ');
        // }
        List<DetailHomeWorkModel> detail1 =
            await ClassRepo().getDetailHomework(model.id);
        _dialogBuilder(
          context,
          detail1: detail1,
          title: model.name,
        );
      },
      child: Container(
        width: 343.w,
        //height: 66.h,
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  height: 55.h,
                  width: 55.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(model.image),
                      fit: BoxFit.fill,
                    ),
                    color: const Color(0xffCEE8F5),
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
                      width: 200.w,
                      child: Text(
                        model.name,
                        style: defaultText16.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      'Tải xuống để xem',
                      style: defaultText14.copyWith(),
                    )
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () async {
                    // if (!await launchUrl(Uri.parse('https://hvg.edu.vn'))) {
                    //   throw Exception('Could not launch ');
                    // }
                    List<DetailHomeWorkModel> detail1 =
                        await ClassRepo().getDetailHomework(model.id);
                    if (detail1.isEmpty) {
                      if (!await launchUrl(Uri.parse(model.image))) {
                        throw Exception('Could not launch ');
                      }
                    } else {
                      if (!await launchUrl(
                          Uri.parse(detail1[0].linkHomework))) {
                        throw Exception('Could not launch ');
                      }
                    }
                  },
                  child: SvgPicture.asset(
                    'assets/icons/downloads.svg',
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
              ],
            ),
            const Divider(),
            Text(
              'Hạn nộp bài: ${model.timeDeadline}',
              style: defaultText14.copyWith(
                color: primary900,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Ghi chú:',
              style: defaultText14.copyWith(
                color: primary900,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              model.notes,
              style: defaultText14.copyWith(
                color: primary900.withOpacity(0.8),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _dialogBuilder(
  BuildContext context, {
  required List<DetailHomeWorkModel> detail1,
  required String title,
}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          style: defaultText14.copyWith(
            color: primary900.withOpacity(0.8),
            fontWeight: FontWeight.w400,
          ),
        ),
        content: Text(
          detail1.isEmpty
              ? 'Bạn chưa được chấm điểm'
              : 'Điểm của bạn là : ${detail1[0].point}',
          style: defaultText14.copyWith(
            color: primary900.withOpacity(0.8),
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
