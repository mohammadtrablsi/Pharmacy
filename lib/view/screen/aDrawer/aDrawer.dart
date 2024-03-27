import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/controller/aDrawer/aDrawerController.dart';
import 'package:pharmacy/core/constant/appMargin.dart';


import 'package:pharmacy/core/constant/imageassets.dart';
import 'package:pharmacy/view/widget/aDrawer/buttonInDrawer.dart';
import 'package:sizer/sizer.dart';

import '../../widget/aDrawer/rowInADrawer.dart';

class ADrawer extends StatelessWidget {
  const ADrawer({super.key, required this.cancelOnPressed});

  final void Function() cancelOnPressed;
  @override
  Widget build(BuildContext context) {
    ADrawerController controller=Get.put(ADrawerController());
    controller.setCancelOnPressed(cancelOnPressed);
    return Scaffold(
      body: Container(
        width: 70.w,
        height: double.infinity,
        color: const Color(0xFF17203A),
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              top: 11.h), //8
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding:
                  EdgeInsetsDirectional.only(start: AppMargin.ScreenMargin / 3),
              child: RowInADrawer(
                name: controller.myServices.sharedPreferences.getString('nameOfUser')!,
                image: AppImageAsset.user,
                cancelOnPressed: cancelOnPressed,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 10.w),
              child: Text(
                "BROWSE",
                style: TextStyle(color: Colors.white, fontSize: 12.sp),
              ),
            ),
            SizedBox(height: 2.h),
            GetBuilder<ADrawerController>(builder: (controller) {
              return Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: controller.taps.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ButtonInDrawer(
                      index: index,
                      currentIndex: controller.currentIndex,
                      taps: controller.taps,
                      onTap: () {
                        controller.onPressedButtonInDrawer(index);
                      },
                    );
                  },
                ),
              );
            }),
          ]),
        ),
      ),
    );
  }
}
