import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CardTotalInCart extends StatelessWidget {
  const CardTotalInCart({super.key, required this.numbers});
  final List numbers;

  @override
  Widget build(BuildContext context) {
    List<String> texts = ['count of items:', 'seller price:', 'buyer price:'];
    return SizedBox(
      height: 15.8.h,
      child: Card(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
          child: ListView.builder(
            itemCount: 3,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Text(
                        texts[index],
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                      const Spacer(),
                      Text(
                        '${numbers[index]}',
                        style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.3.h,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
