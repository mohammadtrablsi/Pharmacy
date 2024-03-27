import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:pharmacy/core/constant/color.dart';
import 'package:pharmacy/core/services/services.dart';
import 'package:pharmacy/data/hive/favoriteBox.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

import '../../core/functions/appRatingDialog.dart';
import '../../core/functions/appSnackBar.dart';
import '../../core/functions/updateNumberOfWantedOrRatingByName.dart';
import '../../data/hive/boxes/boxes.dart';
import '../../data/hive/forCartBox.dart';

class MedicineDetailsController extends GetxController {
  CollectionReference Rating = FirebaseFirestore.instance.collection('Rating');
  MyServices myServices = Get.find();
  var data;
  bool  isFavorite=false;
  double rating = 2.5;
  String? tage;
  bool isEnimated = true;
  List listOfComments = [];

  DateTime now = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();

  // Format the date and time if needed
  String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String getCurrentTime() {
    // Get the current date and time
    DateTime now = DateTime.now();

    // Format the current time
    String formattedTime = DateFormat('HH:mm').format(now);

    return formattedTime;
  }

// @override
//   void onClose() {
//   MedicineDetailsController.dispose();
//
//     super.onClose();
//   }
  @override
  Future<void> onInit() async {
    data = Get.arguments[0]['data'];
    tage = Get.arguments[0]['tage'];
    isFavorite=hasFavorite();
    // print('${tage} iiiiiiiiiiiiii');
    print('${data['expiringDate']} iiiiiiiiiiiiii');
    print('${data['hasOffer2']} iiiiiiiiiiiiii');
    print('${data['hasOffer1']} iiiiiiiiiiiiii');
    print('${data['offer']} iiiiiiiiiiiiii');
    print('${data['buyerPrice']} iiiiiiiiiiiiii');
    print('${data['sellerPrice']} iiiiiiiiiiiiii');
    print('${data['fullName']} iiiiiiiiiiiiii');
    print('${data['image']} iiiiiiiiiiiiii');


    await Future.delayed(const Duration(milliseconds: 800));
    isEnimated = false;
    update();
    // await Future.delayed(const Duration(seconds: 10));

    super.onInit();
  }

  void setListOfComments(listOfComments) {
    this.listOfComments = listOfComments;
  }

  void setRatingNumber(double rating) {
    this.rating = rating; // Update the rating value
  }

  dynamic makeRating() {
    appRatingDialog(rating, () {
      Get.back();
      // Call the user's CollectionReference to add a new user
      Rating.add({
        'nameOfUser': myServices.sharedPreferences.getString('nameOfUser'),
        'nameOfMedicine': data['name'], // John Doe
        'numberOfRating': rating,
        'date': currentDate,
        'time': getCurrentTime(),
      });
    }, setRatingNumber);
    update();
    updateNumberRatingForMedicines(2);
  }

  Future<List<DocumentSnapshot>> fetchFireStore(String collectionName) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot;
      // Query documents based on the category only
      querySnapshot = await firestore
          .collection(collectionName)
          .where('nameOfMedicine', isEqualTo: data['name'])
          // .orderBy('date', descending: true)
          // .orderBy('time', descending: true)
          // .limit(1)
          .get();

      return querySnapshot.docs;
    } catch (e) {
      print("Error fetching Firestore documents: $e");
      return []; // Return an empty list or handle the error accordingly
    }
  }
  dynamic makeFavorite(FavoriteBox item){
    updateItemInHive(item);
    isFavorite=!isFavorite;
    update();

  }
  bool hasFavorite(){
    if(favoriteBox.containsKey(data['fullName'])){
      return true;
    }
    return false;
  }


  Future<void> updateItemInHive(FavoriteBox item) async {
    await favoriteBox.put(
        item.name,
        FavoriteBox(
          name: item.name,
          sellerPrice: item.sellerPrice,
          buyerPrice: item.buyerPrice,
          oldSellerPrice: item.oldSellerPrice,
          offer: item.offer,
          image: item.image,
          hasOffer1: item.hasOffer1,
          hasOffer2: item.hasOffer2,
          companyName: item.companyName,
          expiringDate: item.expiringDate,
        ));
    update();
    // await box.close();
  }
  Future<void> clickOnAddToCart(var name, int sellerPrice, int buyerPrice,
      int oldSellerPrice, var offer, var image, int quantity,var companyName,int totalPriceOfItem) async {
    await forCartBox.put(
        name,
        ForCartBox(
          name: name,
          sellerPrice: sellerPrice,
          buyerPrice: buyerPrice,
          oldSellerPrice: oldSellerPrice,
          offer: offer,
          image: image,
          quantity: quantity,
          companyName: companyName,
          totalSellerPrice: sellerPrice,
          totalBuyerPrice: buyerPrice,
        ));
    appSnackBar('Success', 'the item added to cart');
    // print('$name ============================================1');
    print('$sellerPrice ============================================1');
    print('$buyerPrice ============================================1');
    // print('$oldSellerPrice ============================================1');
    // print('$offer ============================================1');
    // print('$image ============================================1');
    // print('$quantity ============================================1');
    // print('$companyName ============================================1');
    // print('$totalPriceOfItem ============================================1');


    print('88888888888888888888888888888888888888${ forCartBox.getAt(0)}');

  }
  dynamic updateNumberRatingForMedicines(int state){//1 for wanted 2 for rating
    // for(int i=0;i<forCartBox.length;i++){
      updateNumberOfWantedOrRatingByName(state,data['fullName'],rating);
    // }
  }
}
