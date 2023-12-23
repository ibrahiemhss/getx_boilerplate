// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeDataAdapter extends TypeAdapter<HomeData> {
  @override
  final int typeId = 17;

  @override
  HomeData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeData(
      about: fields[1] as About,
    );
  }

  @override
  void write(BinaryWriter writer, HomeData obj) {
    writer
      ..writeByte(1)
      ..writeByte(1)
      ..write(obj.about);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
