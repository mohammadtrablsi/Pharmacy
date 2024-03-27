import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/controller/inCommon/medicineItemController.dart';
import 'package:pharmacy/core/constant/color.dart';
import 'package:pharmacy/core/constant/routes.dart';
import 'package:sizer/sizer.dart';

class MedicineItem extends StatelessWidget {
  const MedicineItem({super.key, this.data});
  final data;

  @override
  Widget build(BuildContext context) {
    MedicineItemController controller = Get.put(MedicineItemController());
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsetsDirectional.all(5.w),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.primaryColor, width: 0.3.h),
                borderRadius: BorderRadius.circular(5.sp),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textInMedicineItem(data['fullName'], 1, false),
                      SizedBox(
                        height: 0.9.h,
                      ),
                      data['hasOffer2']
                          ? Row(
                              children: [
                                textInMedicineItem(
                                    'old seller price:', 2, false),
                                textInMedicineItem(
                                    data['oldSellerPrice'], 2, true),
                              ],
                            )
                          : const SizedBox(),
                      data['hasOffer2']
                          ? SizedBox(
                              height: 0.6.h,
                            )
                          : Container(),
                      textInMedicineItem(
                          'seller price:${data['sellerPrice']}', 2, false),
                      SizedBox(
                        height: 0.6.h,
                      ),
                      textInMedicineItem(
                          'buyer price:${data['buyerPrice']}', 2, false),
                      SizedBox(
                        height: 1.h,
                      ),
                      data['hasOffer1']
                          ? offersInMedcineItem(data['offer'])
                          : const SizedBox(),
                    ],
                  ),
                  const Spacer(),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(5.sp),
                      child: Container(
                        width: 20.w,
                        height: 8.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.sp),
                            image: DecorationImage(
                                image: NetworkImage(data['image']),
                                fit: BoxFit.cover)),
                      )),
                ],
              ),
            ),
            iconButtonInMedicineItem(() => controller.clickOnAddToCart(
                data['fullName'],
                int.parse(data['sellerPrice']),
                int.parse(data['buyerPrice']),
                int.parse(data['oldSellerPrice']),
                data['offer'],
                data['image'],
                1,
                data['companyName'],
                0)),
          ],
        ),
        TextButton(
            onPressed: () {
              Get.toNamed(AppRoute.medicineDetails, arguments: [
                {'data': data, 'tage': "${data['image']}r"}
              ]);
            },
            child: const Text(
              'see',
              style: TextStyle(color: AppColor.primaryColor),
            )),
      ],
    );
  }

  Widget textInMedicineItem(String text, int typeOfText, bool lineThrough) {
    if (typeOfText == 1) {
      return Container(
          constraints: BoxConstraints(maxWidth: 55.w),
          child: Text(
            text,
            maxLines: 1,
            style: TextStyle(
                color: AppColor.primaryColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold),
          ));
    } else if (typeOfText == 2) {
      return Text(
        text,
        style: TextStyle(
            decoration:
                lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
            color: Colors.black87,
            fontSize: 11.sp,
            fontWeight: FontWeight.bold),
      );
    } else {
      return Text(
        text,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12.sp),
      );
    }
  }

  Widget offersInMedcineItem(String text) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.sp),
              topRight: Radius.circular(10.sp))),
      padding:
          EdgeInsetsDirectional.symmetric(vertical: 0.75.h, horizontal: 11.w),
      child: textInMedicineItem(text, 3, false),
    );
  }

  Widget iconButtonInMedicineItem(void Function() onPressed) {
    return IconButton(
        onPressed: onPressed,
        icon: Container(
            width: 8.w,
            height: 4.h,
            decoration: const BoxDecoration(
                color: AppColor.primaryColor, shape: BoxShape.circle),
            child: Icon(
              Icons.add,
              size: 16.sp,
              color: Colors.white,
            )));
  }
}
