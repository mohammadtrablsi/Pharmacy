import 'package:get/get.dart';

vaildator(val, int min, int max, String type) {
  if (val.isEmpty) {
    return "you can't leave it empty";
  }

  if (type == "name") {
    if (!GetUtils.isUsername(val)) {
      return "please enter your correct name";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "please enter your correct email";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "please enter your correct phone number";
    }
  }

  if (val.length < min) {
    return "${"value can't be less"} $min";
  }
  if (val.length > max) {
    return "${"value can't be larger"}$max";
  }
}

validationrepeatpassword(val, passwordcontroller) {
  if (val.isEmpty) {
    return "you can't leave it empty";
  }

  if (val != passwordcontroller.text) {
    return "this is not same password";
  }
}