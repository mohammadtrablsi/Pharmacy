import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/core/functions/appSnackBar.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/checkinternet.dart';
import '../../core/services/services.dart';

class LoginController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  TextEditingController? email;
  TextEditingController? password;
  GlobalKey<FormState>? formState;
  bool isPassword = true;
  Map data = {};
  bool isTextFieldEnimated=true;
  String nameOfUser='';

  @override
  void onInit() async{
    email= TextEditingController();
    password = TextEditingController();
    formState = GlobalKey<FormState>();

    await Future.delayed(const Duration(milliseconds: 400));
    isTextFieldEnimated=false;
    update();

    super.onInit();
  }

  void revPassword(int id) {
    isPassword = !isPassword;
    update();
  }

  void loginFireBase() async {
    if (formState!.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      if (await checkInternet()) {
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
              email: email!.text, password: password!.text);
          await getNameOfUser(); // Await the completion of getNameOfUser() here
          statusRequest = StatusRequest.success;
          update();
          myServices.sharedPreferences.setString("uniqueEmail", email!.text);
          await myServices.sharedPreferences.setString("nameOfUser", nameOfUser);
          appSnackBar('success', 'you sign in successfully');
          Get.offNamed(AppRoute.bottomNav);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            Get.snackbar("warning", "No user found for that email.");
            print('No user found for that email.');
            statusRequest = StatusRequest.failure;
            update();
          } else if (e.code == 'wrong-password') {
            Get.snackbar("warning", "Wrong password provided for that user.");
            print('Wrong password provided for that user.');
            statusRequest = StatusRequest.failure;
            update();
          }
        }
      } else {
        Get.snackbar("warning", "check on your connection with net");
        statusRequest = StatusRequest.offlinefailure;
        update();
      }
    }
  }

  dynamic getNameOfUser()async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore
        .collection('users')
        .where('email', isEqualTo: email!.text)
        .get();

      QueryDocumentSnapshot medicineSnapshot = querySnapshot.docs.first;
      Map<String, dynamic>? data = medicineSnapshot.data() as Map<
          String,
          dynamic>?;
       nameOfUser = data?['name'];
  }
}
