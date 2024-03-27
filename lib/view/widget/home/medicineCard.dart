import 'package:flutter/material.dart';
import 'package:pharmacy/core/constant/color.dart';
import 'package:sizer/sizer.dart';

class MedicineCard extends StatelessWidget {
  const MedicineCard(
      {super.key,
      required this.text,
      required this.image,
      required this.helperUniqueTage,
      required this.sellerPrice});
  final String text;
  final String image;
  final String helperUniqueTage;
  final String sellerPrice;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Hero(
              tag: "$image$helperUniqueTage",
              transitionOnUserGestures: true,
              child: Container(
                  width: 35.w,
                  height: 10.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.sp),
                        topRight: Radius.circular(5.sp)),
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.cover),
                  ))),
          Container(
            width: 35.w,
            height: 10.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5.sp),
                  bottomRight: Radius.circular(5.sp)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          constraints: BoxConstraints(maxWidth: 26.w),
                          child: Text(
                            text,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 10.sp, fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        constraints: BoxConstraints(maxWidth: 22.w),
                        child: Text(
                          "$sellerPrice\$",
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 10.sp, color: AppColor.primaryColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
