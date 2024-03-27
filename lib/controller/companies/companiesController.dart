import 'package:get/get.dart';

class CompaniesController extends GetxController{
  var data;
  @override
  void onInit() {
     data= Get.arguments[0]['data'];
    super.onInit();
  }
}