import 'package:flutter_clean_architecture_2022/domain/models/game_result.dart';
import 'package:flutter_clean_architecture_2022/domain/models/result.dart';

abstract class GameRespository {
  Future<Result<List<GameResult>>> history();
  Future<Result> remove(String id);
  Future<Result> save(GameResult game);
}
