import 'package:flutter_clean_architecture_2022/domain/models/result.dart';
import 'package:flutter_clean_architecture_2022/domain/repository/game_repository.dart';

class GameRemoveUseCase {
  final GameRespository _gameRespository;
  GameRemoveUseCase({
    required GameRespository gameRespository,
  }) : _gameRespository = gameRespository;

  Future<Result> call(String gameID) => _gameRespository.remove(gameID);
}
