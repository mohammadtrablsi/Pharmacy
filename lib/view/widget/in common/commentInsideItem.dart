import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';

class CommentInsideItem extends StatelessWidget {
  const CommentInsideItem(
      {super.key,
      required this.name,
      required this.date,
      required this.rate,
      required this.maxWidthForText,
      required this.starsSize});
  final String name;
  final String date;
  final double rate;
  final double maxWidthForText;
  final double starsSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                constraints: BoxConstraints(maxWidth: maxWidthForText),
                child: Text(
                  name,
                  maxLines: 1,
                  style: TextStyle(fontSize: 11.sp, color: Colors.black87),
                )),
            RatingBar(
              initialRating: rate,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              ratingWidget: RatingWidget(
                full: const Icon(
                  Icons.star,
                  color: AppColor.primaryColor,
                ),
                half: const Icon(
                  Icons.star_half,
                  color: AppColor.primaryColor,
                ),
                empty: const Icon(
                  Icons.star_border,
                ),
              ),
              ignoreGestures: true,
              onRatingUpdate: (double value) {},
              itemSize: starsSize,
            ),
          ],
        ),
        SizedBox(
          height: 0.7.h,
        ),
        Text(
          date,
          maxLines: 1,
          style: TextStyle(fontSize: 9.sp, color: Colors.grey),
        ),
      ],
    );
  }
}
