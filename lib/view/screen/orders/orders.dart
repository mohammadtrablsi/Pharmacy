import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/view/widget/in%20common/appAppBar.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/orders/ordersController.dart';
import '../../widget/in common/AppTabBar.dart';



class Orders extends StatelessWidget {
  const Orders({super.key, required this.hasBackIconInAppBar});
  final bool hasBackIconInAppBar;

  @override
  Widget build(BuildContext context) {
     Get.put(OrdersController());

    return Scaffold(
      appBar: AppAppBar(text: 'Orders', haveBackIcon: hasBackIconInAppBar,haveActionIcon: false,),
      body: Column(
        children: [
          GetBuilder<OrdersController>(builder: (controller){
            return AppTabBar(
              taps: controller.taps,
              canScroll: false,
              haveSearch: false,
              haveLine: false,
              haveBackgroundColor: false,
              paddingTopForListView: 1.h,
              future: controller.fetchFireStore('Orders'),
              setIndex: (index){controller.setIndexOfTapBar(index);print(controller.indexOfTapBar);},
              onPressedDelete: controller.onPressedDelete,
            );
          }),
        ],
      ),
    );
  }
}

