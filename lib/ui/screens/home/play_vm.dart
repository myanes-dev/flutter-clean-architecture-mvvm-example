import 'package:flutter_clean_architecture_2022/domain/models/breed.dart';
import 'package:flutter_clean_architecture_2022/domain/models/round.dart';
import 'package:flutter_clean_architecture_2022/domain/usecasaes/game_builder_usecase.dart';
import 'package:get/get.dart';

class PlayViewModel extends GetxController {
  final GameCreatorUsecase gameCreatorUsecase;

  final RxBool _isloading = true.obs;
  bool get isLoading => _isloading.value;

  final Rx<RoundStatus> _roundStatus = RoundStatus.PLAYING.obs;
  RoundStatus get roundStatus => _roundStatus.value;

  List<Round> _rounds = List<Round>.empty();
  final List<RoundResult> _roundsResults = [];
  final RxInt _roundIndex = 0.obs;
  Round? get currentRound {
    if (_rounds.length > _roundIndex.value) {
      return _rounds[_roundIndex.value];
    }
    return null;
  }

  RoundResult? get currentRoundResult {
    if (_roundsResults.length > _roundIndex.value) {
      return _roundsResults[_roundIndex.value];
    }
    return null;
  }

  PlayViewModel({
    required this.gameCreatorUsecase,
  });

  @override
  void onInit() {
    _startGame();
    super.onInit();
  }

  void onAnswer(Breed breed) async {
    _roundsResults.add(
      RoundResult(
        round: currentRound!,
        answer: breed,
      ),
    );
    _roundStatus.value = RoundStatus.COMPLETED;

    await Future.delayed(const Duration(milliseconds: 1000));
    _isloading.value = true;
    if (_roundIndex.value + 1 == _rounds.length) {
      // TODO: navigate to finish screen

    } else {
      _nextRound();
      _roundStatus.value = RoundStatus.PLAYING;
    }
    _isloading.value = false;
  }

  void _startGame() async {
    _isloading.value = true;
    await _createGame();
    _isloading.value = false;
  }

  Future _createGame() async {
    final result = await gameCreatorUsecase(numOfRounds: 2);
    if (result == null) {
      // TODO: show error;
      return;
    }
    _rounds = result;
  }

  void _nextRound() {
    _roundIndex.value = _roundIndex.value + 1;
  }
}
