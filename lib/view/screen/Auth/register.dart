import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:pharmacy/core/constant/routes.dart';

import '../../../controller/Auth/registerController.dart';
import '../../widget/Auth/in common/buttonsPartInAuth.dart';
import '../../widget/Auth/in common/textFieldsPartInAuth.dart';
import '../../widget/Auth/in common/textsPartInAuth.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
    return Scaffold(
      body: GetBuilder<RegisterController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                SizedBox(
                  height: 8.h,
                ),
                const TextsPartInAuth(
                    title: "Let's get started!",
                    text: "Create an account in pharmacy"),
                SizedBox(
                  height: 6.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Form(
                    key: controller.formState,
                    child: Column(
                      children: [
                        TextFieldPartAuth(
                            isLogin: false,
                            isTextFieldEnimated: controller.isTextFieldEnimated,
                            email: controller.email!,
                            password: controller.password!,
                            repeatPassword: controller.repeatPassword!,
                            name: controller.name!,
                            isPassword: controller.isPassword,
                            isPassword2: controller.isPassword2,
                            revPassword1: controller.revPassword,
                            revPassword2: controller.revPassword),
                        SizedBox(
                          height: 8.h,
                        ),
                        ButtonsPartInAuth(
                          statusRequest: controller.statusRequest,
                          textInButton: "Create",
                          textInTextButton: "login here",
                          text: "Already have an account?",
                          onPressedButton: () {controller.registerInFireBase();},
                          onPressedTextButton: () =>
                              Get.offNamed(AppRoute.login),
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
