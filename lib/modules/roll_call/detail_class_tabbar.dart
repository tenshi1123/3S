import 'dart:core';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:three_s/modules/models/class_model.dart';
import 'package:three_s/repo/class_repo.dart';
import 'package:three_s/utils/constants/color.dart';
import 'package:three_s/utils/constants/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:file_picker/file_picker.dart';

import 'baitap_danop.dart';

class DetailClassTabbar extends StatefulWidget {
  const DetailClassTabbar({super.key, required this.infoCheckinModel});
  final InfoCheckinModel infoCheckinModel;
  @override
  State<DetailClassTabbar> createState() => _DetailClassTabbarState();
}

class _DetailClassTabbarState extends State<DetailClassTabbar>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  bool _isLoading = false;
  List<File> photos = <File>[];
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

  Future _pickImageFromGallery(String id) async {
    final returnedImage = await ImagePicker().pickMultiImage();
    photos = List<File>.from(
      (returnedImage).map(
        (e) => File(e.path),
      ),
    );

    //File(returnedImage!.path);
    if (returnedImage.isNotEmpty) {
      await ClassRepo().uploadExcercise(
        id,
        photos,
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Thông báo',
              style: defaultText14,
            ),
            content: Text(
              'Bạn đã chọn ảnh thành công!',
              style: defaultText14,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _isLoading = false;
                  });
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
    setState(() {});
  }

  Future _pickFile(String id) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    //File(returnedImage!.path);
    if (result != null) {
      File file = File(result.files.single.path!);
      await ClassRepo().uploadExcercise(
        id,
        [file],
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Thông báo',
              style: defaultText14,
            ),
            content: Text(
              'Bạn đã chọn ảnh thành công!',
              style: defaultText14,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _isLoading = false;
                  });
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
    setState(() {});
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
          indicatorSize: TabBarIndicatorSize.label,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(width: 2.w),
            insets: EdgeInsets.symmetric(horizontal: 10.w),
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
              Column(
                children: [
                  SizedBox(
                    height: 12.h,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20)),
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      List<DetailHomeWorkModel> listBT = await ClassRepo()
                          .getDetailHomework(
                              widget.infoCheckinModel.homeWork[0].id);
                      setState(() {
                        _isLoading = false;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => BaiTapDaNop(
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
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: widget.infoCheckinModel.homeWork.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            _HomeworkItem(
                              model: widget.infoCheckinModel.homeWork[index],
                            ),
                            Text(
                              '(*) Lưu ý: bạn chỉ nộp 1 file hoặc ảnh',
                              style: defaultText14.copyWith(
                                color: const Color(0xffDF1111),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(
                                        "Bạn muốn nộp bài ?",
                                        style: defaultText16,
                                      ),
                                      content: Text(
                                        "Vui lòng chọn nộp hình ảnh từ thư viện hoặc nộp file",
                                        style: defaultText14,
                                      ),
                                      actions: [
                                        TextButton(
                                          child: const Text("nộp hình ảnh"),
                                          onPressed: () {
                                            _pickImageFromGallery(widget
                                                .infoCheckinModel
                                                .homeWork[index]
                                                .lessonDocumentId);
                                          },
                                        ),
                                        TextButton(
                                          child: const Text("nộp file"),
                                          onPressed: () {
                                            _pickFile(widget
                                                .infoCheckinModel
                                                .homeWork[index]
                                                .lessonDocumentId);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Container(
                                width: 343.w,
                                height: 52.h,
                                margin: EdgeInsets.symmetric(vertical: 10.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.r),
                                  ),
                                  color: const Color(0xffF4F6F9),
                                  border: Border.all(),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/upload.svg',
                                    ),
                                    Text(
                                      '  Upload bài tập',
                                      style: defaultBoldText.copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                ],
              ),
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
  const _DocumentItem({required this.model});

  final DocumentModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (!await launchUrl(Uri.parse(model.image))) {
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

class _FeedbackItem extends StatelessWidget {
  const _FeedbackItem({required this.model});
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
                color: Colors.grey.withAlpha(50),
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
  const _HomeworkItem({required this.model});
  final HomeWorkModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (!await launchUrl(Uri.parse(model.image))) {
          throw Exception('Could not launch ');
        }
      },
      child: Container(
        width: 343.w,
        //height: 66.h,
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
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
                // quá mệt mỏi rồi không bấm gì nữa
                SvgPicture.asset(
                  'assets/icons/downloads.svg',
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
                color: primary900.withAlpha(80),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
