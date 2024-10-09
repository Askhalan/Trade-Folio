// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompanyModelAdapter extends TypeAdapter<CompanyModel> {
  @override
  final int typeId = 13;

  @override
  CompanyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompanyModel(
      symbol: fields[0] as String,
      name: fields[1] as String,
      region: fields[2] as String,
      marketOpen: fields[3] as String,
      marketClose: fields[4] as String,
      currency: fields[5] as String,
      quote: fields[7] as GlobalQuoteModel?,
      lastSyncTime: fields[6] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, CompanyModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.symbol)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.region)
      ..writeByte(3)
      ..write(obj.marketOpen)
      ..writeByte(4)
      ..write(obj.marketClose)
      ..writeByte(5)
      ..write(obj.currency)
      ..writeByte(6)
      ..write(obj.lastSyncTime)
      ..writeByte(7)
      ..write(obj.quote);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
