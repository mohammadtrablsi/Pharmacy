import 'package:flutter/material.dart';
import 'package:pharmacy/view/widget/home/rowCircle.dart';
import 'package:pharmacy/view/widget/home/rowSeeAll.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/appMargin.dart';

class ViewPart extends StatelessWidget {
  const ViewPart(
      {super.key,
      required this.text,
      required this.textButton,
      required this.textButtonOnPressed,
      required this.data});
  final String text;
  final String textButton;
  final void Function() textButtonOnPressed;
  final data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppMargin.ScreenMargin),
          child: Column(children: [
            RowSeeAll(
                text: text,
                textButton: textButton,
                textButtonOnPressed: textButtonOnPressed),
          ]),
        ),
        SizedBox(
          height: 1.h,
        ),
        RowCircle(data: data),
      ],
    );
  }
}
