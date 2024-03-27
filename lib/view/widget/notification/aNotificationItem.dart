import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ANotificationItem extends StatelessWidget {
  const ANotificationItem({super.key, required this.text, required this.time});
  final String text;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding:
            EdgeInsetsDirectional.symmetric(horizontal: 3.w, vertical: 1.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 2.w),
            child: Text(
              text,
              style: TextStyle(color: Colors.black87, fontSize: 13.sp),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                time,
                style: TextStyle(fontSize: 10.sp, color: Colors.grey),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
