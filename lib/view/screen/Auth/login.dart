import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:pharmacy/core/constant/imageassets.dart';
import 'package:pharmacy/core/constant/routes.dart';


import '../../../controller/Auth/loginController.dart';
import '../../widget/Auth/in common/buttonsPartInAuth.dart';
import '../../widget/Auth/in common/textFieldsPartInAuth.dart';
import '../../widget/Auth/in common/textsPartInAuth.dart';


class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      body: GetBuilder<LoginController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                Container(
                  height: 30.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImageAsset.med2),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                const TextsPartInAuth(
                    title: "Welcome back!",
                    text: "Login to your existing account of pharmacy"),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Form(
                    key: controller.formState,
                    child: Column(
                      children: [
                        TextFieldPartAuth(
                          isLogin: true,
                          isTextFieldEnimated: controller.isTextFieldEnimated,
                          email: controller.email!,
                          password: controller.password!,
                          isPassword: controller.isPassword,
                          isPassword2: controller.isPassword,
                          revPassword1: controller.revPassword,
                        ),
                       SizedBox(
                          height: 4.h,
                        ), 
                        ButtonsPartInAuth(
                          statusRequest: controller.statusRequest,
                          textInButton: "Log In",
                          textInTextButton: "Sign Up",
                          text: "Don't have an account?",
                          onPressedButton: () {
                            controller.loginFireBase();
                          },
                          onPressedTextButton: () =>
                              Get.offNamed(AppRoute.register),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
