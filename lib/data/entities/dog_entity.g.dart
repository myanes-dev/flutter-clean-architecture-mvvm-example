// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DogEntityAdapter extends TypeAdapter<DogEntity> {
  @override
  final int typeId = 1;

  @override
  DogEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DogEntity(
      id: fields[0] as String,
      imageUrl: fields[1] as String,
      breed: fields[2] as BreedEntity?,
    );
  }

  @override
  void write(BinaryWriter writer, DogEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.breed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DogEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
