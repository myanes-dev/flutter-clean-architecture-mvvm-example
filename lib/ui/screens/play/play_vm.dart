import 'package:flutter_clean_architecture_2022/domain/models/breed.dart';
import 'package:flutter_clean_architecture_2022/domain/models/round.dart';
import 'package:flutter_clean_architecture_2022/domain/usecasaes/game_builder_usecase.dart';
import 'package:flutter_clean_architecture_2022/ui/screens/play/game_state.dart';
import 'package:get/get.dart';

enum PlayViewEvent {
  navigateToResultPage,
}

class PlayViewModel extends GetxController {
  final GameCreatorUsecase gameCreatorUsecase;

  final Rx<GameState> _gameState = GameState(
    isLoading: true,
    roundIndex: 0,
    roundStatus: RoundStatus.PLAYING,
    rounds: List.empty(),
    roundsResults: List.empty(),
  ).obs;
  GameState get gameState => _gameState.value;

  final Rx<PlayViewEvent?> viewEvents = Rx(null);

  PlayViewModel({
    required this.gameCreatorUsecase,
  });

  @override
  void onInit() {
    _startGame();
    super.onInit();
  }

  void onAnswer(Breed breed) async {
    _gameState.value = _gameState.value.copyWith(
      roundStatus: RoundStatus.COMPLETED,
      roundsResults: [
        ..._gameState.value.roundsResults,
        RoundResult(
          round: _gameState.value.currentRound!,
          answer: breed,
        ),
      ],
    );

    // Wait for finish round animation before moving to next round
    await Future.delayed(const Duration(milliseconds: 300));
    _gameState.value = _gameState.value.copyWith(isLoading: true);
    if (_gameState.value.roundIndex + 1 == _gameState.value.rounds.length) {
      viewEvents.call(PlayViewEvent.navigateToResultPage);
    } else {
      _nextRound();
    }
  }

  void _startGame() async {
    await _createGame();
    _gameState.value = _gameState.value.copyWith(isLoading: false);
  }

  Future _createGame() async {
    final result = await gameCreatorUsecase(numOfRounds: 2);
    if (!result.success) {
      // TODO: show error;
      return;
    }
    _gameState.value = _gameState.value.copyWith(rounds: result.value);
  }

  void _nextRound() {
    _gameState.value = _gameState.value.copyWith(
      roundIndex: _gameState.value.roundIndex + 1,
      roundStatus: RoundStatus.PLAYING,
      isLoading: false,
    );
  }
}
