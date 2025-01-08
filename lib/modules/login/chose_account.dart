import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:three_s/utils/constants/styles.dart';

import '../../main.dart';
import '../../repo/class_repo.dart';
import '../../repo/course_repo.dart';
import '../../repo/info_repo.dart';
import '../bottom_nav_bar/bottom_nav_bar.dart';
import '../models/class_model.dart';
import '../models/course_model.dart';
import '../models/info_model.dart';

class ChoseAccount extends StatelessWidget {
  const ChoseAccount({super.key, required this.listChildrenModel});
  final List<ChildrenInfoModel> listChildrenModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF3F7FB),
        body: Column(
          children: [
            SizedBox(
              height: 60.h,
            ),
            Image(
              image: const AssetImage('assets/images/logo.png'),
              height: 93.h,
              width: 88.w,
            ),
            SizedBox(
              height: 30.h,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: listChildrenModel.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: _AccountItem(
                      childrenModel: listChildrenModel[index],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class _AccountItem extends StatefulWidget {
  const _AccountItem({required this.childrenModel});
  final ChildrenInfoModel childrenModel;

  @override
  State<_AccountItem> createState() => _AccountItemState();
}

class _AccountItemState extends State<_AccountItem> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        setState(() {
          _isLoading = true;
        });
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', widget.childrenModel.refreshToken);
        InfoModel infoModel = await InfoRepo().getInfo();
        List<UpcommingModel> upcommingModel =
            await CourseRepo().getUpcommingClass();
        List<ClassModel> listClass = await ClassRepo().listClass();
        //comment tam ti mo
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => BottomNavBar(
                  type: 0,
                  categories: listCate,
                  infoModel: infoModel,
                  upcommingModel: upcommingModel,
                  listClasses: listClass,
                )),
          ),
        );
      },
      child: _isLoading
          ? Center(
              child: SizedBox(
                width: 48.w,
                height: 48.h,
                child: const CircularProgressIndicator(),
              ),
            )
          : Container(
              height: 80.h,
              width: 343.w,
              margin: EdgeInsets.symmetric(
                vertical: 12.h,
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withAlpha(20),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 1),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(8.r),
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 16.w,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.childrenModel.img),
                    radius: 30.r,
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Text(
                    widget.childrenModel.nameChild,
                    style: defaultText14.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                    size: 25.dg,
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                ],
              ),
            ),
    );
  }
}
