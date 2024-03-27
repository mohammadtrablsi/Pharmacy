// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forCartBox.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ForCartBoxAdapter extends TypeAdapter<ForCartBox> {
  @override
  final int typeId = 2;

  @override
  ForCartBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ForCartBox(
      name: fields[0] as String,
      sellerPrice: fields[1] as int,
      buyerPrice: fields[2] as int,
      oldSellerPrice: fields[3] as int,
      offer: fields[4] as String,
      image: fields[5] as String,
      quantity: fields[6] as int,
      companyName: fields[7] as dynamic,
      totalSellerPrice: fields[8] as dynamic,
      totalBuyerPrice: fields[9] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, ForCartBox obj) {
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
      ..write(obj.quantity)
      ..writeByte(7)
      ..write(obj.companyName)
      ..writeByte(8)
      ..write(obj.totalSellerPrice)
      ..writeByte(9)
      ..write(obj.totalBuyerPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ForCartBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
