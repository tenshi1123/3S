import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:three_s/modules/splash/onboarding.dart';

class Splshscreen extends StatefulWidget {
  const Splshscreen({super.key});

  @override
  State<Splshscreen> createState() => _SplshscreenState();
}

class _SplshscreenState extends State<Splshscreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Onbonding(),
        ),
      ),
    );
  }

// I can't tell you what it really is
// I can't only tell you what it feels like
// and right now there's a steel knife in my windpipe
// I can't breathe but i still fight while i can fight
// as long as the wrong feels right it's like I'M in flight
// High off her love drunk from her hate
// its like i'm huffin' paint
// and i love her the more i suffer i suffocate
// and right berfore I'm about to drown she resuscitates
// me she fuckin hates me and i love it - wait
// where you goning i'm leaving you
// no you ain't come back we're running right back
// here we go again it's so insane
// cause when it's goin good it's goin great
// i'm superman with the wind at his back
// she's lois lane but when it's bad it's awful
// i feel so ashamed i snapped who's that dude
// i don't even know his name
// i laid hands on her i'll never stoop so low again
// i guess i don't know my own strength
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Image.asset(
        "assets/images/splash.png",
        height: 844.h,
        width: 390.w,
        fit: BoxFit.fill,
      ),
    );
  }
}
