import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constant/color.dart';

Future<dynamic> appRatingDialog(double rating,void Function() onPressedButton ,setRatingNumber(double rating)){
return Get.defaultDialog(
      title: "Rate this item",
      titleStyle: TextStyle(fontSize: 16.sp,color: Colors.black,fontWeight: FontWeight.bold),
      content: Column(
        children: [
          RatingBar.builder(
            initialRating: rating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: AppColor.primaryColor,
            ),
            onRatingUpdate: (newRating) {
              rating = newRating;
              setRatingNumber(newRating);
            },
            glowColor: AppColor.primaryColor,
            unratedColor: Colors.grey.shade400,
          ),
          SizedBox(height: 3.h),
         InkWell(
            onTap: onPressedButton,
            child: Container(padding: EdgeInsets.symmetric(horizontal:3.w,vertical:1.h),decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.sp),color: AppColor.primaryColor),child: const Text("Submit",style: TextStyle(color: Colors.white),)),
          ),
        ],
      ),
    );
}