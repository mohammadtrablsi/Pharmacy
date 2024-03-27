import 'package:flutter/material.dart';
import 'package:pharmacy/view/widget/home/inSideShimmerRowSeeAll.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ShimmerRowMedicineAndSeeAll extends StatelessWidget {
  const ShimmerRowMedicineAndSeeAll({Key? key}) : super(key: key);

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
                  children: [
                    SizedBox(
                      width: 3.w,
                    ),
                    Container(
                      width: 35.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(10.sp)),
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
