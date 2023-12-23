// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tab_content.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TabContentAdapter extends TypeAdapter<TabContent> {
  @override
  final int typeId = 19;

  @override
  TabContent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TabContent(
      title: fields[1] as String,
      description: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TabContent obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TabContentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
