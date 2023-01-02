import 'package:flutter_clean_architecture_2022/data/database/game_db.dart';
import 'package:flutter_clean_architecture_2022/domain/models/result.dart';
import 'package:flutter_clean_architecture_2022/domain/models/game_result.dart';
import 'package:flutter_clean_architecture_2022/domain/repository/game_repository.dart';

class LocalGameRepo implements GameRespository {
  final GameDB _database;

  LocalGameRepo(this._database);

  @override
  Future<Result> remove(String id) async {
    await _database.remove(id);
    return Result(true);
  }

  @override
  Future<Result> save(GameResult game) async {
    await _database.save(game);
    return Result(true);
  }

  @override
  Future<Result<List<GameResult>>> history() async {
    return _database.all();
  }
}
