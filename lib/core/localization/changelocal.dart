import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/apptheme.dart';
import '../services/services.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  ThemeData appTheme = Themes.lightTheme;

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    Get.updateLocale(locale);
  }

  changetheme(value) {
    myServices.sharedPreferences.setBool("theme", value);
    if (value == true) {
      appTheme = Themes.darkTheme;
    }
    if (value == false) {
      appTheme = Themes.lightTheme;
    }
    Get.changeTheme(appTheme);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    var theme = myServices.sharedPreferences.getBool("theme");
    if (theme == true) {
      appTheme = Themes.darkTheme;
      Get.changeTheme(appTheme);
    } else if (theme == false) {
      appTheme = Themes.lightTheme;
      Get.changeTheme(appTheme);
    }
    super.onInit();
  }
}