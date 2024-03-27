import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/view/widget/in%20common/appAppBar.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/most/mostController.dart';
import '../../../core/constant/appMargin.dart';
import '../../widget/in common/medicineItem.dart';

class Most extends StatelessWidget {
  const Most({super.key});
  

  @override
  Widget build(BuildContext context) {
    double widthOfScreen = MediaQuery.of(context).size.width;
    MostController controller=Get.put(MostController());
    return Scaffold(
      appBar: AppAppBar(text: controller.nameOfPage!, haveBackIcon: true,haveActionIcon: false,),
      body: Padding(
        padding: EdgeInsetsDirectional.only(start: AppMargin.ScreenMargin,end: AppMargin.ScreenMargin,top: 2.h),
        child: GetBuilder<MostController>(builder: (controller){
          return ListView.builder(itemCount:controller.data.length,itemBuilder: (context, index) {
          return AnimatedContainer(
            duration: Duration(milliseconds:200*index),
            transform: Matrix4.translationValues(controller.isEnmated?(widthOfScreen-AppMargin.ScreenMargin):0, 0, 0),
            child: Column(
              children: [
                MedicineItem(data:controller.data[index],),
                SizedBox(height: 1.h,),
              ],
            ),
          );
        },);
        },), 
      ),
    );
  }
}