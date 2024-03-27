import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CommentController extends GetxController {
  bool isEnmated=true;
  int numberOfRatings=0;
  dynamic data;
  @override
  Future<void> onInit() async {
    data=Get.arguments[0]['data'];
    await Future.delayed(const Duration(milliseconds: 400));
    isEnmated=false;
    update();
    super.onInit();
  }
  void setNumberOfRatings(number){
   numberOfRatings=number;
  //  update();
  }
//   Future<List<DocumentSnapshot>> fetchFireStore(String collectionName) async {
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   QuerySnapshot querySnapshot;
//     // Query documents based on the category only
//     querySnapshot = await firestore
//         .collection(collectionName)
//         .where('nameOfMedicine',isEqualTo: theNameOfMedicine)
//         .get();
//
//
//   return querySnapshot.docs;
// }


}