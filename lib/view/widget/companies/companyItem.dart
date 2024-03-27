import 'package:flutter/material.dart';
import 'package:pharmacy/core/constant/color.dart';
import 'package:sizer/sizer.dart';

class CompanyItem extends StatelessWidget {
  const CompanyItem({super.key, required this.text, required this.image});
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.primaryColor, width: 0.2.h),
          borderRadius: BorderRadius.circular(5.sp)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(5.sp),
            child: Container(
              width: 20.w,
              height: 8.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.sp),
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.cover)),
            )),
        SizedBox(height: 1.h),
        Container(
            constraints: BoxConstraints(maxWidth: 20.w),
            child: Text(
              text,
              maxLines: 1,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )),
      ]),
    );
  }
}
