
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/routes.dart';
import '../services/services.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();
  User? user = FirebaseAuth.instance.currentUser;

  @override
  RouteSettings? redirect(String? route) {
    if (user != null) {
      // User is signed in
      return const RouteSettings(name: AppRoute.bottomNav);
    } else {
      // User is not signed in
      return const RouteSettings(name: AppRoute.onBoarding);
    }

    return null;
  }
}