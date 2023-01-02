import 'package:flutter_clean_architecture_2022/data/database/game_db.dart';
import 'package:flutter_clean_architecture_2022/data/entities/game_result_entity.dart';
import 'package:flutter_clean_architecture_2022/data/entities/round_entity.dart';
import 'package:flutter_clean_architecture_2022/data/mappers/breed_mapper.dart';
import 'package:flutter_clean_architecture_2022/data/mappers/round_mapper.dart';
import 'package:flutter_clean_architecture_2022/domain/models/result.dart';
import 'package:flutter_clean_architecture_2022/domain/models/game_result.dart';
import 'package:flutter_clean_architecture_2022/domain/models/round.dart';
import 'package:hive/hive.dart';

class HiveClient implements GameDB {
  static const String _games_box = 'GamesBox';

  @override
  Future<Result<List<GameResult>>> all() async {
    final box = await Hive.openBox<GameResultEntity>(_games_box);

    final results = box.values
        .map(
          (e) => GameResult(
            date: e.date,
            results: e.results
                .map((e) => RoundResult(
                      round: RoundMapper.toDomainFromEntity(e.round),
                      answer: BreedMapper.toDomainFromEntity(e.answer),
                    ))
                .toList(),
          ),
        )
        .toList();
    await box.close();

    return Result(true, value: results);
  }

  @override
  Future remove(String id) async {
    final box = await Hive.openBox<GameResultEntity>(_games_box);
    await box.delete(id);
    await box.close();
    return;
  }

  @override
  Future save(GameResult game) async {
    final box = await Hive.openBox<GameResultEntity>(_games_box);
    final gameEntity = GameResultEntity(
        id: game.id,
        date: game.date,
        results: game.results
            .map((e) => RoundResultEntity(
                  round: RoundMapper.fromDomainToEntity(e.round),
                  answer: BreedMapper.fromDomainToEntity(e.answer),
                ))
            .toList());
    await box.put(game.id, gameEntity);
    await box.close();
    return;
  }
}
