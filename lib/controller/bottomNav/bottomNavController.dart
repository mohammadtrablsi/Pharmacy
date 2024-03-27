import 'package:flutter/material.dart';
import 'package:get/get.dart';




import '../../core/localization/changelocal.dart';
import '../../core/services/services.dart';
import '../../view/screen/favorite/favorite.dart';
import '../../view/screen/home/home.dart';
import '../../view/screen/notification/aNotification.dart';
import '../../view/screen/offers/offers.dart';
import '../../view/screen/orders/orders.dart';



class BottomNavController extends GetxController {
  LocaleController controllerLang = Get.find();
  MyServices myServices = Get.find();
  
  late AnimationController animationController;
  late Animation animation;
  late Animation animationScall;
  bool lang = false;
  bool isPressed = true;
  bool? switchValue = false;
  bool isOwner = false;
  TextEditingController password = TextEditingController();
  int pageIndex=2;
  List<Widget> listPage = [];
  List<Widget> iconList= const[
      Icon(Icons.healing, size: 30),
      Icon(Icons.notifications_none, size: 30),
      Icon(Icons.home, size: 30),
      Icon(Icons.favorite_border_outlined, size: 30),
      Icon(Icons.receipt, size: 30),
    ];
    bool isDrawerOpen=false;


  void setPageIndex(int index){
    pageIndex=index;
    update();
  }

  @override
  void onInit() {
    listPage = [
      const Offers(),
      const ANotification(hasBackIconInAppBar: false),
      const Home(),
      const Favorite(),
      const Orders(hasBackIconInAppBar: false),
    ];
    super.onInit();
  }

}