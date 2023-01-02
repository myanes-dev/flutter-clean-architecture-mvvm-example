import 'package:flutter_clean_architecture_2022/data/entities/breed_entity.dart';
import 'package:hive/hive.dart';

part 'dog_entity.g.dart';

@HiveType(typeId: 0)
class DogEntity extends HiveObject {
  DogEntity({
    required this.id,
    required this.imageUrl,
    this.breed,
  });

  @HiveField(0)
  String id;

  @HiveField(1)
  String imageUrl;

  @HiveField(2)
  BreedEntity? breed;
}
