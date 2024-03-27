// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favoriteBox.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavoriteBoxAdapter extends TypeAdapter<FavoriteBox> {
  @override
  final int typeId = 1;

  @override
  FavoriteBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavoriteBox(
      name: fields[0] as String,
      sellerPrice: fields[1] as String,
      buyerPrice: fields[2] as String,
      oldSellerPrice: fields[3] as String,
      offer: fields[4] as String,
      image: fields[5] as String,
      hasOffer1: fields[6] as bool,
      hasOffer2: fields[7] as dynamic,
      companyName: fields[8] as dynamic,
      expiringDate: fields[9] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, FavoriteBox obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.sellerPrice)
      ..writeByte(2)
      ..write(obj.buyerPrice)
      ..writeByte(3)
      ..write(obj.oldSellerPrice)
      ..writeByte(4)
      ..write(obj.offer)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.hasOffer1)
      ..writeByte(7)
      ..write(obj.hasOffer2)
      ..writeByte(8)
      ..write(obj.companyName)
      ..writeByte(9)
      ..write(obj.expiringDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavoriteBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
