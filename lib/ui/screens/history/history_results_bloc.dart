import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_2022/domain/models/game_result.dart';
import 'package:flutter_clean_architecture_2022/domain/usecasaes/game_history_usecase.dart';

class HistoryResultsState {
  final bool isLoading;
  final List<GameResult> results;
  HistoryResultsState({
    this.isLoading = true,
    required this.results,
  });

  HistoryResultsState copyWith({
    bool? isLoading,
    List<GameResult>? results,
  }) {
    return HistoryResultsState(
      isLoading: isLoading ?? this.isLoading,
      results: results ?? this.results,
    );
  }
}

class HistoryResultsBloc extends Cubit<HistoryResultsState> {
  final GameHistoryUseCase _gameHistoryUseCase;

  HistoryResultsBloc(this._gameHistoryUseCase)
      : super(HistoryResultsState(results: [])) {
    _loadData();
  }

  void _loadData() async {
    emit(state.copyWith(isLoading: true));

    final result = await _gameHistoryUseCase();

    // TODO: show errors
    emit(state.copyWith(
      isLoading: false,
      results: result.value ?? [],
    ));
  }
}
