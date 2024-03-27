import 'package:flutter/material.dart';
import 'package:pharmacy/view/widget/home/shimmerRowCircleAndRowSeeAll.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import 'inSideShimmerRowSeeAll.dart';

class ShimmerPackagesAndOffersInHome extends StatelessWidget {
  const ShimmerPackagesAndOffersInHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ShimmerRowCircleAndRowSeeAll(),
        SizedBox(
          height: 3.5.h,
        ),
        Shimmer.fromColors(
            direction: ShimmerDirection.ltr,
            baseColor: Colors.grey
                .withOpacity(0.25),
            highlightColor: Colors.white.withOpacity(0.6),
            period: const Duration(seconds: 2),
            child: const InsideShimmerRowSeeAll()),
      ],
    );
  }
}
