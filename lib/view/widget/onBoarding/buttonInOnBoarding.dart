import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';

class ButtonInOnBoarding extends StatelessWidget {
  const ButtonInOnBoarding(
      {super.key,
      required this.onPressed,
      required this.isChildText,
      required this.text,
      required this.paddingVertical,
      required this.paddingHorizontal,
      this.widthOfButton,
      this.icon,
      required this.isButtonBig});
  final void Function()? onPressed;
  final bool isChildText;
  final bool isButtonBig;
  final String text;
  final double paddingVertical;
  final double paddingHorizontal;
  final double? widthOfButton;
  final icon;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 5.0,
      padding: EdgeInsets.symmetric(
          vertical: paddingVertical, horizontal: paddingHorizontal),
      color: AppColor.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      onPressed: onPressed,
      child: isChildText
          ? isButtonBig
              ? SizedBox(
                  width: double.infinity,
                  child: Center(
                      child: Text(
                    text,
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: AppColor.textColorInButtonOfOnBoarding),
                  )))
              : Text(
                  text,
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColor.textColorInButtonOfOnBoarding),
                )
          : Row(
              children: [
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColor.textColorInButtonOfOnBoarding),
                ),
                SizedBox(
                  width: 1.w,
                ),
                Icon(
                  icon,
                  color: AppColor.textColorInButtonOfOnBoarding,
                )
              ],
            ),
    );
  }
}
