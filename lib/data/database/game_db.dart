import 'package:flutter_clean_architecture_2022/domain/models/game_result.dart';
import 'package:flutter_clean_architecture_2022/domain/models/result.dart';

abstract class GameDB {
  Future remove(String id);
  Future save(GameResult game);
  Future<Result<List<GameResult>>> all();
}
