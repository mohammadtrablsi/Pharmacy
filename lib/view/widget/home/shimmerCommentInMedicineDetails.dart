import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ShimmerCommentInMedicineDetails extends StatelessWidget {
  const ShimmerCommentInMedicineDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ltr,
      baseColor: Colors.grey.withOpacity(0.25),
      highlightColor: Colors.white.withOpacity(0.6),
      period: const Duration(seconds: 2),
      child: Column(
        children: [
          //
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 30.w,
                height: 1.h,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(15.sp)),
              ),
              RatingBar(
                initialRating: 5,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                ratingWidget: RatingWidget(
                  full: Icon(
                    Icons.star,
                    color: Colors.grey.withOpacity(0.9),
                  ),
                  half: Icon(
                    Icons.star_half,
                    color: Colors.grey.withOpacity(0.9),
                  ),
                  empty: const Icon(
                    Icons.star_border,
                  ),
                ),
                ignoreGestures: true,
                onRatingUpdate: (double value) {},
                itemSize: 12.sp,
              ),
            ],
          ),
          SizedBox(
            height: 1.75.h,
          ),
          Container(
            width: 20.w,
            height: 0.7.h,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.9),
                borderRadius: BorderRadius.circular(15.sp)),
          ),
        ],
      ),
    );
  }
}
