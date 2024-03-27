import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';

class ButtonInDrawer extends StatelessWidget {
  const ButtonInDrawer(
      {super.key,
      required this.index,
      required this.currentIndex,
      required this.onTap,
      required this.taps});
  final int index;
  final int currentIndex;
  final void Function() onTap;
  final List<Map> taps;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          width: currentIndex == index ? 100.w : 0.w,
          height: 8.h,
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(15.sp)),
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            height: 8.h,
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(color: Colors.white, width: 0.01.h),
              bottom: BorderSide(color: Colors.white, width: 0.01.h),
            )),
            child: Row(
              children: [
                SizedBox(width: 5.w),
                Icon(
                  taps[index]['icon'],
                  color: taps[index]['color'],
                  size: 20.sp,
                ),
                SizedBox(width: 5.w),
                Text(
                  taps[index]['text'],
                  style:
                      TextStyle(fontSize: 13.sp, color: taps[index]['color']),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
