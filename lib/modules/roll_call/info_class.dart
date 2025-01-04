import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_s/modules/models/class_model.dart';
import 'package:three_s/modules/roll_call/detail_class.dart';
import 'package:three_s/modules/roll_call/list_bt_danop.dart';
import 'package:three_s/repo/class_repo.dart';
import '../../utils/constants/color.dart';
import '../../utils/constants/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoClass extends StatefulWidget {
  const InfoClass({super.key, required this.model, required this.id});
  final InfoClassModel model;
  final String id;
  @override
  State<InfoClass> createState() => _InfoClassState();
}

class _InfoClassState extends State<InfoClass> {
  bool _isLoading = false;
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
                widget.model.title,
                style: defaultText20.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Divider(
              thickness: 6.h,
              color: const Color(0xffF0F0F0),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20)),
              onPressed: () async {
                setState(() {
                  _isLoading = true;
                });
                // InfoCheckinModel infoModel1 =
                //     await ClassRepo().getInfoHomework(widget.model.id);
                List<BaiTapModel> listBT =
                    await ClassRepo().getListBT(widget.id);

                setState(() {
                  _isLoading = false;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => ListBaiDaNop(
                          listBT: listBT,
                        )),
                  ),
                );
              },
              child: _isLoading
                  ? SizedBox(
                      width: 28.w,
                      height: 28.h,
                      child: const CircularProgressIndicator(),
                    )
                  : const Text('Xem bài tập đã nộp'),
            ),
            SizedBox(
              height: 10.h,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: widget.model.attributes.length,
                itemBuilder: (BuildContext context, int index) {
                  return _ClassItem(
                    model: widget.model.attributes[index],
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class _ClassItem extends StatefulWidget {
  const _ClassItem({super.key, required this.model});
  final AttendanceModel model;

  @override
  State<_ClassItem> createState() => _ClassItemState();
}

class _ClassItemState extends State<_ClassItem> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        setState(() {
          _isLoading = true;
        });
        InfoCheckinModel infoModel1 =
            await ClassRepo().getInfoHomework(widget.model.id);
        setState(() {
          _isLoading = false;
        });
        if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => DetailClass(
                    infoCheckinModel: infoModel1,
                    title1: widget.model.buoiHoc,
                    title2: widget.model.buoiHoc,
                  )),
            ),
          );
        }
      },
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
                  Row(
                    children: [
                      (int.parse(widget.model.gvStatus) == 1)
                          ? Image.asset('assets/images/cancle.png')
                          : (int.parse(widget.model.gvStatus) == -1)
                              ? const SizedBox()
                              : Image.asset('assets/images/tick.png'),
                      Text(
                        ' ${widget.model.createdDate}',
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
                            'Ca học',
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
                            widget.model.timeStart,
                            style: defaultText14.copyWith(
                              fontWeight: FontWeight.w600,
                              color: primary500,
                              height: 1.8.h,
                            ),
                          ),
                          Text(
                            widget.model.timeEnd,
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
                                height: 1.8.h),
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
                      (int.parse(widget.model.gvStatus) == 0)
                          ? Container(
                              width: 64.w,
                              height: 28.h,
                              decoration: BoxDecoration(
                                color: const Color(0xffF9A825),
                                borderRadius: BorderRadius.circular(8.r),
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
                          : (int.parse(widget.model.gvStatus) == 1)
                              ? Container(
                                  width: 64.w,
                                  height: 28.h,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffF9A825),
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
                              : (int.parse(widget.model.gvStatus) == 2)
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
                                          'Check in',
                                          style: defaultText12.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  : (int.parse(widget.model.gvStatus) == 3)
                                      ? Container(
                                          width: 64.w,
                                          height: 28.h,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Đúng giờ',
                                              style: defaultText12.copyWith(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        )
                                      : (int.parse(widget.model.gvStatus) == 4)
                                          ? Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                color: const Color(0xff2F9CD3),
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Check out',
                                                  style: defaultText12.copyWith(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            )
                                          : (int.parse(widget.model.gvStatus) ==
                                                  5)
                                              ? Container(
                                                  width: 64.w,
                                                  height: 28.h,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xff2F9CD3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.r),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'Tan học',
                                                      style: defaultText12
                                                          .copyWith(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Container(
                                                  width: 64.w,
                                                  height: 28.h,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xff2F9CD3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.r),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      'Chưa học',
                                                      style: defaultText12
                                                          .copyWith(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffF5F5F5),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.r),
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(
                      16.w,
                      10.h,
                      12.w,
                      10.h,
                    ),
                    child: Text(
                      'Ghi chú : ${widget.model.noteCheckIn}\n${widget.model.noteCheckOut}',
                      style: defaultText14,
                    ),
                  ),
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
