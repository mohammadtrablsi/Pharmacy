import 'dart:math';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/controller/home/homeController.dart';
import 'package:pharmacy/view/screen/aDrawer/aDrawer.dart';
import 'package:sizer/sizer.dart';


import '../../../controller/bottomNav/bottomNavController.dart';
import '../../../core/constant/color.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav>
    with SingleTickerProviderStateMixin {
          BottomNavController controller1 = Get.put(BottomNavController());
              HomeController controller2=Get.put(HomeController());

  @override
  void initState() {
    controller1.animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(() {
        setState(() {});
      });
    controller1.animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: controller1.animationController, curve: Curves.fastOutSlowIn));

         controller1.animationScall = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: controller1.animationController, curve: Curves.fastOutSlowIn));

            controller2.setAnimationControllerForDrawer(controller1.animationController);
    super.initState();
  }

  @override
  void dispose() {
    controller1.animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(builder: (controller1){
      return 
    GetBuilder<HomeController>(
      builder: (controller2) {
        return Container(
          color: const Color(0xFF17203A),
          child: Stack(
            children: [
              AnimatedContainer(
                  duration: const Duration(microseconds: 20000),
                  curve: Curves.fastOutSlowIn,
                  child: Positioned(
                    left:controller1.animation.value==0?-244:0,
                      width: 70.w,
                      height: 100.h,
                      child: ADrawer(cancelOnPressed: () { controller2.iconDrawerOnPressed(); },))),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..setEntry(3, 2, 0.001)..rotateY(controller1.animation.value-30*controller1.animation.value*pi/180),
                child: Transform.translate(
                  offset: Offset(controller1.animation.value*70.w, 0),
                  child: Transform.scale(
                    scale: controller1.animationScall.value,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(controller1.animation.value*15.sp),
                      child: Scaffold(
                        bottomNavigationBar: CurvedNavigationBar(
                          backgroundColor: AppColor.primaryColor,
                          index: controller1.pageIndex,
                          items: controller1.iconList,
                          onTap: (index) {
                            controller1.setPageIndex(index);
                          },
                        ),
                        body:
                            controller1.listPage.elementAt(controller1.pageIndex),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );}); 
  }
}
