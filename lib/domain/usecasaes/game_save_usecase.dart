import 'package:flutter_clean_architecture_2022/domain/models/game_result.dart';
import 'package:flutter_clean_architecture_2022/domain/models/result.dart';
import 'package:flutter_clean_architecture_2022/domain/repository/game_repository.dart';

class GameSaveUseCase {
  final GameRespository _gameRespository;
  GameSaveUseCase({
    required GameRespository gameRespository,
  }) : _gameRespository = gameRespository;

  Future<Result> call(GameResult game) => _gameRespository.save(game);
}
