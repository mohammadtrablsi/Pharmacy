import 'package:flutter/material.dart';
import 'package:pharmacy/view/widget/home/inSideShimmerRowSeeAll.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ShimmerRowCircleAndRowSeeAll extends StatelessWidget {
  const ShimmerRowCircleAndRowSeeAll({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ltr,
      baseColor: Colors.grey.withOpacity(0.25),
      highlightColor: Colors.white.withOpacity(0.6),
      period: const Duration(seconds: 2),
      child: Column(
        children: [
          const InsideShimmerRowSeeAll(),
          SizedBox(
            height: 1.h,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                5,
                (index) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 4.w,
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.6),
                          radius: 10.w,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          width: 10.w,
                          height: 2.h,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(15.sp)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
