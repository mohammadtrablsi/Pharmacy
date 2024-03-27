import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pharmacy/core/services/services.dart';
import 'package:pharmacy/data/hive/boxes/boxes.dart';


import '../../core/functions/appDialoge.dart';
import '../../core/functions/appSnackBar.dart';
import '../../core/functions/updateNumberOfWantedOrRatingByName.dart';
import '../../data/hive/forCartBox.dart';


class CartController extends GetxController {
  MyServices myServices=Get.find();
  CollectionReference orders = FirebaseFirestore.instance.collection('Orders');
  DateTime now = DateTime.now();
  Future<void> deleteItemInHive(ForCartBox item) async {
    appDialog('Alert','Are you shure you want to delete this?',()async{
      await forCartBox.delete(item.name);
          update();
          Get.back();
    });
  }

  Future<void> updateItemInHive(ForCartBox item,int casE) async {
    await forCartBox.put(
        item.name,
        ForCartBox(
          name: item.name,
          sellerPrice: item.sellerPrice,
          totalSellerPrice: casE==1?item.sellerPrice * ++item.quantity:--item.quantity>1?item.sellerPrice * item.quantity:item.sellerPrice,
          buyerPrice: item.buyerPrice,
          oldSellerPrice:item.oldSellerPrice,
          offer: item.offer,
          image: item.image,
          quantity: item.quantity>1?item.quantity:1,
          companyName: item.companyName,
          totalBuyerPrice: casE==1?item.buyerPrice * item.quantity:--item.quantity>1?item.buyerPrice * item.quantity:item.buyerPrice,

        )
    );
    update();
  }

  double getTotalPrice(int state){//1 seller
    double price=0;
    for(int i=0;i<forCartBox.length;i++){
      state==1?price+=forCartBox.getAt(i).totalSellerPrice:price+=forCartBox.getAt(i).totalBuyerPrice;
    }
    update();
    return price;
  }
  double getPriceOfOrder(List<Map>items){
    double price=0;
    for(int i=0;i<items.length;i++){
      price+=items[i]['price']*items[i]['quantity'];
    }
    update();
    return price;
  }

  List<Map> getAllProductsInCart(){
    List<Map>allProductsInCart=[];


    for(int i=0;i<forCartBox.length;i++){
      allProductsInCart.add({'name':forCartBox.getAt(i).name,'image':forCartBox.getAt(i).image,'price':forCartBox.getAt(i).sellerPrice,'quantity':forCartBox.getAt(i).quantity,'companyName':forCartBox.getAt(i).companyName} );
    }
    update();
    return allProductsInCart;
  }

  List<List<Map>> categorizeMedicines()  {
    Map<String, List<Map>> companyMedicineMap = {};
    for (int i = 0; i < forCartBox.length; i++) {
      if (!companyMedicineMap.containsKey(forCartBox.getAt(i).companyName)) {
        companyMedicineMap[forCartBox.getAt(i).companyName] = [];
      }
      companyMedicineMap[forCartBox.getAt(i).companyName]!.add({'name':forCartBox.getAt(i).name,'image':forCartBox.getAt(i).image,'price':forCartBox.getAt(i).sellerPrice,'quantity':forCartBox.getAt(i).quantity,'companyName':forCartBox.getAt(i).companyName});
    }
    List<List<Map>> categorizedMedicines = companyMedicineMap.values
        .toList();
    return categorizedMedicines;
  }

  String generateRandomNumber() {
    Random random = Random();
    int randomNumber = random.nextInt(900000000) + 100000000;
    return randomNumber.toString();
  }

  double getCountOfItems() {
    double count = 0;
    for (int i = 0; i < forCartBox.length; i++) {
      count += forCartBox.getAt(i).quantity;
    }
    update();
    return count;
  }

  dynamic makeOrders() async {
    appDialog('Alert', 'Are you sure to make the order?', () async {
      for (int i = 0; i < categorizeMedicines().length; i++) {
        await orders.add({
          'orderId': generateRandomNumber(),
          'status': 'mangement',
          'date': "${now.year}-${now.month}-${now.day}",
          'time': '${now.hour}:${now.minute}',
          'user': myServices.sharedPreferences.getString('nameOfUser'),
          'totalSellerPrice': getPriceOfOrder(categorizeMedicines()[i]),
          'List': categorizeMedicines()[i],
        });
      }
      forCartBox.clear();
      update();
      Get.back();
      appSnackBar('success', 'you made orders');
      updateNumberOfWantedForMedicines(1);
      forCartBox.clear();
      update();


    });
  }
  dynamic updateNumberOfWantedForMedicines(int state){//1 for wanted 2 for rating
    for(int i=0;i<forCartBox.length;i++){
      updateNumberOfWantedOrRatingByName(state,forCartBox
          .getAt(i)
          .name, forCartBox
          .getAt(i)
          .quantity);
    }
  }
}
