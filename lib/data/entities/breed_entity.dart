import 'package:hive/hive.dart';

part 'breed_entity.g.dart';

@HiveType(typeId: 0)
class BreedEntity extends HiveObject {
  BreedEntity({required this.name});

  @HiveField(0)
  String name;
}
