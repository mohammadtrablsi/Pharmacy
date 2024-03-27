import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/core/constant/appMargin.dart';
import 'package:pharmacy/view/widget/in%20common/appAppBar.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/favorite/favoriteController.dart';
import '../../../data/hive/boxes/boxes.dart';
import '../../../data/hive/favoriteBox.dart';
import '../../widget/favorite/favoriteItem.dart';



class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteController());
    return Scaffold(
        appBar: const AppAppBar(
          text: 'Favorite',
          haveBackIcon: false,
          haveActionIcon: false,
        ),
        body: GetBuilder<FavoriteController>(builder: (controller){
            return  Padding(
          padding: EdgeInsetsDirectional.only(
              start: AppMargin.ScreenMargin, end: AppMargin.ScreenMargin, top: 1.5.h),
          child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemBuilder: (context, index) {
                    FavoriteBox item = favoriteBox.getAt(index);
                    return Padding(
                padding: EdgeInsetsDirectional.only(bottom: 1.h),
                child: FavoriteItem(isEnmated: controller.isEnmated,data:{
                  'fullName':item.name,
                  'hasOffer1':item.hasOffer1,
                  'hasOffer2':item.hasOffer1,
                  'buyerPrice':item.buyerPrice,
                  'sellerPrice':item.sellerPrice,
                  'oldSellerPrice':item.oldSellerPrice,
                  'offer':item.offer,
                  'image':item.image,
                  'companyName':item.companyName,
                  'expiringDate':item.expiringDate,
                  },
                  onPressedDelete: ()=>controller.onPressedDelete(index),
                ),
              );
                  },
                  itemCount: favoriteBox.length,
                ),
        );
        },),
        
    );
  }
}
