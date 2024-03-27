

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/core/functions/appDialoge.dart';
import 'package:pharmacy/core/functions/appSnackBar.dart';

import '../../core/services/services.dart';

class OrdersController extends GetxController{
  MyServices myServices=Get.find();
    int indexOfTapBar=0;
    List<String>statusOfOrder=['mangement','delivered','canceled'];
  List<Widget> taps = const [
    Tab(
      text: 'mangement',
    ),
    Tab(
      text: 'delivered',
    ),
    Tab(
      text: 'cancled',
    ),
  ];
  @override
  void onInit() async{
    // hasBackIconInAppBar=Get.arguments['hasBackIconInAppBar'];
    super.onInit();
  }


    Future<List<DocumentSnapshot>> fetchFireStore(String collectionName) async {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot;
        // Query douments based on the category only
        querySnapshot = await firestore
            .collection(collectionName)
            .where('status', isEqualTo: statusOfOrder[indexOfTapBar])
            .where('user',isEqualTo: myServices.sharedPreferences.getString('nameOfUser'))
            .get();


      return querySnapshot.docs;
    }
    void setIndexOfTapBar(indexOfTapBar){
      this.indexOfTapBar=indexOfTapBar;
      update();
    }



  dynamic onPressedDelete(collectionName,documentId) async {
      appDialog('Alert', 'Are you shure to delete this order?', () async{
        try {
          var documentReference = FirebaseFirestore.instance.collection(collectionName).doc(documentId);
          await documentReference.delete();
          update();
          Get.back();
          appSnackBar('success', 'the order deleted');
        } catch (e) {
          print('Error deleting document: $e');
        }
      });
  }
}