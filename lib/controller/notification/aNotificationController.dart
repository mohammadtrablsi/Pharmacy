import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ANotificationController extends GetxController{
  bool isEnmated=true;
  // dynamic hasBackIconInAppBar=false;
  @override
  void onInit() async{
    // hasBackIconInAppBar=Get.arguments[0]['hasBackIconInAppBar'];
    await Future.delayed(const Duration(microseconds: 400));
    isEnmated=false;
    update();
    super.onInit();
  }
  Future<List<DocumentSnapshot>> fetchFireStore(String collectionName) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot;

    querySnapshot = await firestore
        .collection(collectionName)
        .get();


      return querySnapshot.docs; // Return the documents
    }

}