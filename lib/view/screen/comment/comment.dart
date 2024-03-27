import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/core/constant/appMargin.dart';
import 'package:pharmacy/core/constant/color.dart';
import 'package:pharmacy/view/widget/in%20common/appAppBar.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/comment/CommentController.dart';
import '../../widget/in common/CommentInsideItem.dart';

class Comment extends StatelessWidget {
  const Comment({super.key});

  @override
  Widget build(BuildContext context) {
    double widthOfScreen = MediaQuery.of(context).size.width;
    Get.put(CommentController());
    return Scaffold(
      appBar: const AppAppBar(
        text: 'Comment',
        haveBackIcon: true,
        haveActionIcon: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppMargin.ScreenMargin),
        child: GetBuilder<CommentController>(builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.h),
              Text(
                "Comment(${controller.data.length})",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    controller.setNumberOfRatings(controller.data.length);
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300 * index),
                      transform: Matrix4.translationValues(
                          controller.isEnmated
                              ? (widthOfScreen - AppMargin.ScreenMargin)
                              : 0,
                          0,
                          0),
                      child: Card(
                          color: Colors.white,
                          shadowColor: AppColor.primaryColor,
                          child: Container(
                            margin: EdgeInsetsDirectional.only(bottom: 1.3.h),
                            padding: EdgeInsets.all(3.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.sp),
                            ),
                            child: CommentInsideItem(
                                name: controller.data[index]['nameOfUser'],
                                date:
                                    '${controller.data[index]['date']} ${controller.data![index]['time']}',
                                rate: controller.data[index]['numberOfRating'],
                                maxWidthForText: 55.w,
                                starsSize: 13.sp),
                          )),
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
