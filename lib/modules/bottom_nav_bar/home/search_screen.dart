import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_s/modules/bottom_nav_bar/home/data_search.dart';

import '../../../utils/constants/color.dart';
import '../../../utils/constants/styles.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40.h,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              Container(
                width: 300.w,
                height: 44.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: const Color(0xffF2F2F2),
                  border: Border.all(
                    color: const Color(0xff0091ff),
                  ),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    IconButton(
                      onPressed: () {
                        showSearch(context: context, delegate: DataSearch());
                      },
                      icon: const Icon(Icons.search),
                    ),
                    Text(
                      '  Tìm kiếm tên khoá, từ khoá',
                      style: defaultText16.copyWith(color: subBlack),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(),
          RichText(
            text: TextSpan(
              text: '    0 ',
              style: defaultText16.copyWith(
                color: const Color(0xff2F9CD3),
              ),
              children: [
                TextSpan(
                  text: 'kết quả phù hợp',
                  style: defaultText16,
                ),
              ],
            ),
          ),
          Center(child: Image.asset('assets/images/empty_search.png'))
        ],
      ),
    );
  }
}
