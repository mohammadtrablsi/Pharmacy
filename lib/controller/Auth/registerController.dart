import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/appSnackBar.dart';
import '../../core/functions/checkinternet.dart';
import '../../core/services/services.dart';

class RegisterController extends GetxController {
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  TextEditingController? email;
  TextEditingController? name;
  TextEditingController? password;
  TextEditingController? repeatPassword;
  GlobalKey<FormState>? formState;
  bool isPassword = true;
  bool isPassword2 = true;
  Map data = {};
  bool isTextFieldEnimated=true;

  @override
  void onInit() async{
    email = TextEditingController();
    password = TextEditingController();
    name = TextEditingController();
    repeatPassword = TextEditingController();
    formState = GlobalKey<FormState>();

    await Future.delayed(const Duration(milliseconds: 400));
    isTextFieldEnimated=false;
    update();

    super.onInit();
  }

  void revPassword(id) {
    if (id == 1) {
      isPassword = !isPassword;
      update();
    } else {
      isPassword2 = !isPassword2;
      update();
    }
  }

  void registerInFireBase() async {
    if (formState!.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      if (password!.text != repeatPassword!.text) {
        statusRequest = StatusRequest.failure;
        update();
        Get.snackbar("warning", "you must repeat password equal password");
      } else if (await checkInternet()) {
        try {
          final credential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email!.text,
            password: password!.text,
          );
          statusRequest = StatusRequest.success;
          update();
          Get.offNamed(AppRoute.bottomNav);
          myServices.sharedPreferences.setString("uniqueEmail", email!.text);
          myServices.sharedPreferences.setString("nameOfUser", name!.text);
          appSnackBar('success', 'you register successfully');
          addUser();
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            statusRequest = StatusRequest.failure;
            update();
            Get.snackbar("warning", "The password provided is too weak.");
            print('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            statusRequest = StatusRequest.failure;
            update();
            Get.snackbar(
                "warning", "The account already exists for that email.");
            print('The account already exists for that email.');
          }
        } catch (e) {
          print(e);
        }
      } else {
        Get.snackbar("warning", "check on your connection with net");
        statusRequest = StatusRequest.offlinefailure;
        update();
      }
    }
  }

  Future<void> addUser() {
    return users.add({
      'email': email!.text,
      'name': name!.text,
      'UserId': FirebaseAuth.instance.currentUser!.uid,
    }).then((value) => Get.offNamed(AppRoute.bottomNav));
  }
}
