import 'package:flutter/material.dart';
import 'package:pharmacy/core/constant/color.dart';
import 'package:sizer/sizer.dart';

class AnimatedOnePoint extends StatelessWidget {
  const AnimatedOnePoint(
      {super.key, required this.arrangement, required this.indexPage});
  final int arrangement;
  final int indexPage;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: EdgeInsetsDirectional.only(
        start: 2.w,
        end: 2.w,
      ),
      height: indexPage == arrangement ? 0.5.h : 1.h,
      width: indexPage == arrangement ? 8.w : 2.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(360),
        color: indexPage == arrangement
            ? AppColor.activePointOfOnBoarding
            : AppColor.passivePointOfOnBoarding,
      ),
      duration: const Duration(milliseconds: 1000),
    );
  }
}
