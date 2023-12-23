// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_contents.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MainContentsAdapter extends TypeAdapter<MainContents> {
  @override
  final int typeId = 18;

  @override
  MainContents read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MainContents(
      miniTitle: fields[1] as String,
      title: fields[2] as String,
      description: fields[3] as String,
      body: fields[4] as BodyHome,
    );
  }

  @override
  void write(BinaryWriter writer, MainContents obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.miniTitle)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.body);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainContentsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
