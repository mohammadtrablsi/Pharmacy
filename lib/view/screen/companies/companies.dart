import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:pharmacy/core/constant/appMargin.dart';
import 'package:pharmacy/view/widget/in%20common/appAppBar.dart';
import 'package:sizer/sizer.dart';

import '../../../controller/companies/companiesController.dart';
import '../../../core/constant/routes.dart';
import '../../widget/companies/companyItem.dart';

class Companies extends StatelessWidget {
  const Companies({super.key});

  @override
  Widget build(BuildContext context) {
    CompaniesController controller=Get.put(CompaniesController());
    return Scaffold(
      appBar: const AppAppBar(text: "the companies", haveBackIcon: true,haveActionIcon: false,),
      body:Padding(
        padding: EdgeInsetsDirectional.only(start:AppMargin.ScreenMargin,end:AppMargin.ScreenMargin,top:2.h),
        child: AnimationLimiter(child: GridView.count(crossAxisCount:3,children: 
          List.generate(controller.data.length, (index) => AnimationConfiguration.staggeredGrid(
            columnCount: 3,
              position: index,
              duration: const Duration(milliseconds: 375),
              child: ScaleAnimation(//SlideAnimation
                duration: const Duration(seconds: 1),
                child: FadeInAnimation(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(borderRadius: BorderRadius.circular(5.sp),onTap: (){
                      Get.toNamed(AppRoute.medicinesInCompanies,arguments:[{'data':controller.data,'theNameOfFirstCompany':controller.data[index]['name']}] );
                    },child: CompanyItem(text: controller.data[index]['name'], image: controller.data[index]['image'],)),
                  ),
                ),
              ),),),
         )),
      ),
    );
  }
}