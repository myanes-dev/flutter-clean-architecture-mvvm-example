import 'package:flutter_clean_architecture_2022/data/entities/round_entity.dart';
import 'package:flutter_clean_architecture_2022/data/mappers/breed_mapper.dart';
import 'package:flutter_clean_architecture_2022/data/mappers/dog_mapper.dart';
import 'package:flutter_clean_architecture_2022/domain/models/round.dart';

class RoundMapper {
  static Round toDomainFromEntity(RoundEntity entity) {
    return Round(
      dog: DogMapper.toDomainFromEntity(entity.dog),
      answers: entity.answers
          .map(
            (e) => BreedMapper.toDomainFromEntity(e),
          )
          .toList(),
    );
  }

  static RoundEntity fromDomainToEntity(Round domain) {
    return RoundEntity(
      dog: DogMapper.fromDomainToEntity(domain.dog),
      answers: domain.answers
          .map(
            (e) => BreedMapper.fromDomainToEntity(e),
          )
          .toList(),
    );
  }
}

class RoundResultMapper {
  static RoundResult toDomainFromEntity(RoundResultEntity entity) {
    return RoundResult(
      answer: BreedMapper.toDomainFromEntity(entity.answer),
      round: RoundMapper.toDomainFromEntity(entity.round),
    );
  }

  static RoundResultEntity fromDomainToEntity(RoundResult domain) {
    return RoundResultEntity(
      answer: BreedMapper.fromDomainToEntity(domain.answer),
      round: RoundMapper.fromDomainToEntity(domain.round),
    );
  }
}
