import 'package:flutter_clean_architecture_2022/domain/models/game_result.dart';
import 'package:flutter_clean_architecture_2022/domain/models/result.dart';
import 'package:flutter_clean_architecture_2022/domain/usecasaes/game_history_usecase.dart';
import 'package:flutter_clean_architecture_2022/domain/usecasaes/game_remove_usecase.dart';
import 'package:flutter_clean_architecture_2022/ui/screens/history/history_results_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'history_results_bloc_test.mocks.dart';

@GenerateMocks([GameRemoveUseCase])
final _gameRemove = MockGameRemoveUseCase();
@GenerateMocks([GameHistoryUseCase])
final _gameHistory = MockGameHistoryUseCase();
late HistoryResultsBloc _bloc;

void main() {
  setUp(() {
    _bloc = HistoryResultsBloc(
      _gameHistory,
      _gameRemove,
    );
  });

  tearDown(() {
    _bloc.close();
  });
  test('loading should show and hide', () async {
    when(_gameHistory.call()).thenAnswer(
      (realInvocation) async => Result(
        true,
        value: [],
      ),
    );

    expect(_bloc.state.isLoading, true);

    expectLater(
      _bloc.stream,
      emitsInOrder(
        [
          isA<HistoryResultsState>()
              .having((e) => e.isLoading, 'loading', true),
          isA<HistoryResultsState>()
              .having((e) => e.isLoading, 'loading', false),
        ],
      ),
    );

    await _bloc.loadData();
    expect(
      _bloc.state,
      isA<HistoryResultsState>().having((e) => e.isLoading, 'loading', false),
    );
  });

  test('should show empty list when data is null', () async {
    when(_gameHistory.call()).thenAnswer(
      (realInvocation) async => Result(
        false,
        value: null,
      ),
    );

    await _bloc.loadData();

    expect(_bloc.state.isLoading, false);
    expect(_bloc.state.results, []);
  });

  test('should show list when success loading data', () async {
    when(_gameHistory.call()).thenAnswer(
      (realInvocation) async => Result(
        true,
        value: [
          GameResult(date: DateTime.now(), results: []),
        ],
      ),
    );

    await _bloc.loadData();
    expect(_bloc.state.isLoading, false);
    expect(_bloc.state.results.length, 1);
  });
}
