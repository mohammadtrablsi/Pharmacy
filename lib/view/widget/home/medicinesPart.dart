import 'package:flutter/material.dart';
import 'package:pharmacy/view/widget/home/rowMedicine.dart';
import 'package:pharmacy/view/widget/home/rowSeeAll.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/appMargin.dart';

class MedicinesPart extends StatelessWidget {
  const MedicinesPart(
      {super.key,
      required this.text,
      required this.data,
      required this.helperUniqueTage,
      required this.textButtonOnPressed});
  final String text;
  final data;
  final String helperUniqueTage;
  final void Function() textButtonOnPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppMargin.ScreenMargin),
          child: Column(children: [
            RowSeeAll(
                text: text,
                textButton: "SeeAll",
                textButtonOnPressed: textButtonOnPressed),
          ]),
        ),
        SizedBox(
          height: 1.h,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: 4.w,
              ),
              RowMedicine(
                data: data,
                helperUniqueTage: helperUniqueTage,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
