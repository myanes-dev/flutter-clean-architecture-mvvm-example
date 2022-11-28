import 'package:flutter_clean_architecture_2022/domain/models/round.dart';

class GameState {
  final bool isLoading;
  final RoundStatus roundStatus;
  final int roundIndex;
  final List<Round> rounds;
  final List<RoundResult> roundsResults;

  const GameState({
    required this.isLoading,
    required this.roundIndex,
    required this.roundStatus,
    required this.rounds,
    required this.roundsResults,
  });

  Round? get currentRound {
    if (rounds.length > roundIndex) {
      return rounds[roundIndex];
    }
    return null;
  }

  RoundResult? get currentRoundResult {
    if (roundsResults.length > roundIndex) {
      return roundsResults[roundIndex];
    }
    return null;
  }

  GameState copyWith({
    bool? isLoading,
    RoundStatus? roundStatus,
    int? roundIndex,
    List<Round>? rounds,
    List<RoundResult>? roundsResults,
  }) {
    return GameState(
      isLoading: isLoading ?? this.isLoading,
      roundStatus: roundStatus ?? this.roundStatus,
      roundIndex: roundIndex ?? this.roundIndex,
      rounds: rounds ?? this.rounds,
      roundsResults: roundsResults ?? this.roundsResults,
    );
  }
}
