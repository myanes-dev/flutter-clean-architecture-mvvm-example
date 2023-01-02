// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breed_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BreedEntityAdapter extends TypeAdapter<BreedEntity> {
  @override
  final int typeId = 0;

  @override
  BreedEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BreedEntity(
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BreedEntity obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BreedEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
