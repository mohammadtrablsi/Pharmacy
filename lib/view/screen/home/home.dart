import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/core/constant/appMargin.dart';
import 'package:pharmacy/core/constant/routes.dart';
import 'package:pharmacy/view/widget/home/medicinesPart.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/home/homeController.dart';
import '../../widget/home/appBarPart.dart';
import '../../widget/home/carouselSliderPart.dart';
import '../../widget/home/rowSeeAll.dart';
import '../../widget/home/shimmerPackagesAndOffersInHome.dart';
import '../../widget/home/shimmerRowCircleAndRowSeeAll.dart';
import '../../widget/home/shimmerRowMedicineAndSeeAll.dart';
import '../../widget/home/viewPart.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return Scaffold(
      appBar: AppBarPart(
        text: 'Pharmacy',
        menuOnPressed: () {
          controller.iconDrawerOnPressed();
        },
        cartOnPressed: () {
          Get.toNamed(AppRoute.cart);
        },
        searchOnPressed: () {
          Get.toNamed(AppRoute.search);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 1.h,
            ),
            GetBuilder<HomeController>(
              builder: (controller) => FutureBuilder(
                future: controller.fetchFireStore('Ads', false, '', 0, true),
                builder:
                    (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return CarouselSliderPart(
                      data: snapshot.data,
                      indexOfCarouselSlider: controller.indexOfCarouselSlider,
                      setIndexOfCarouslSlider:
                          controller.setIndexOfCarouslSlider,
                      adsIsLoading: controller.adsIsLoading,
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppMargin.ScreenMargin),
              child: const Column(children: []),
            ),
            FutureBuilder(
              future:
                  controller.fetchFireStore('Companies', false, '', 0, true),
              builder:
                  (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const ShimmerRowCircleAndRowSeeAll();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return ViewPart(
                    text: 'Companies',
                    textButton: 'SeeAll',
                    textButtonOnPressed: () {
                      Get.toNamed(AppRoute.companies, arguments: [
                        {'data': snapshot.data}
                      ]);
                    },
                    data: snapshot.data,
                  );
                }
              },
            ),
            SizedBox(
              height: 1.h,
            ),
            FutureBuilder(
              future: controller.fetchFireStore(
                  'Packages', true, 'numberOfId', 5, false),
              builder:
                  (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const ShimmerPackagesAndOffersInHome();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Column(
                    children: [
                      ViewPart(
                        text: 'Packages',
                        textButton: 'SeeAll',
                        textButtonOnPressed: () {
                          // Get.toNamed(AppRoute.companies);
                        },
                        data: snapshot.data,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppMargin.ScreenMargin),
                        child: Column(children: [
                          RowSeeAll(
                              text: "Offers",
                              textButton: "SeeAll",
                              textButtonOnPressed: () {}),
                        ]),
                      ),
                    ],
                  );
                }
              },
            ),
            SizedBox(
              height: 1.h,
            ),
            FutureBuilder(
              future: controller.fetchFireStore(
                  'Medicines', true, 'numberOfWanted', 5, true),
              builder:
                  (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const ShimmerRowMedicineAndSeeAll();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return MedicinesPart(
                    text: 'Most Wanted',
                    data: snapshot.data,
                    helperUniqueTage: 'w',
                    textButtonOnPressed: () {
                      Get.toNamed(AppRoute.most, arguments: [
                        {
                          'nameOfPage': 'Most Wanted',
                          'data': snapshot.data,
                        }
                      ]);
                    },
                  );
                }
              },
            ),
            SizedBox(
              height: 1.h,
            ),
            FutureBuilder(
              future: controller.fetchFireStore(
                  'Medicines', true, 'rated', 5, true),
              builder:
                  (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const ShimmerRowMedicineAndSeeAll();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return MedicinesPart(
                    text: 'Most rated',
                    data: snapshot.data,
                    helperUniqueTage: 'r',
                    textButtonOnPressed: () {
                      Get.toNamed(AppRoute.most, arguments: [
                        {
                          'nameOfPage': 'Most rated',
                          'data': snapshot.data,
                        }
                      ]);
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
