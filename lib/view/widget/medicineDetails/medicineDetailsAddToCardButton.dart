import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';

class MedicineDetailsAddToCardButton extends StatelessWidget {
  const MedicineDetailsAddToCardButton({Key? key, required this.onTap})
      : super(key: key);
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15.sp),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(15.sp),
        ),
        child: Text(
          'add to cart',
          style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
