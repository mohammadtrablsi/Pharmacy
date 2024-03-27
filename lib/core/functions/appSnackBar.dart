import 'package:get/get.dart';

void appSnackBar(String title, String message) {
  Get.snackbar(
    title,
    message,
    duration: const Duration(seconds: 2),
  );
}
