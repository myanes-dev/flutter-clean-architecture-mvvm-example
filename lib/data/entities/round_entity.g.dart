// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'round_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RoundEntityAdapter extends TypeAdapter<RoundEntity> {
  @override
  final int typeId = 2;

  @override
  RoundEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RoundEntity(
      dog: fields[0] as DogEntity,
      answers: (fields[1] as List).cast<BreedEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, RoundEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.dog)
      ..writeByte(1)
      ..write(obj.answers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoundEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RoundResultEntityAdapter extends TypeAdapter<RoundResultEntity> {
  @override
  final int typeId = 3;

  @override
  RoundResultEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RoundResultEntity(
      round: fields[0] as RoundEntity,
      answer: fields[1] as BreedEntity,
    );
  }

  @override
  void write(BinaryWriter writer, RoundResultEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.round)
      ..writeByte(1)
      ..write(obj.answer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RoundResultEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
