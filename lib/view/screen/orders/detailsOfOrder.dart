import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/view/widget/in%20common/appAppBar.dart';
import 'package:pharmacy/view/widget/orders/detailsOfOrder/itemInDetailsOfOrder.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/orders/detailsOfOrderController.dart';

import '../../widget/orders/detailsOfOrder/rowState.dart';

class DetailsOfOrder extends StatelessWidget {
  const DetailsOfOrder({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DetailsOfOrderController());
    return Scaffold(
      appBar: const AppAppBar(text: 'Details Of Order', haveBackIcon: true,haveActionIcon: false,),
      body: GetBuilder<DetailsOfOrderController>(builder: (controller) {
        return Column(
          children: [
            GetBuilder<DetailsOfOrderController>(builder: (controller){
              return Padding(
              padding: EdgeInsetsDirectional.only(
                  top: 2.h, start: 3.5.h, end: 3.5.h, bottom: 2.h),
              child: RowState(isEnamated:controller.isEnamated,
                numState: controller.status == "mangement"
                    ? 1
                    : controller.status == "delivered"
                        ? 2
                        : controller.status == "canceled"
                            ? 3
                            : 0,
              ),
            );
            }), 
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 6.w,end:6.w,top:1.h),
                child: ListView.separated(
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemBuilder: (context, index) {
                      // print('controller.data[index][name]${controller.data['List'][index]['name']}');
                      return ItemInDetailsOfOrde(
                        imageUrl: controller.data['List'][index]['image'],
                        text: [
                          controller.data['List'][index]['name'],
                          '${controller.data['List'][index]['quantity']}',
                         '${controller.data['List'][index]['price']}',
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 0.8.h,
                      );
                    },
                    itemCount: controller.data['List'].length),
              ),
            ),
          ],
        );
      }),
    );
  }
}