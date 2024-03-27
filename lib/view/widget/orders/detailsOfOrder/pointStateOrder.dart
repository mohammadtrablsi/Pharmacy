import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constant/color.dart';

class PointStateOrder extends StatelessWidget {
  final int? numberState;
  final String nameState;
  final bool isEnamated;
  const PointStateOrder(
      {super.key,
      this.numberState,
      required this.nameState,
      required this.isEnamated});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          child: CircleAvatar(
            backgroundColor: numberState == 1
                ? isEnamated
                    ? AppColor.secondryColor
                    : AppColor.primaryColor
                :
                // : AppColor.isDark == true
                //     ?
                AppColor.secondryColor,
            // : Colors.black12,
            radius: 15,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          nameState,
          style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
              color: AppColor.secondryColor),
        ),
      ],
    );
  }
}
