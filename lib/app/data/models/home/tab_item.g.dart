// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tab_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TabItemAdapter extends TypeAdapter<TabItem> {
  @override
  final int typeId = 20;

  @override
  TabItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TabItem(
      title: fields[1] as String,
      description: fields[2] as String,
      contents: (fields[3] as List?)?.cast<TabContent>(),
      summary: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TabItem obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.contents)
      ..writeByte(4)
      ..write(obj.summary);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TabItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
