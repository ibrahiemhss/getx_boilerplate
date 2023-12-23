// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_home.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BodyHomeAdapter extends TypeAdapter<BodyHome> {
  @override
  final int typeId = 16;

  @override
  BodyHome read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BodyHome(
      tabs: (fields[1] as List).cast<TabItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, BodyHome obj) {
    writer
      ..writeByte(1)
      ..writeByte(1)
      ..write(obj.tabs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BodyHomeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
