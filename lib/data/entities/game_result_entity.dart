import 'package:flutter_clean_architecture_2022/data/entities/round_entity.dart';
import 'package:hive/hive.dart';

part 'game_result_entity.g.dart';

@HiveType(typeId: 0)
class GameResultEntity extends HiveObject {
  GameResultEntity({
    required this.id,
    required this.date,
    required this.results,
  });

  @HiveField(0)
  String id;

  @HiveField(1)
  DateTime date;

  @HiveField(2)
  List<RoundResultEntity> results;
}
