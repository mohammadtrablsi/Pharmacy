import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/core/functions/appDialoge.dart';
import 'package:pharmacy/core/services/services.dart';
import 'package:pharmacy/data/hive/boxes/boxes.dart';

import '../../core/constant/routes.dart';

class ADrawerController extends GetxController {
  MyServices myServices=Get.find();
  dynamic cancelOnPressed;

  int currentIndex = 100;
  String nameOfUser='';
  List<Map> taps = [
    {'text': 'my points', 'icon': Icons.point_of_sale_outlined,'color':Colors.white},
    {'text': 'notification', 'icon': Icons.notifications,'color':Colors.white},
    {'text': 'orders', 'icon': Icons.online_prediction_rounded,'color':Colors.white},
    {'text': 'feed back', 'icon': Icons.feedback,'color':Colors.white},
    {'text': 'logout', 'icon': Icons.logout,'color':Colors.red.shade400},
  ];
  List workOfButton=[null,AppRoute.notifications,AppRoute.orders,null];
  List workOfButtonArguments=[null,{'hasBackIconInAppBar':true},{'hasBackIconInAppBar':true},null];


void onPressedButtonInDrawer(int index) async {
  currentIndex= index;
  update();
  await Future.delayed(const Duration(milliseconds:200));
  setCancelOnPressed(cancelOnPressed());
  await Future.delayed(const Duration(milliseconds:250));
  if(index==4){
    logoutInFireBase();
  }else if (workOfButton[index] != null) {
    Get.toNamed(workOfButton[index], arguments: workOfButtonArguments[index]);
  }
  currentIndex = 100;
  // await Future.delayed(Duration(milliseconds: 400));
  // update();
}
  void setCancelOnPressed(cancelOnPressed){
  this.cancelOnPressed=cancelOnPressed;
  }
  void logoutInFireBase()async{
  appDialog('Alert', 'Are you shure to log out?', () async{
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(AppRoute.onBoarding);
    myServices.sharedPreferences.clear();
    forCartBox.clear();
  });

  }
}
