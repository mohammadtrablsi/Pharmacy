import 'package:hive/hive.dart';

part 'forCartBox.g.dart';

@HiveType(typeId: 2)
class ForCartBox {
  ForCartBox(
      {required this.name,
      required this.sellerPrice,
      required this.buyerPrice,
      required this.oldSellerPrice,
      required this.offer,
      required this.image,
      required this.quantity,
      required this.companyName,
      required this.totalSellerPrice,
      required this.totalBuyerPrice,
      });
  @HiveField(0)
  String name;

  @HiveField(1)
  int sellerPrice;

  @HiveField(2)
  int buyerPrice;

  @HiveField(3)
  int oldSellerPrice;

  @HiveField(4)
  String offer;

  @HiveField(5)
  String image;

  @HiveField(6)
   int quantity;//int

  @HiveField(7)
  var companyName;

  @HiveField(8)
  var totalSellerPrice;

  @HiveField(9)
  var totalBuyerPrice;

}
