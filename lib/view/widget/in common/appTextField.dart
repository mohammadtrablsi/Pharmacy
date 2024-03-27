import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      required this.controller,
      required this.label,
      required this.preIcon,
      required this.vaildator,
      required this.obscureText,
      this.suffixIcon,
      required this.suffixIconOnPressed,
      required this.isPassword});
  final TextEditingController? controller;
  final String label;
  final preIcon;
  final String? Function(String?)? vaildator;
  final bool obscureText;
  final suffixIcon;
  final void Function()? suffixIconOnPressed;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText == null ? false : obscureText!,
      decoration: InputDecoration(
        hintText: label,
        prefixIcon: Icon(preIcon), // Replace with your desired icon
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(10.0), // Adjust border radius as needed
          borderSide: const BorderSide(color: Colors.grey),
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(suffixIcon),
                onPressed: suffixIconOnPressed,
              )
            : SizedBox(
                width: 0,
                height: 0,
              ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide:
              const BorderSide(color: AppColor.primaryColor), // Cursor color
        ),
      ),
      validator: vaildator,
      cursorColor: AppColor.primaryColor, // Cursor color
    );
  }
}
