// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_result_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameResultEntityAdapter extends TypeAdapter<GameResultEntity> {
  @override
  final int typeId = 0;

  @override
  GameResultEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GameResultEntity(
      id: fields[0] as String,
      date: fields[1] as DateTime,
      results: (fields[2] as List).cast<RoundResultEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, GameResultEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.results);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameResultEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
