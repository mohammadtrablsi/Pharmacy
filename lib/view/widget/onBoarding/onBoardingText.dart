import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/core/constant/color.dart';
import 'package:sizer/sizer.dart';

class OnBoardingText extends StatelessWidget {
  const OnBoardingText({super.key, required this.text});
  final text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DefaultTextStyle(
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
          color: AppColor.textColorInOnBoarding,
          height: 1.8,
        ),
        child: AnimatedTextKit(
          isRepeatingAnimation: false,
          animatedTexts: [
            TypewriterAnimatedText(
              text,
            ),
          ],
          onTap: () {},
        ),
      ),
    );
  }
}
