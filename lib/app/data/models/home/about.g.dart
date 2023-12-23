// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AboutAdapter extends TypeAdapter<About> {
  @override
  final int typeId = 15;

  @override
  About read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return About(
      miniTitle: fields[1] as String,
      mainContents: fields[2] as MainContents,
    )..isExpanded = fields[3] as bool;
  }

  @override
  void write(BinaryWriter writer, About obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.miniTitle)
      ..writeByte(2)
      ..write(obj.mainContents)
      ..writeByte(3)
      ..write(obj.isExpanded);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AboutAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
