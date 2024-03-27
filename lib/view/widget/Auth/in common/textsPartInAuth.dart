import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextsPartInAuth extends StatelessWidget {
  const TextsPartInAuth({super.key, required this.title, required this.text});
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 2.sp,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
        ),
      ],
    );
  }
}
