import 'package:flutter/material.dart';
import 'package:pharmacy/core/constant/color.dart';
import 'package:sizer/sizer.dart';

import '../in common/medicineItem.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem(
      {super.key, required this.isEnmated, this.data, this.onPressedDelete});
  final bool isEnmated;
  final data;
  final onPressedDelete;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            MedicineItem(
              data: data,
            ),
            Positioned(
              left: 1.w,
              bottom: 0.5.h,
              child: AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: isEnmated ? 0 : 1,
                child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: isEnmated ? 0 : 17.sp, //15
                    )),
              ),
            ),
          ],
        ),
        Positioned(
            left: 1.w,
            top: 0.5.h,
            child: InkWell(
              onTap: onPressedDelete,
              child: Icon(
                Icons.cancel,
                color: AppColor.primaryColor,
                size: 15.sp,
              ),
            )),
      ],
    );
  }
}
