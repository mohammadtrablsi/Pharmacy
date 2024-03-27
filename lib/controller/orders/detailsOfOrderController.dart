import 'package:get/get.dart';

class DetailsOfOrderController extends GetxController {
  String status="accepted";
  List dataList=[];
  bool isEnamated=true;
  var data;
  @override
  void onInit() async{
    data=Get.arguments[0]['data'];
    status=data['status'];
    await Future.delayed(const Duration(milliseconds: 400));
    isEnamated=false;
    update();
    super.onInit();
  }
}