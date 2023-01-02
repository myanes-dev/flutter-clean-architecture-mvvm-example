import 'package:flutter_clean_architecture_2022/data/entities/breed_entity.dart';
import 'package:flutter_clean_architecture_2022/data/entities/dog_entity.dart';
import 'package:hive/hive.dart';

part 'round_entity.g.dart';

@HiveType(typeId: 0)
class RoundEntity {
  RoundEntity({
    required this.dog,
    required this.answers,
  });

  @HiveField(0)
  DogEntity dog;

  @HiveField(1)
  List<BreedEntity> answers;
}

@HiveType(typeId: 0)
class RoundResultEntity {
  RoundResultEntity({
    required this.round,
    required this.answer,
  });

  @HiveField(0)
  RoundEntity round;

  @HiveField(1)
  BreedEntity answer;
}
