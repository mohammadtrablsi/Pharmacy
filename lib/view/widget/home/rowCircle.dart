import 'package:flutter/material.dart';
import 'package:pharmacy/view/widget/home/circleInHomePage.dart';
import 'package:sizer/sizer.dart';

class RowCircle extends StatelessWidget {
  const RowCircle({Key? key, required this.data}) : super(key: key);
  final data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          data.length,
          (index) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 4.w,
              ),
              CircleInHomePage(
                text: data[index]['name'],
                image: data[index]['image'],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
