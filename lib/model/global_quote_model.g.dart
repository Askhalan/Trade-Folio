// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_quote_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GlobalQuoteModelAdapter extends TypeAdapter<GlobalQuoteModel> {
  @override
  final int typeId = 12;

  @override
  GlobalQuoteModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GlobalQuoteModel(
      symbol: fields[0] as String,
      high: fields[1] as String,
      low: fields[2] as String,
      price: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GlobalQuoteModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.symbol)
      ..writeByte(1)
      ..write(obj.high)
      ..writeByte(2)
      ..write(obj.low)
      ..writeByte(3)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GlobalQuoteModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
