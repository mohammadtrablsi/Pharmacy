import 'package:flutter/material.dart';
import 'package:pharmacy/core/constant/color.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      required this.widget,
      required this.onpressed,
      required this.radius,
      required this.paddinghorizontal,
      required this.paddingvertical});
  final Widget widget;
  final void Function()? onpressed;
  final radius;
  final paddinghorizontal;
  final paddingvertical;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 5.0,
      padding: EdgeInsets.symmetric(
          horizontal: paddinghorizontal, vertical: paddingvertical),
      color: AppColor.primaryColor,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      onPressed: onpressed,
      child: widget,
    );
  }
}
