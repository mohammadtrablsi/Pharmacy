import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class RowInADrawer extends StatelessWidget {
  const RowInADrawer(
      {super.key,
      required this.cancelOnPressed,
      required this.name,
      required this.image});
  final void Function() cancelOnPressed;
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 6.w,
          backgroundImage: AssetImage(image),
        ),
        SizedBox(
          width: 2.w,
        ),
        Container(
            constraints: BoxConstraints(maxWidth: 40.w),
            child: Text(
              name,
              style: TextStyle(fontSize: 11.sp, color: Colors.white),
            )),
        const Spacer(),
        IconButton(
            onPressed: cancelOnPressed,
            icon: Icon(
              Icons.cancel_rounded,
              color: Colors.white,
              size: 26.sp,
            )),
      ],
    );
  }
}
