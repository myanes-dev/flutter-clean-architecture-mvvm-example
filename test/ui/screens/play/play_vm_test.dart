import 'package:flutter_clean_architecture_2022/domain/models/breed.dart';
import 'package:flutter_clean_architecture_2022/domain/models/result.dart';
import 'package:flutter_clean_architecture_2022/domain/usecasaes/game_builder_usecase.dart';
import 'package:flutter_clean_architecture_2022/domain/usecasaes/game_save_usecase.dart';
import 'package:flutter_clean_architecture_2022/ui/screens/play/play_vm.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../domain/test_data/roud_data.dart';
import 'play_vm_test.mocks.dart';

@GenerateMocks([GameCreatorUsecase])
final _gameCreator = MockGameCreatorUsecase();
@GenerateMocks([GameSaveUseCase])
final _gameSaver = MockGameSaveUseCase();

late PlayViewModel _viewModel;

void main() {
  setUp(() {
    _viewModel = PlayViewModel(
      gameCreatorUsecase: _gameCreator,
      gameSaveUseCase: _gameSaver,
    );
  });

  tearDown(() {
    _viewModel.dispose();
  });
  test('should show loading and hide after game is created', () async {
    when(_gameCreator.call(numOfRounds: 2)).thenAnswer(
      (realInvocation) async => Result(
        true,
        value: RoundTestData.twoValidGameRounds(),
      ),
    );

    expect(_viewModel.gameState.isLoading, true);
    await _viewModel.startGame();
    expect(_viewModel.gameState.isLoading, false);
  });

  test('should create a game with 2 rounds', () async {
    when(_gameCreator.call(numOfRounds: 2)).thenAnswer(
      (realInvocation) async => Result(
        true,
        value: RoundTestData.twoValidGameRounds(),
      ),
    );

    await _viewModel.startGame();
    expect(_viewModel.gameState.isLoading, false);
    expect(_viewModel.gameState.rounds.length, 2);
  });

  test('should save round result before moving to next', () async {
    when(_gameCreator.call(numOfRounds: 2)).thenAnswer(
      (realInvocation) async => Result(
        true,
        value: RoundTestData.twoValidGameRounds(),
      ),
    );

    await _viewModel.startGame();
    expect(_viewModel.gameState.roundsResults.length, 0);
    await _viewModel.onAnswer(Breed(name: "name"));
    expect(_viewModel.gameState.roundsResults.length, 1);
  });

  test('should move to next round after answering', () async {
    when(_gameCreator.call(numOfRounds: 2)).thenAnswer(
      (realInvocation) async => Result(
        true,
        value: RoundTestData.twoValidGameRounds(),
      ),
    );

    await _viewModel.startGame();
    expect(
      _viewModel.gameState.rounds[0].dog.id,
      _viewModel.gameState.currentRound?.dog.id,
    );
    await _viewModel.onAnswer(Breed(name: "name"));
    expect(
      _viewModel.gameState.rounds[1].dog.id,
      _viewModel.gameState.currentRound?.dog.id,
    );
  });

  test('should send navigation envent after answering last round', () async {
    when(_gameCreator.call(numOfRounds: 2)).thenAnswer(
      (realInvocation) async => Result(
        true,
        value: RoundTestData.twoValidGameRounds(),
      ),
    );

    when(_gameSaver.call(any)).thenAnswer(
      (realInvocation) async => Result(
        true,
      ),
    );

    await _viewModel.startGame();
    await _viewModel.onAnswer(Breed(name: "name"));
    await _viewModel.onAnswer(Breed(name: "name"));
    expect(_viewModel.viewEvents.value, PlayViewEvent.navigateToResultPage);
  });
}
