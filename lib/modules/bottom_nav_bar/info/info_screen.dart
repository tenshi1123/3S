import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_s/utils/constants/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../models/info_model.dart';

class InfoUser extends StatelessWidget {
  const InfoUser({
    super.key,
    this.infoModel,
  });
  final InfoModel? infoModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Thông tin tài khoản'),
      ),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 32.r,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(infoModel!.avatar),
              //child: const Text('AH'),
            ),
            SizedBox(
              height: 320.h,
              width: 343.w,
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    height: 56.h,
                    width: 343.w,
                    decoration: BoxDecoration(
                      color: const Color(0xffF7F7F7),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          18.r,
                        ),
                      ),
                    ),
                    margin: EdgeInsets.only(
                      top: 18.h,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 16.w,
                        ),
                        SvgPicture.asset(
                          'assets/icons/info_person.svg',
                          height: 20.h,
                          width: 20.w,
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Text(
                          infoModel!.fullName,
                          style: defaultText16.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 56.h,
                    width: 343.w,
                    margin: EdgeInsets.only(
                      top: 18.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffF7F7F7),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          18.r,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 16.w,
                        ),
                        SvgPicture.asset(
                          'assets/icons/info_birthday.svg',
                          height: 20.h,
                          width: 20.w,
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Text(
                          infoModel!.birthday,
                          style: defaultText16.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 56.h,
                    width: 343.w,
                    margin: EdgeInsets.only(
                      top: 18.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffF7F7F7),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          18.r,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 16.w,
                        ),
                        SvgPicture.asset(
                          'assets/icons/info_sex.svg',
                          height: 20.h,
                          width: 20.w,
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Text(
                          infoModel!.gender,
                          style: defaultText16.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 56.h,
                    width: 343.w,
                    margin: EdgeInsets.only(
                      top: 18.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffF7F7F7),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          18.r,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 16.w,
                        ),
                        SvgPicture.asset(
                          'assets/icons/phone.svg',
                          height: 20.h,
                          width: 20.w,
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Text(
                          infoModel!.phone,
                          style: defaultText16.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
