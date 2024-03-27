import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ShimmerAdsItem extends StatelessWidget {
  const ShimmerAdsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ltr,
      baseColor: Colors.grey.withOpacity(0.25),
      highlightColor: Colors.white.withOpacity(0.6),
      period: const Duration(seconds: 2),
      child: Container(
        height: 20.h,
        width: 80.w,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.9),
            borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
