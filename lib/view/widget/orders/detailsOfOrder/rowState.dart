import 'package:flutter/material.dart';
import 'package:pharmacy/view/widget/orders/detailsOfOrder/pointStateOrder.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constant/color.dart';

class RowState extends StatelessWidget {
  final int numState;
  const RowState({super.key, required this.numState, required this.isEnamated});
  final bool isEnamated;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PointStateOrder(
            isEnamated: isEnamated,
            nameState: 'manged',
            numberState: numState == 1 ? 1 : 0),
        Expanded(
            child: Container(
          height: 2,
          width: 4.w,
          color: AppColor.secondryColor,
        )),
        PointStateOrder(
            isEnamated: isEnamated,
            nameState: 'delivered',
            numberState: numState == 2 ? 1 : 0),
        Expanded(
            child: Container(
          height: 2,
          width: 2.w,
          color: AppColor.secondryColor,
        )),
        PointStateOrder(
            isEnamated: isEnamated,
            nameState: 'canceled',
            numberState: numState == 3 ? 1 : 0),
      ],
    );
  }
}
