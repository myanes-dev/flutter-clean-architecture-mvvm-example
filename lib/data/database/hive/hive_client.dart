import 'package:flutter_clean_architecture_2022/data/database/game_db.dart';
import 'package:flutter_clean_architecture_2022/data/entities/breed_entity.dart';
import 'package:flutter_clean_architecture_2022/data/entities/dog_entity.dart';
import 'package:flutter_clean_architecture_2022/data/entities/game_result_entity.dart';
import 'package:flutter_clean_architecture_2022/data/entities/round_entity.dart';
import 'package:flutter_clean_architecture_2022/data/mappers/game_result.mapper.dart';
import 'package:flutter_clean_architecture_2022/domain/models/result.dart';
import 'package:flutter_clean_architecture_2022/domain/models/game_result.dart';
import 'package:hive/hive.dart';

initHiveAdapters() {
  Hive.registerAdapter(GameResultEntityAdapter());
  Hive.registerAdapter(DogEntityAdapter());
  Hive.registerAdapter(BreedEntityAdapter());
  Hive.registerAdapter(RoundEntityAdapter());
  Hive.registerAdapter(RoundResultEntityAdapter());
}

class HiveClient implements GameDB {
  static const String _games_box = 'GamesBox';

  @override
  Future<Result<List<GameResult>>> all() async {
    final box = await Hive.openBox<GameResultEntity>(_games_box);

    final results = box.values
        .map(
          (e) => GameResultMapper.toDomainFromEntity(e),
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
    final gameEntity = GameResultMapper.fromDomainToEntity(game);
    await box.put(game.id, gameEntity);
    await box.close();
    return;
  }
}
