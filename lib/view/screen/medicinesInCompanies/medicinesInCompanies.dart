import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/view/widget/in%20common/appAppBar.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/medicineInCompanies/medicineInCompaniesController.dart';
import '../../widget/in common/AppTabBar.dart';



class MedicinesInCompanies extends StatelessWidget {
  const MedicinesInCompanies({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(MedicineInCompaniesController());
    return Scaffold(
      appBar: const AppAppBar(text: 'Medicines In Companies', haveBackIcon: true,haveActionIcon: false,),
      body: Column(
        children: [
          GetBuilder<MedicineInCompaniesController>(builder: (controller){
            return AppTabBar(
            focusNode: controller.focusNode,
            taps: controller.taps,
            canScroll: true,
            haveSearch: true,
            future:controller.fetchFireStore('Medicines',false),
            futureSearch:controller.fetchFireStore('Medicines',true),
            haveLine: true,
            haveBackgroundColor: true,
            paddingTopForListView: 2.h, 
            setIndex: (index){controller.setIndexOfTapBar(index);print(controller.indexOfTapBar);},
            search: controller.search,
            onChangedSearch: (value){controller.setSearchValue(value);print('$value====================');},
          );
          }), 
        ],
      ),
    );
  }
}
