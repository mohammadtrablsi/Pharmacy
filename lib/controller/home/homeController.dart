import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pharmacy/core/constant/apptheme.dart';
import 'package:pharmacy/core/localization/changelocal.dart';
import 'package:pharmacy/core/services/services.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/core/class/statusrequest.dart';

import '../../core/constant/imageassets.dart';


class HomeController extends GetxController  {
  StatusRequest statusRequest = StatusRequest.none;
  List<String>photoes=[AppImageAsset.med1,AppImageAsset.med2,AppImageAsset.med3];
  List<String>images=[AppImageAsset.nan,AppImageAsset.med1,AppImageAsset.med2];
  int filterId = 1;
  bool isNeedUpdate = false;
  bool toggleModeValue = false;
  LocaleController controllerlang = Get.find();
  MyServices myServices = Get.find();
  late AnimationController animationController;
  int indexOfCarouselSlider=0;
  bool isDrawerOpen=false;
  late AnimationController animationControllerForDrawer;
  bool adsIsLoading=true;



  Future<List<DocumentSnapshot>> fetchFireStore(String collectionName,bool isOrder,String orderBy,int limit,bool isDescending) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  QuerySnapshot querySnapshot;
  if(isOrder){
    querySnapshot = await firestore
      .collection(collectionName)
      .orderBy(orderBy, descending: isDescending) // Sort by 'rated' field in descending order
      .limit(limit) // Limit the results to 3 documents
      .get();
  }else{
  querySnapshot= await firestore.collection(collectionName).get();
  await Future.delayed(const Duration(milliseconds:400));
  adsIsLoading=false;
  update();
  }
  

  return querySnapshot.docs;
}

 void setAnimationControllerForDrawer(AnimationController animationControllerForDrawer){
  this.animationControllerForDrawer=animationControllerForDrawer;
 }

  void iconDrawerOnPressed(){
    if(!isDrawerOpen){
      animationControllerForDrawer.forward();
    }else{
      animationControllerForDrawer.reverse();
    }
   isDrawerOpen=!isDrawerOpen;
   update();
  }


  void getForFilter(id) {
    filterId=id;
    update();
  }
  void setIndexOfCarouslSlider(int index){
     indexOfCarouselSlider=index;
     update();
  }

  changeMode(BuildContext context) async {
    var theme = Theme.of(context);
    var darkTheme = Themes.darkTheme;
    var lightTheme = Themes.lightTheme;
    var brightness = ThemeModelInheritedNotifier.of(context).theme.brightness;
    ThemeSwitcher.of(context).changeTheme(
      theme: brightness == Brightness.light ? darkTheme : lightTheme,
      isReversed: brightness == Brightness.light ? false : true,
    );
    toggleModeValue =!toggleModeValue;
    controllerlang.changetheme(toggleModeValue);
    update();
  }
}
