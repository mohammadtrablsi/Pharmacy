import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';
import '../orders/detailsOfOrder/itemInDetailsOfOrder.dart';

class CartItem extends StatelessWidget {
  const CartItem(
      {super.key,
      required this.item,
      required this.addOnTap,
      required this.minimizeOnTap,
      required this.deleteOnTap});
  final item;
  final void Function() addOnTap;
  final void Function() minimizeOnTap;
  final void Function() deleteOnTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          alignment: Alignment.centerRight,
          children: [
            ItemInDetailsOfOrde(
              imageUrl: item.image,
              text: [
                ' ${item.name}',
                '${item.quantity}',
                '${item.totalSellerPrice}',
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                children: [
                  addOrMinimizeIcon(addOnTap, Icons.add),
                  SizedBox(
                    height: 2.h,
                  ),
                  addOrMinimizeIcon(minimizeOnTap, Icons.remove),
                ],
              ),
            ),
          ],
        ),
        Positioned(
            left: 1.w,
            top: 1.w,
            child: InkWell(
              borderRadius: BorderRadius.circular(15.sp),
              onTap: deleteOnTap,
              child: Icon(
                Icons.cancel,
                color: Colors.red.shade400,
                size: 15.sp,
              ),
            )),
      ],
    );
  }

  Widget addOrMinimizeIcon(void Function() onTap, var icon) {
    return InkWell(
        onTap: onTap,
        child: Container(
            width: 6.w,
            height: 6.w,
            decoration: const BoxDecoration(
                color: AppColor.primaryColor, shape: BoxShape.circle),
            child: Center(
                child: Icon(
              icon,
              color: Colors.white,
              size: 4.w,
            ))));
  }
}
