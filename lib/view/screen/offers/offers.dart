import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/core/constant/appMargin.dart';
import 'package:pharmacy/view/widget/in%20common/appAppBar.dart';
import 'package:pharmacy/view/widget/in%20common/medicineItem.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/offers/offersController.dart';
import '../../../core/functions/appLoadingIndicator.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    OffersController controller = Get.put(OffersController());
    return Scaffold(
      appBar: const AppAppBar(
        text: 'Offers',
        haveBackIcon: false,
        haveActionIcon: false,
      ),
      body: FutureBuilder(
        future: controller.fetchFireStore('Medicines'),
        builder: (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return appLoadingIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Padding(
              padding: EdgeInsetsDirectional.only(
                  start: AppMargin.ScreenMargin,
                  end: AppMargin.ScreenMargin,
                  top: 1.h),
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsetsDirectional.only(bottom: 1.h),
                    child: MedicineItem(
                      data: snapshot.data![index],
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
