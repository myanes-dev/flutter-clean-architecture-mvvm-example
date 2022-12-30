import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_2022/domain/models/breed.dart';
import 'package:flutter_clean_architecture_2022/domain/models/dog.dart';
import 'package:flutter_clean_architecture_2022/domain/models/round.dart';

class HistoryResultsState {
  final bool isLoading;
  final List<RoundResult> results;
  HistoryResultsState({
    this.isLoading = true,
    required this.results,
  });
}

class HistoryResultsBloc extends Cubit<HistoryResultsState> {
  HistoryResultsBloc()
      : super(HistoryResultsState(
          results: [],
        )) {
    _loadData();
  }

  void _loadData() async {
    emit(HistoryResultsState(
      isLoading: true,
      results: [],
    ));

    await Future.delayed(const Duration(milliseconds: 2000));

    emit(HistoryResultsState(
      isLoading: false,
      results: [
        RoundResult(
          round: Round(
            dog: Dog(
              id: "",
              imageUrl: "imageUrl",
              breed: Breed(name: ""),
            ),
            answers: [],
          ),
          answer: Breed(name: ""),
        ),
        RoundResult(
          round: Round(
            dog: Dog(
              id: "",
              imageUrl: "imageUrl",
              breed: Breed(name: ""),
            ),
            answers: [],
          ),
          answer: Breed(name: ""),
        ),
      ],
    ));
  }
}
