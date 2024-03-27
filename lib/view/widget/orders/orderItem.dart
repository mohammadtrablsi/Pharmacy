import 'package:flutter/material.dart';
import 'package:pharmacy/core/constant/color.dart';
import 'package:sizer/sizer.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, this.data, required this.onPressedDelete});
  final data;
  final void Function() onPressedDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.7.h),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textInOrderItem(data['List'][0]['companyName'], 1),
                SizedBox(
                  height: 0.9.h,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textInOrderItem("order:", 2),
                            textInOrderItem('${data['orderId']}', 3),
                          ],
                        ),
                        SizedBox(
                          height: 0.3.h,
                        ),
                        textInOrderItem("${data['date']}  ${data['time']}", 4),
                      ],
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textInOrderItem("total price:", 2),
                        SizedBox(
                          height: 0.3.h,
                        ),
                        textInOrderItem(data['totalSellerPrice'].toString(), 3),
                      ],
                    ),
                    SizedBox(width: 4.w),
                    buttonInOrderItem(),
                  ],
                ),
                SizedBox(
                  height: 2.7.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget textInOrderItem(String text, int typeOfText) {
    if (typeOfText == 1) {
      return Container(
          constraints: BoxConstraints(maxWidth: 58.w),
          child: Text(
            text,
            maxLines: 1,
            style: TextStyle(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 13.sp),
          ));
    } else if (typeOfText == 2) {
      return Text(
        text,
        style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 11.sp),
      );
    } else if (typeOfText == 3) {
      return Container(
        constraints: BoxConstraints(maxWidth: 20.6.w),
        child: Text(
          text,
          maxLines: 2,
          style: TextStyle(fontSize: 12.sp),
        ),
      );
    } else {
      return Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 11.sp, color: Colors.grey),
      );
    }
  }

  Widget buttonInOrderItem() {
    return InkWell(
      borderRadius: BorderRadius.circular(5.sp),
      onTap: data['status'] == 'mangement' ? onPressedDelete : null,
      child: Container(
        decoration: BoxDecoration(
            color: data['status'] == 'mangement'
                ? Colors.red.shade400
                : Colors.grey[400],
            borderRadius: BorderRadius.circular(5.sp)),
        padding:
            EdgeInsetsDirectional.symmetric(vertical: 1.h, horizontal: 5.w),
        child: const Text(
          "cancel",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
