import 'package:flutter_clean_architecture_2022/domain/models/breed.dart';
import 'package:flutter_clean_architecture_2022/domain/models/game_result.dart';
import 'package:flutter_clean_architecture_2022/domain/models/round.dart';
import 'package:flutter_clean_architecture_2022/domain/usecasaes/game_builder_usecase.dart';
import 'package:flutter_clean_architecture_2022/domain/usecasaes/game_save_usecase.dart';
import 'package:flutter_clean_architecture_2022/ui/screens/play/game_state.dart';
import 'package:get/get.dart';

enum PlayViewEvent {
  navigateToResultPage,
}

class PlayViewModel extends GetxController {
  final GameCreatorUsecase _gameCreatorUsecase;
  final GameSaveUseCase _gameSaveUseCase;

  final Rx<GameState> _gameState = GameState(
    isLoading: true,
    roundIndex: 0,
    rounds: List.empty(),
    roundsResults: List.empty(),
  ).obs;
  GameState get gameState => _gameState.value;

  final Rx<PlayViewEvent?> viewEvents = Rx(null);

  PlayViewModel({
    required GameCreatorUsecase gameCreatorUsecase,
    required GameSaveUseCase gameSaveUseCase,
  })  : _gameCreatorUsecase = gameCreatorUsecase,
        _gameSaveUseCase = gameSaveUseCase;

  @override
  void onInit() {
    startGame();
    super.onInit();
  }

  Future onAnswer(Breed breed) async {
    _gameState.value = _gameState.value.copyWith(
      isLoading: true,
      roundsResults: [
        ..._gameState.value.roundsResults,
        RoundResult(
          round: _gameState.value.currentRound!,
          answer: breed,
        ),
      ],
    );

    if (_gameState.value.roundIndex + 1 == _gameState.value.rounds.length) {
      await _saveGame();
      viewEvents.call(PlayViewEvent.navigateToResultPage);
    } else {
      await _nextRound();
    }
  }

  Future startGame() async {
    await _createGame();
    _gameState.value = _gameState.value.copyWith(isLoading: false);
  }

  Future _createGame() async {
    final result = await _gameCreatorUsecase(numOfRounds: 2);
    if (!result.success) {
      // TODO: show error;
      return;
    }
    _gameState.value = _gameState.value.copyWith(rounds: result.value);
  }

  Future<void> _saveGame() async {
    // Delay between rounds
    await Future.delayed(const Duration(milliseconds: 300));
    _gameSaveUseCase.call(GameResult(
      date: DateTime.now(),
      results: gameState.roundsResults,
    ));
  }

  Future<void> _nextRound() async {
    // Delay between rounds
    await Future.delayed(const Duration(milliseconds: 300));

    _gameState.value = _gameState.value.copyWith(
      roundIndex: _gameState.value.roundIndex + 1,
      isLoading: false,
    );
  }
}
