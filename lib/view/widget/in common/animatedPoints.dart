import 'package:flutter/material.dart';
import 'package:pharmacy/view/widget/in%20common/animatedOnePoint.dart';
import 'package:sizer/sizer.dart';

class AnimatedPoints extends StatelessWidget {
  const AnimatedPoints({required this.indexPage, super.key});
  final int indexPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedOnePoint(
          arrangement: 0,
          indexPage: indexPage,
        ),
        SizedBox(
          width: 1.w,
        ),
        AnimatedOnePoint(
          arrangement: 1,
          indexPage: indexPage,
        ),
        SizedBox(width: 1.w),
        AnimatedOnePoint(
          arrangement: 2,
          indexPage: indexPage,
        ),
      ],
    );
  }
}
