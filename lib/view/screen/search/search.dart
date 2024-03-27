import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/core/constant/appMargin.dart';
import 'package:pharmacy/view/widget/in%20common/appAppBar.dart';
import 'package:pharmacy/view/widget/in%20common/medicineItem.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/search/aSearchController.dart';
import '../../../core/functions/appLoadingIndicator.dart';
import '../../widget/in common/searchCard.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ASearchController());
    return Scaffold(
      appBar: const AppAppBar(
        text: 'Search',
        haveBackIcon: true,
        haveActionIcon: false,
      ),
      body: GetBuilder<ASearchController>(
        builder: (controller) {
          return Column(children: [
            SearchCard(
              controller: controller.search,
              focusNode: controller.focusNode,
              hintText: 'enter medicine name',
              speechEnabled: controller.speechEnabled,
              speechToText: controller.speechToText,
              onPressedSuffixIcon: () {
                if (controller.speechEnabled) {
                  controller.speechToText.isListening
                      ? controller.stopListening()
                      : controller.startListening();
                } else {
                  print('Speech recognition is not available222');
                }
              },
              onTapSearch: () {},
              onChanged: (value) {
                controller.setSearchValue(value);
                print('$value====================');
              },
            ),
            Expanded(
              child: FutureBuilder(
                future: controller.fetchFireStore('Medicines'),
                builder:
                    (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return appLoadingIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Padding(
                      padding: EdgeInsetsDirectional.only(
                          start: AppMargin.ScreenMargin,
                          end: AppMargin.ScreenMargin,
                          top: 2.h),
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 1.h),
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
            ),
          ]);
        },
      ),
    );
  }
}
