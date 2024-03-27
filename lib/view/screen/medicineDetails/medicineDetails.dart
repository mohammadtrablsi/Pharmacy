import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:pharmacy/core/constant/appMargin.dart';
import 'package:pharmacy/core/constant/color.dart';
import 'package:pharmacy/core/constant/routes.dart';
import 'package:pharmacy/data/hive/favoriteBox.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/medicineDetails/medicineDetailsController.dart';
import '../../widget/home/rowSeeAll.dart';
import '../../widget/home/shimmerCommentInMedicineDetails.dart';
import '../../widget/in common/appAppBar.dart';
import '../../widget/in common/CommentInsideItem.dart';
import '../../widget/medicineDetails/medicineDetailsAddToCardButton.dart';
import '../../widget/medicineDetails/medicineDetailsImage.dart';
import '../../widget/medicineDetails/medicineDetailsTexts.dart';

class MedicineDetails extends StatelessWidget {
  const MedicineDetails({super.key});

  @override
  Widget build(BuildContext context) {
    MedicineDetailsController controller = Get.put(MedicineDetailsController());
    return Scaffold(
      appBar: AppAppBar(
        text: 'Medicine Details',
        haveBackIcon: true,
        haveActionIcon: true,
        actionIcon: Icons.star_border_sharp,
        onTapActionIcon: () {
          controller.makeRating();
        },
      ),
      body: GetBuilder<MedicineDetailsController>(
        builder: (controller) {
          return Column(
            children: [
              MedicineDetailsImage(
                tage: controller.tage!,
                icon: controller.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_border_outlined,
                image: controller.data['image']!,
                isEnimated: controller.isEnimated,
                onPressedFavorite: () {
                  controller.makeFavorite(FavoriteBox(
                      name: controller.data['fullName'],
                      sellerPrice: controller.data['sellerPrice'],
                      buyerPrice: controller.data['buyerPrice'],
                      oldSellerPrice: controller.data['oldSellerPrice'],
                      offer: controller.data['offer'],
                      image: controller.data['image'],
                      hasOffer1: controller.data['hasOffer1'],
                      hasOffer2: controller.data['hasOffer2'],
                      companyName: controller.data['companyName'],
                      expiringDate: controller.data['expiringDate']));
                },
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                    start: AppMargin.ScreenMargin,
                    end: AppMargin.ScreenMargin,
                    top: 4.h),
                child: MedicineDetailsTexts(
                  name: controller.data['fullName'],
                  buyingPrice: controller.data['buyerPrice'],
                  sellingPrice: controller.data['sellerPrice'],
                  expiringDate: controller.data['expiringDate'],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppMargin.ScreenMargin),
                child: Column(children: [
                  RowSeeAll(
                      text: "Comments",
                      textButton: "SeeAll",
                      textButtonOnPressed: () {
                        Get.toNamed(AppRoute.comment, arguments: [
                          {'data': controller.listOfComments}
                        ]);
                      }),
                ]),
              ),
              Container(
                width: double.infinity,
                height: 0.15.h,
                color: AppColor.primaryColor,
              ),
              SizedBox(
                height: 2.h,
              ),
              FutureBuilder(
                future: controller.fetchFireStore('Rating'),
                builder:
                    (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const ShimmerCommentInMedicineDetails();
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Text(
                      'dont have any Rating',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 11.sp),
                    );
                  } else if (snapshot.hasError) {
                    return const SizedBox();
                  } else {
                    controller.setListOfComments(snapshot.data);
                    return CommentInsideItem(
                        name: snapshot.data![0]['nameOfUser'].toString(),
                        date:
                            '${snapshot.data![0]['date']} ${snapshot.data![0]['time']}',
                        rate: snapshot.data![0]['numberOfRating'],
                        maxWidthForText: 50.w,
                        starsSize: 12.sp);
                  }
                },
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 4.w),
                child: Transform(
                  transform: Matrix4.translationValues(0, 0.5.h, 0),
                  child: Row(children: [
                    MedicineDetailsAddToCardButton(onTap: () {
                      controller.clickOnAddToCart(
                          controller.data['fullName'],
                          int.parse(controller.data['sellerPrice']),
                          int.parse(controller.data['buyerPrice']),
                          int.parse(controller.data['oldSellerPrice']),
                          controller.data['offer'],
                          controller.data['image'],
                          1,
                          controller.data['companyName'],
                          0);
                    }),
                  ]),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
