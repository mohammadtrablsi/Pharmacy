import 'package:flutter/material.dart';
import 'package:pharmacy/core/constant/color.dart';
import 'package:sizer/sizer.dart';

class RowSeeAll extends StatelessWidget {
  const RowSeeAll(
      {super.key,
      required this.text,
      required this.textButton,
      required this.textButtonOnPressed});
  final String text;
  final String textButton;
  final void Function() textButtonOnPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        TextButton(
            onPressed: textButtonOnPressed,
            child: Text(
              textButton,
              style: const TextStyle(color: AppColor.primaryColor),
            ))
      ],
    );
  }
}
