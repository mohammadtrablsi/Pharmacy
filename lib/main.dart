
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pharmacy/core/constant/apptheme.dart';
import 'package:pharmacy/core/localization/changelocal.dart';
import 'package:pharmacy/data/hive/boxes/boxes.dart';
import 'package:pharmacy/data/hive/favoriteBox.dart';
import 'package:pharmacy/data/hive/forCartBox.dart';
import 'package:pharmacy/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'core/localization/translation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';




import 'core/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initialServices();
  await Hive.initFlutter();
  Hive.registerAdapter(ForCartBoxAdapter());
  forCartBox = await Hive.openBox<ForCartBox>('forCartBox');
  Hive.registerAdapter(FavoriteBoxAdapter());
  favoriteBox = await Hive.openBox<FavoriteBox>('favoriteBox');
  Get.put(LocaleController());
  Get.put(MyServices());
  runApp(
      const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {


    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('<<<<<<<<User is currently signed out!>>>>>>>>');
      } else {
        print('<<<<<<<<User is signed in!>>>>>>>>>>>>');
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    MyServices myServices=Get.find();
    return Sizer(builder: (context, orientation, deviceType) {
      return ThemeProvider(
        initTheme: myServices.sharedPreferences.getBool("theme")==true?Themes.darkTheme:Themes.lightTheme,
        builder: (context, myTheme) {
        return GetMaterialApp(
          useInheritedMediaQuery: true,
          translations: MyTranslation(),
          debugShowCheckedModeBanner: false,
          getPages: routes,
        );}
      );
    });
  }
}
