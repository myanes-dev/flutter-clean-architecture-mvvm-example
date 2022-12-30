import 'package:flutter_clean_architecture_2022/domain/models/round.dart';

class GameResult {
  final DateTime date;
  final List<RoundResult> results;

  GameResult({
    required this.date,
    required this.results,
  });

  int get roundsOKcount => results.answersOKcount;
  int get roundsCount => results.length;
  String get id => date.toIso8601String();
}
