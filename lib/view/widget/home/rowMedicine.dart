import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/core/constant/color.dart';
import 'package:pharmacy/core/constant/routes.dart';
import 'package:pharmacy/view/widget/home/medicineCard.dart';
import 'package:sizer/sizer.dart';

class RowMedicine extends StatelessWidget {
  const RowMedicine(
      {Key? key, required this.data, required this.helperUniqueTage})
      : super(key: key);
  final data;
  final String helperUniqueTage;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          data.length,
          (index) => Row(
            children: [
              InkWell(
                highlightColor: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(5.sp),
                onTap: () {
                  Get.toNamed(
                    AppRoute.medicineDetails,
                    arguments: [
                      {
                        'data': data[index],
                        'tage': "${data[index]['image']}$helperUniqueTage"
                      }
                    ],
                  );
                },
                child: MedicineCard(
                  sellerPrice: data[index]['sellerPrice'],
                  text: data[index]['name'],
                  image: data[index]['image'],
                  helperUniqueTage: helperUniqueTage,
                ),
              ),
              SizedBox(
                width: 1.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
