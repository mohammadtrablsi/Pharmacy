import 'package:flutter/material.dart';
import 'package:pharmacy/core/constant/color.dart';

Widget appLoadingIndicator(){
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(child:CircularProgressIndicator(color: AppColor.primaryColor,)),
    ],
  );
}