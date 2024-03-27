import 'package:get/get.dart';
import 'package:pharmacy/data/hive/forCartBox.dart';

import '../../core/functions/appSnackBar.dart';
import '../../data/hive/boxes/boxes.dart';

class MedicineItemController extends GetxController {
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
            totalSellerPrice:sellerPrice,
            totalBuyerPrice: buyerPrice,
           ));
    appSnackBar('Success', 'the item added to cart');
    print('$name ============================================1');
    print('$sellerPrice ============================================1');
    print('$buyerPrice ============================================1');
    print('$oldSellerPrice ============================================1');
    print('$offer ============================================1');
    print('$image ============================================1');
    print('$quantity ============================================1');
    print('$companyName ============================================1');
    print('$totalPriceOfItem ============================================1');


  }
}
