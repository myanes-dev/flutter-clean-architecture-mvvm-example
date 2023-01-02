import 'package:flutter_clean_architecture_2022/data/entities/breed_entity.dart';
import 'package:flutter_clean_architecture_2022/domain/models/breed.dart';

class BreedMapper {
  static Breed toDomainFromEntity(BreedEntity entity) {
    return Breed(name: entity.name);
  }

  static BreedEntity fromDomainToEntity(Breed domain) {
    return BreedEntity(name: domain.name);
  }
}
