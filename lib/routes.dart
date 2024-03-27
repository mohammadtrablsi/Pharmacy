import 'package:pharmacy/view/screen/Auth/onBoarding.dart';
import 'package:get/get.dart';
import 'package:pharmacy/view/screen/Auth/login.dart';
import 'package:pharmacy/view/screen/Auth/register.dart';
import 'package:pharmacy/view/screen/bottomNav/bottomNav.dart';
import 'package:pharmacy/view/screen/cart/cart.dart';
import 'package:pharmacy/view/screen/companies/companies.dart';
import 'package:pharmacy/view/screen/home/home.dart';
import 'package:pharmacy/view/screen/medicineDetails/medicineDetails.dart';
import 'package:pharmacy/view/screen/medicinesInCompanies/medicinesInCompanies.dart';
import 'package:pharmacy/view/screen/most/most.dart';
import 'package:pharmacy/view/screen/notification/aNotification.dart';
import 'package:pharmacy/view/screen/orders/detailsOfOrder.dart';
import 'package:pharmacy/view/screen/orders/orders.dart';
import 'package:pharmacy/view/screen/comment/comment.dart';
import 'package:pharmacy/view/screen/search/search.dart';

import 'core/middleware/mymiddleware.dart';

List<GetPage<dynamic>>? routes = [
  ////Auth
  GetPage(name: "/register", page: () => const Register()),
  GetPage(
      name: "/",
      page: () => const OnBoarding(),
      middlewares: [MyMiddleWare()]), //, middlewares: [MyMiddleWare()]
  GetPage(name: "/login", page: () => const Login()),
  GetPage(name: "/home", page: () => const Home()),
  GetPage(name: "/bottomNav", page: () => const BottomNav()),
  GetPage(name: "/medicineDetails", page: () => const MedicineDetails()),
  GetPage(name: "/companies", page: () => const Companies()),
  GetPage(name: "/comment", page: () => const Comment()),
  GetPage(name: "/most", page: () => const Most()),
  GetPage(name: "/search", page: () => const Search()),
  GetPage(
      name: "/medicinesInCompanies", page: () => const MedicinesInCompanies()),
  GetPage(name: "/detailsOfOrder", page: () => const DetailsOfOrder()),
  GetPage(name: "/cart", page: () => const Cart()),
  GetPage(
      name: "/notifications",
      page: () => const ANotification(
            hasBackIconInAppBar: true,
          )),
  GetPage(
      name: "/orders",
      page: () => const Orders(
            hasBackIconInAppBar: true,
          )),
  GetPage(
    name: "/onBoarding",
    page: () => const OnBoarding(),
  ),
];
