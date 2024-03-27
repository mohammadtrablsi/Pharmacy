import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ItemInDetailsOfOrde extends StatelessWidget {
  final List<String> text;
  final String imageUrl;
  const ItemInDetailsOfOrde(
      {super.key, required this.text, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    List listData = ['', 'Quantity : ', 'Price : '];
    return Card(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0.7.h),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(colors: [
            Colors.white24,
            Colors.white12,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 3.w,
            ),
            Container(
              height: 10.h,
              width: 20.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp),
                  color: Colors.black12,
                  image: DecorationImage(
                      image: NetworkImage(imageUrl), fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 5.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.3.h),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(3, (index) {
                    return Container(
                      padding: EdgeInsets.only(top: 0.7, bottom: 0.7.h),
                      constraints: BoxConstraints(maxWidth: 50.w),
                      child: Text(
                        listData[index] + text[index],
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }
}
