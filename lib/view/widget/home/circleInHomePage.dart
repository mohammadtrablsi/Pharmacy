import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CircleInHomePage extends StatelessWidget {
  const CircleInHomePage({super.key, required this.text, required this.image});
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 10.w,
          backgroundImage: NetworkImage(image),
        ),
        SizedBox(
          height: 1.h,
        ),
        Container(
            constraints: BoxConstraints(maxWidth: 20.w),
            child: Text(
              text,
              maxLines: 1,
              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}
