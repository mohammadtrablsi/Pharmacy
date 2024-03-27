import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constant/color.dart';

void appDialog(
  String title,
  String message,
  void Function() onTap,
) {
  Get.defaultDialog(
    title: title,
    content: Text(
      message,
      style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
    ),
    confirm: InkWell(
      onTap: onTap,
      child: Text(
        "OK",
        style: TextStyle(
            color: AppColor.primaryColor,
            fontSize: 11.sp,
            fontWeight: FontWeight.bold),
      ),
    ),
  );
}
