import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constant/color.dart';

class MedicineDetailsImage extends StatelessWidget {
  const MedicineDetailsImage(
      {super.key,
      required this.tage,
      required this.image,
      required this.isEnimated,
      required this.onPressedFavorite,
      this.icon});
  final String tage;
  final String image;
  final bool isEnimated;
  final void Function() onPressedFavorite;
  final icon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Hero(
          tag: tage,
          transitionOnUserGestures: true,
          child: Container(
            height: 28.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.cover)),
          ),
        ),
        Positioned(
          right: 1.w,
          bottom: 1.w,
          child: AnimatedOpacity(
            duration: const Duration(microseconds: 800),
            opacity: isEnimated ? 0 : 1,
            child: AnimatedContainer(
              duration: const Duration(microseconds: 800),
              transform:
                  Matrix4.translationValues(isEnimated ? 20.w : 0.w, 0, 0),
              child: IconButton(
                onPressed: onPressedFavorite,
                icon: Container(
                  width: 25.w,
                  height: 25.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      color: AppColor.primaryColor,
                      size: 19.sp,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
