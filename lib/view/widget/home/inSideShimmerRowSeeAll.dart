import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/appMargin.dart';

class InsideShimmerRowSeeAll extends StatelessWidget {
  const InsideShimmerRowSeeAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: AppMargin.ScreenMargin,
          end: AppMargin.ScreenMargin,
          top: 2.h,
          bottom: 1.25.h),
      child: Row(
        children: [
          Container(
            height: 2.h,
            width: 22.w,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.9),
                borderRadius: BorderRadius.circular(15.sp)),
          ),
          const Spacer(),
          Container(
            height: 2.h,
            width: 13.w,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.9),
                borderRadius: BorderRadius.circular(15.sp)),
          ),
        ],
      ),
    );
  }
}
