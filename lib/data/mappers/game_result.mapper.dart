import 'package:flutter_clean_architecture_2022/data/entities/game_result_entity.dart';
import 'package:flutter_clean_architecture_2022/data/mappers/round_mapper.dart';
import 'package:flutter_clean_architecture_2022/domain/models/game_result.dart';

class GameResultMapper {
  static GameResult toDomainFromEntity(GameResultEntity entity) {
    return GameResult(
      date: entity.date,
      results: entity.results
          .map((e) => RoundResultMapper.toDomainFromEntity(e))
          .toList(),
    );
  }

  static GameResultEntity fromDomainToEntity(GameResult domain) {
    return GameResultEntity(
      id: domain.id,
      date: domain.date,
      results: domain.results
          .map((e) => RoundResultMapper.fromDomainToEntity(e))
          .toList(),
    );
  }
}
