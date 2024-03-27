import 'package:flutter/material.dart';

import '../../../../core/class/statusrequest.dart';
import '../../../../core/constant/color.dart';
import '../../in common/appButton.dart';
import 'package:sizer/sizer.dart';

class ButtonsPartInAuth extends StatelessWidget {
  const ButtonsPartInAuth(
      {super.key,
      required this.statusRequest,
      this.onPressedButton,
      this.onPressedTextButton,
      required this.textInButton,
      required this.textInTextButton,
      required this.text});
  final StatusRequest statusRequest;
  final void Function()? onPressedButton;
  final void Function()? onPressedTextButton;
  final String textInButton;
  final String textInTextButton;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton(
          widget: statusRequest == StatusRequest.loading
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                  child: SizedBox(
                      height: 2.9.h,
                      width: 6.w,
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                      )),
                )
              : Text(
                  textInButton,
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
          radius: 13.sp,
          paddinghorizontal: 7.h,
          paddingvertical: 2.h,
          onpressed: onPressedButton,
        ),
        SizedBox(
          height: 1.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            TextButton(
                onPressed: onPressedTextButton,
                child: Text(
                  textInTextButton,
                  style: const TextStyle(color: AppColor.primaryColor),
                ))
          ],
        ),
      ],
    );
  }
}
