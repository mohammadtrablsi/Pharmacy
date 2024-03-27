import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/routes.dart';

class OnBoardingController extends GetxController {
  var indexPage = 0;
  PageController pageController = PageController();

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  setIndex(value) {
    indexPage = value;
    update();
  }

  transport() {
    indexPage++;
    pageController.animateToPage(indexPage,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    update();
  }

  skip() {
    Get.toNamed(AppRoute.login);
  }

  goToRegister() {
    Get.toNamed(AppRoute.register);
  }

}