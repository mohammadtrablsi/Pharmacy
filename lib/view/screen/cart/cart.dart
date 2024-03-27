import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/core/constant/appMargin.dart';
import 'package:pharmacy/data/hive/forCartBox.dart';
import 'package:pharmacy/view/widget/cart/cardTotalInCart.dart';
import 'package:pharmacy/view/widget/in%20common/appAppBar.dart';
import 'package:sizer/sizer.dart';
import '../../../controller/cart/cartController.dart';

import '../../../data/hive/boxes/boxes.dart';

import '../../widget/cart/buttonInCart.dart';
import '../../widget/cart/cartItem.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return Scaffold(
      appBar: const AppAppBar(
        text: 'Cart',
        haveBackIcon: true,
        haveActionIcon: false,
      ),
      body: GetBuilder<CartController>(builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding:
                    EdgeInsetsDirectional.only(start: 6.w, end: 6.w, top: 1.h),
                child: GetBuilder<CartController>(
                  builder: (controller) => ListView.separated(
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemBuilder: (context, index) {
                      ForCartBox item = forCartBox.getAt(index);
                      return CartItem(
                          item: item,
                          addOnTap: () => controller.updateItemInHive(item, 1),
                          minimizeOnTap: () =>
                              controller.updateItemInHive(item, 2),
                          deleteOnTap: () => controller.deleteItemInHive(item));
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 0.8.h,
                      );
                    },
                    itemCount: forCartBox.length,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppMargin.ScreenMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: CardTotalInCart(numbers: [
                        controller.getCountOfItems(),
                        controller.getTotalPrice(1),
                        controller.getTotalPrice(2)
                      ])),
                  ButtonInCart(
                      onTap: () async {
                        await controller.makeOrders();
                      },
                      number: controller.getTotalPrice(1)),
                ],
              ),
            ),
            SizedBox(height: 2.9.h),
          ],
        );
      }),
    );
  }
}
