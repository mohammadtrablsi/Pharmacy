import 'package:flutter/material.dart';
import 'package:pharmacy/core/constant/color.dart';
import 'package:sizer/sizer.dart';

class MedicineDetailsTexts extends StatelessWidget {
  const MedicineDetailsTexts(
      {super.key,
      required this.name,
      required this.sellingPrice,
      required this.buyingPrice,
      required this.expiringDate});
  final String name;
  final String sellingPrice;
  final String buyingPrice;
  final String expiringDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.w),
      child: Column(
        children: [
          TextInMedicineDetails(name, 1),
          SizedBox(
            height: 2.h,
          ),
          TextInMedicineDetails("medical ingredient:", 2),
          // SizedBox(height:1.h,),
          TextInMedicineDetails("_", 3),
          SizedBox(
            height: 2.5.h,
          ),
          TextInMedicineDetails("description:", 2),
          SizedBox(
            height: 2.5.h,
          ),
          TextInMedicineDetails("expiring date:", 2),
          SizedBox(
            height: 1.h,
          ),
          TextInMedicineDetails(expiringDate, 3),
          SizedBox(
            height: 2.5.h,
          ),
          Row(
            children: [
              Column(
                children: [
                  TextInMedicineDetails("selling price:", 2),
                  SizedBox(
                    height: 1.h,
                  ),
                  TextInMedicineDetails(sellingPrice, 3),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  TextInMedicineDetails("buying price:", 2),
                  SizedBox(
                    height: 1.h,
                  ),
                  TextInMedicineDetails(buyingPrice, 3),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget TextInMedicineDetails(String text, int typeOfText) {
    if (typeOfText == 1) {
      return Text(
        text,
        style: TextStyle(
            color: AppColor.primaryColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold),
      );
    } else if (typeOfText == 2) {
      return Text(
        text,
        style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87),
      );
    } else {
      return Text(
        text,
        style: TextStyle(fontSize: 14.sp),
      );
    }
  }
}
