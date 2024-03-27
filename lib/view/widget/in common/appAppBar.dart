import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar(
      {Key? key,
      required this.text,
      required this.haveBackIcon,
      required this.haveActionIcon,
      this.actionIcon,
      this.onTapActionIcon})
      : super(key: key);
  final String text;
  final bool haveBackIcon;
  final bool haveActionIcon;
  final actionIcon;
  final onTapActionIcon;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      shadowColor: AppColor.secondryColor,
      leading: haveBackIcon
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: AppColor.secondryColor,
              ),
              onPressed: () {
                Get.back();
              },
            )
          : Container(),
      backgroundColor: AppColor.primaryColor,
      centerTitle: true,
      title: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15.sp,
          color: AppColor.secondryColor,
        ),
      ),
      actions: [
        haveActionIcon
            ? Padding(
                padding: EdgeInsetsDirectional.only(end: 3.w),
                child: InkWell(
                    onTap: onTapActionIcon,
                    child: Icon(
                      actionIcon,
                      color: AppColor.secondryColor,
                      size: 20.sp,
                    )),
              )
            : const SizedBox(),
      ],
    );
  }
}
