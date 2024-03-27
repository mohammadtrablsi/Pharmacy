import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OnBoardingImage extends StatelessWidget {
  const OnBoardingImage({super.key, required this.image, required this.height});
  final String image;
  final int height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.h,
      child: Image.asset(
        image,
        height: 40.h,
        fit: BoxFit.cover,
      ),
    );
  }
}
