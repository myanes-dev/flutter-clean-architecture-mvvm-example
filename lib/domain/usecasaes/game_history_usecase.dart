import 'package:flutter_clean_architecture_2022/domain/models/game_result.dart';
import 'package:flutter_clean_architecture_2022/domain/models/result.dart';
import 'package:flutter_clean_architecture_2022/domain/repository/game_repository.dart';

class GameHistoryUseCase {
  final GameRespository _gameRespository;
  GameHistoryUseCase({
    required GameRespository gameRespository,
  }) : _gameRespository = gameRespository;

  Future<Result<List<GameResult>>> call() => _gameRespository.history();
}
