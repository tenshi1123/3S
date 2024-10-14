// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/mediaqury.dart';
import '../../../utils/constants/vn_languegua.dart';
import '../../utils/constants/color.dart';
import '../../utils/constants/styles.dart';
import 'wellcome_screen.dart';

class Onbonding extends StatefulWidget {
  const Onbonding({super.key});

  @override
  _OnbondingState createState() => _OnbondingState();
}

class _OnbondingState extends State<Onbonding> {
  final int _numPages = 3;

  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  late bool isLoading;

  @override
  void initState() {
    isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 3.0),
      height: 8.h,
      width: isActive ? 20.w : 8.w,
      decoration: BoxDecoration(
        color: isActive ? key1Color : d9Color,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              height: height,
              child: PageView(
                physics: const ClampingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Column(
                            children: [
                              SizedBox(height: 124.h),
                              Image.asset(
                                "assets/images/onboard1.png",
                                width: 359.w,
                                height: 342.h,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(height: 5.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 18.w),
                                child: Text(
                                  'Đồng hành cùng con mọi lúc, mọi nơi',
                                  style: TextStyle(
                                    color: keyBlack,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: height / 40),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Text(
                                  VnString.itisrecommended,
                                  textAlign: TextAlign.center,
                                  style: defaultText16.copyWith(
                                    color: subBlack,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Column(
                            children: [
                              SizedBox(height: 124.h),
                              Image.asset(
                                "assets/images/onboard2.png",
                                width: 375.w,
                                height: 334.h,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                'Lộ trình khóa học đa dạng',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: keyBlack,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: height / 40),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.w,
                                ),
                                child: Text(
                                  VnString.thaksforfunevent,
                                  textAlign: TextAlign.center,
                                  style: defaultText16.copyWith(
                                    color: subBlack,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: 124.h),
                      Image.asset(
                        "assets/images/onboard3.png",
                        width: 342.w,
                        height: 342.h,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 18.w),
                        child: Text(
                          'Phương pháp học hiệu quả',
                          style: TextStyle(
                            color: keyBlack,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: height / 40),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          VnString.withtimelynotification,
                          textAlign: TextAlign.center,
                          style: defaultText16.copyWith(
                            color: subBlack,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // _currentPage != _numPages - 1
            //     ? Column(
            //         children: [
            //           SizedBox(height: height / 1.12),
            //           Container(
            //             color: Colors.transparent,
            //             height: height / 11,
            //             child: Align(
            //               child: Padding(
            //                 padding: EdgeInsets.symmetric(horizontal: 22.w),
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: <Widget>[

            //                     Container(
            //                       color: Colors.transparent,
            //                       child: Row(
            //                         mainAxisAlignment: MainAxisAlignment.center,
            //                         children: _buildPageIndicator(),
            //                       ),
            //                     ),
            //                     GestureDetector(
            //                       onTap: () {
            //                         _pageController.nextPage(
            //                             duration:
            //                                 const Duration(microseconds: 300),
            //                             curve: Curves.easeIn);
            //                       },
            //                       child: Container(
            //                           height: 42.h,
            //                           width: 42.w,
            //                           decoration: BoxDecoration(
            //                               color: sub1Color,
            //                               borderRadius: BorderRadius.all(
            //                                   Radius.circular(16.r))),
            //                           child: Center(
            //                             child: Icon(
            //                               Icons.keyboard_arrow_right,
            //                               size: 30.h,
            //                               color: wihitecolor,
            //                             ),
            //                           )),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       )
            //     :
            Column(
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const WellcomeScreen()),
                          ),
                        );
                      },
                      child: Text(
                        "Bỏ qua",
                        style: defaultText16,
                      ),
                    ),
                    SizedBox(
                      width: width / 20,
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                ),
                SizedBox(
                  height: 100.h,
                ),
                GestureDetector(
                  onTap: () {
                    _currentPage != _numPages - 1
                        ? _pageController.nextPage(
                            duration: const Duration(microseconds: 300),
                            curve: Curves.easeIn)
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => const WellcomeScreen()),
                            ),
                          );
                  },
                  child: Container(
                    height: 48.h,
                    width: 340.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.r),
                      color: key1Color,
                    ),
                    child: Center(
                      child: Text(
                        'Tiếp tục',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
