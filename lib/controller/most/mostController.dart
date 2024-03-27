import 'package:get/get.dart';

class MostController extends GetxController {
  String? nameOfPage;
  bool isEnmated=true;
  var data;
  @override
  Future<void> onInit() async {
    nameOfPage= Get.arguments[0]['nameOfPage'];
    data= Get.arguments[0]['data'];
    await Future.delayed(const Duration(milliseconds: 200));
    isEnmated=false;
    update();
    super.onInit();
  }

}