// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yeast_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class YeastAdapter extends TypeAdapter<Yeast> {
  @override
  final int typeId = 1;

  @override
  Yeast read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Yeast(
      yeast_name: fields[0] as String,
      max_abv: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Yeast obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.yeast_name)
      ..writeByte(2)
      ..write(obj.max_abv);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is YeastAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
