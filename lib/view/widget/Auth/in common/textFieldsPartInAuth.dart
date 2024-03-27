import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/functions/validator.dart';
import '../../in common/appTextField.dart';

class TextFieldPartAuth extends StatelessWidget {
  const TextFieldPartAuth(
      {super.key,
      required this.isTextFieldEnimated,
      this.name,
      required this.email,
      required this.password,
      this.repeatPassword,
      required this.isPassword,
      required this.isPassword2,
      this.revPassword1,
      this.revPassword2,
      required this.isLogin});
  final bool isTextFieldEnimated;
  final TextEditingController? name;
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController? repeatPassword;
  final bool isPassword;
  final bool isPassword2;
  final revPassword1;
  final revPassword2;
  final bool isLogin;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isLogin
            ? Container()
            : AnimatedOpacity(
                opacity: isTextFieldEnimated ? 0 : 1,
                duration: const Duration(microseconds: 15000),
                child: AnimatedContainer(
                  duration: const Duration(microseconds: 10000),
                  transform: Matrix4.translationValues(
                      isTextFieldEnimated ? 400 : 0, 0.0, 0.0),
                  child: AppTextField(
                    controller: name,
                    label: 'enter your name',
                    preIcon: Icons.person,
                    vaildator: (val) {
                      return vaildator(val!, 2, 20, 'name');
                    },
                    obscureText: false,
                    suffixIcon: null,
                    suffixIconOnPressed: () {},
                    isPassword: false,
                  ),
                ),
              ),
        SizedBox(
          height: 4.h,
        ),
        AnimatedOpacity(
          opacity: isTextFieldEnimated ? 0 : 1,
          duration: const Duration(microseconds: 25000),
          child: AnimatedContainer(
            duration: const Duration(microseconds: 200000),
            transform: Matrix4.translationValues(
                isTextFieldEnimated ? 400 : 0, 0.0, 0.0),
            child: AppTextField(
              controller: email,
              label: 'enter your phone number',
              preIcon: Icons.email,
              vaildator: (val) {
                return vaildator(val!, 8, 20, 'email');
              },
              obscureText: false,
              suffixIcon: null,
              suffixIconOnPressed: () {},
              isPassword: false,
            ),
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        AnimatedOpacity(
          opacity: isTextFieldEnimated ? 0 : 1,
          duration: const Duration(microseconds: 35000),
          child: AnimatedContainer(
            duration: const Duration(microseconds: 300000),
            transform: Matrix4.translationValues(
                isTextFieldEnimated ? 400 : 0, 0.0, 0.0),
            child: AppTextField(
              controller: password,
              label: 'enter your password',
              preIcon: Icons.password,
              vaildator: (val) {
                return vaildator(val!, 5, 15, 'password');
              },
              obscureText: isPassword,
              suffixIcon: isPassword ? Icons.visibility : Icons.visibility_off,
              suffixIconOnPressed: () {
                revPassword1(1);
              },
              isPassword: true,
            ),
          ),
        ),
        SizedBox(
          height: 4.h,
        ),
        isLogin
            ? Container()
            : AnimatedOpacity(
                opacity: isTextFieldEnimated ? 0 : 1,
                duration: const Duration(microseconds: 45000),
                child: AnimatedContainer(
                  duration: const Duration(microseconds: 400000),
                  transform: Matrix4.translationValues(
                      isTextFieldEnimated ? 400 : 0, 0.0, 0.0),
                  child: AppTextField(
                    controller: repeatPassword,
                    label: 'repeat your password',
                    preIcon: Icons.password,
                    vaildator: (val) {
                      return vaildator(val!, 5, 15, 'password');
                    },
                    obscureText: isPassword2,
                    suffixIcon:
                        isPassword2 ? Icons.visibility : Icons.visibility_off,
                    suffixIconOnPressed: () {
                      revPassword2(2);
                    },
                    isPassword: true,
                  ),
                ),
              ),
      ],
    );
  }
}
