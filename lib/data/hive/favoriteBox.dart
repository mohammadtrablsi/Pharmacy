import 'package:hive/hive.dart';

part 'favoriteBox.g.dart';

@HiveType(typeId: 1)
class FavoriteBox {
  FavoriteBox(
      {required this.name,
      required this.sellerPrice,
      required this.buyerPrice,
      required this.oldSellerPrice,
      required this.offer,
      required this.image,
      required this.hasOffer1,
      required this.hasOffer2,
      required this.companyName,
      required this.expiringDate,
      });
  @HiveField(0)
  String name;

  @HiveField(1)
  String sellerPrice;

  @HiveField(2)
  String buyerPrice;

  @HiveField(3)
  String oldSellerPrice;

  @HiveField(4)
  String offer;

  @HiveField(5)
  String image;

  @HiveField(6)
  bool hasOffer1;

  @HiveField(7)
  var hasOffer2;/////////////bool
  @HiveField(8)
  var companyName;
  @HiveField(9)
  var expiringDate;
}
