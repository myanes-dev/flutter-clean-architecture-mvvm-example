import 'package:flutter_clean_architecture_2022/domain/models/result.dart';
import 'package:flutter_clean_architecture_2022/domain/models/game_result.dart';
import 'package:flutter_clean_architecture_2022/domain/repository/game_repository.dart';

class LocalGameRepo implements GameRespository {
  // TODO: implement persistent data source like DB, SharedPreferences or similar
  List<GameResult> games = [];

  @override
  Future<Result> remove(String id) async {
    games.removeWhere((game) => game.id == id);
    return Result(true);
  }

  @override
  Future<Result> save(GameResult game) async {
    games.add(game);
    return Result(true);
  }

  @override
  Future<Result<List<GameResult>>> history() async {
    return Result(true, value: games);
  }
}
