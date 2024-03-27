import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';

class ButtonInCart extends StatelessWidget {
  const ButtonInCart({super.key, required this.onTap, required this.number});
  final void Function() onTap;
  final  number;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.sp),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(10.sp),
        ),
        child: Center(
            child: Text(
          "make order - $number",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 13.sp),
        )),
      ),
    );
  }
}
