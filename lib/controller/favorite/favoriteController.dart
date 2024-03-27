import 'package:get/get.dart';
import 'package:pharmacy/core/functions/appDialoge.dart';
import 'package:pharmacy/core/functions/appSnackBar.dart';
import 'package:pharmacy/core/services/services.dart';
import 'package:pharmacy/data/hive/boxes/boxes.dart';

class FavoriteController extends GetxController{
  bool isEnmated=true;
  MyServices myServices=Get.find();

  @override
  void onInit() async{
    await Future.delayed(const Duration(microseconds:400));
    isEnmated=false;
    update();
    super.onInit();
  }

  void onPressedDelete(int index) async {
    appDialog('Alert', 'Do you want to delete this medicine?', () async{
      await favoriteBox.deleteAt(index);
      update();
      Get.back();
      appSnackBar('success', 'the medicine is deleted');
    });

  }

}